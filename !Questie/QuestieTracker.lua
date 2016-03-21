local function log(msg) DEFAULT_CHAT_FRAME:AddMessage(msg) end -- alias for convenience

QuestieTracker = CreateFrame("Frame", "QuestieTracker", UIParent, "ActionButtonTemplate")

function QuestieTracker:OnEvent() -- functions created in "object:method"-style have an implicit first parameter of "this", which points to object || in 1.12 parsing arguments as ... doesn't work
	QuestieTracker[event](QuestieTracker, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10) -- route event parameters to Questie:event methods
end

QuestieTracker.hasCleared = false
QuestieTracker.lastUpdate = 0;

function QuestieTracker_OnUpdate()
	if(EQL3_QuestWatchFrame) then
		EQL3_QuestWatchFrame:Hide();
	end
	if GetTime() - QuestieTracker.lastUpdate >= 1 then
		QuestieTracker:fillTrackingFrame()
		QuestieTracker.lastUpdate = GetTime()
		QuestieTracker:syncEQL3()
		if (QuestieConfig.showMapAids == true) or (QuestieConfig.alwaysShowQuests == true) or ((QuestieConfig.showMapAids == true) and (QuestieConfig.alwaysShowQuests == false)) then
			Questie:SetAvailableQuests()
			Questie:RedrawNotes()
		end
	end
end

QuestieTracker:SetScript("OnEvent", QuestieTracker.OnEvent)
QuestieTracker:SetScript("OnUpdate", QuestieTracker_OnUpdate)
QuestieTracker:RegisterEvent("PLAYER_LOGIN")
QuestieTracker:RegisterEvent("ADDON_LOADED")

local _QuestWatch_Update = QuestWatch_Update;
local _RemoveQuestWatch = RemoveQuestWatch;
local _IsQuestWatched = IsQuestWatched;
local _GetNumQuestWatches = GetNumQuestWatches;
local _AddQuestWatch = AddQuestWatch;
local _GetQuestIndexForWatch = GetQuestIndexForWatch;
local _QuestLogTitleButton_OnClick = QuestLogTitleButton_OnClick;

-- begin ui code

QuestieTracker.questButtons = {};
QuestieTracker.questNames = {};
QuestieTracker.questObjects = {};
QuestieTracker.MaxButtonWidths = {};
QuestieTracker.GeneralInterval = 0;
QuestieTracker.btnUpdate = 1;

function QuestieTracker:updateTrackingFrameSize()
	if (QuestieConfig.trackerList == true) then
		local lastButton = QuestieTracker.questButtons[QuestieTracker.highestIndex];
		if lastButton == nil then return; end
		local lastbuttonTop = lastButton:GetTop();
		local trackerBottom = QuestieTracker.frame:GetBottom();
		local maxWidth = QuestieTracker.questButtons.maxWidth
		-- what if nothing is tracked?
		if trackerBottom == nil then trackerBottom = 0; end
		if lastbuttonTop == nil then lastbuttonTop = 0; end
		if maxWidth == nil then maxWidth = 0; end
		-- dynamically set the size of the tracker
		local totalHeight = lastbuttonTop - trackerBottom;
		local totalWidth = maxWidth;
		QuestieTracker.frame:SetWidth(totalWidth);
		if (QuestieConfig.showTrackerHeader == true) then
			QuestieTracker.frame:SetHeight(totalHeight + 24);
		elseif (QuestieConfig.showTrackerHeader == false) then
			QuestieTracker.frame:SetHeight(totalHeight + 10);
		end
	elseif (QuestieConfig.trackerList == false) then
		local lastButton = QuestieTracker.questButtons[QuestieTracker.highestIndex];
		if lastButton == nil then return; end
		local lastbuttonBottom = lastButton:GetBottom();
		local trackerTop = QuestieTracker.frame:GetTop();
		local maxWidth = QuestieTracker.questButtons.maxWidth
		-- what if nothing is tracked?
		if trackerTop == nil then trackerTop = 0; end
		if lastbuttonBottom == nil then lastbuttonBottom = 0; end
		if maxWidth == nil then maxWidth = 0; end
		-- dynamically set the size of the tracker
		local totalHeight = trackerTop - lastbuttonBottom;
		local totalWidth = maxWidth;
		QuestieTracker.frame:SetWidth(totalWidth);
		if (QuestieConfig.showTrackerHeader == true) then
			QuestieTracker.frame:SetHeight(totalHeight + 10);
		elseif (QuestieConfig.showTrackerHeader == false) then
			QuestieTracker.frame:SetHeight(totalHeight + 10);
		end
	end
end

function QuestieTracker:getRGBForObjectiveBold(objective)
	if not (type(objective) == "function") then
		local lastIndex = findLast(objective, ":");
		if not (lastIndex == nil) then
			local progress = string.sub(objective, lastIndex+2);
			local slash = findLast(progress, "/");
			local have = tonumber(string.sub(progress, 0, slash-1))
			local need = tonumber(string.sub(progress, slash+1))
			if not have or not need then
				return 1, 0, 0;
			end
			local float = have / need;
			if float < .49 then
				return 1, 0+float/.5, 0;
			end
			if float == .50 then
				return 1, 1, 0;
			end
			if float > .50 then
				return 1-float/2, 1, 0;
			end
		end
	end
	return 0, 1, 0;
end

function QuestieTracker:getRGBForObjective(objective)
	if not (type(objective) == "function") then -- seriously wtf
		local lastIndex = findLast(objective, ":");
		if not (lastIndex == nil) then -- I seriously CANT shake this habit
			local progress = string.sub(objective, lastIndex+2);
			-- There HAS to be a better way of doing this
			local slash = findLast(progress, "/");
			local have = tonumber(string.sub(progress, 0, slash-1))
			local need = tonumber(string.sub(progress, slash+1))
			if not have or not need then
				return 0.8, 0.8, 0.8;
			end
			local float = have / need;
			return 0.8-float/2, 0.8+float/3, 0.8-float/2;
		end
	end
	return 0.3, 1, 0.3;
end

function QuestieTracker:clearTrackingFrame()
	for i=1, 8 do
		getglobal("QuestieTrackerButton"..i):Hide();
		for j=1,20 do
			getglobal("QuestieTrackerButton"..i.."QuestWatchLine"..j):Hide();
		end
	end
end

function QuestieTracker:createOrGetTrackingButton(index)
	if QuestieTracker.questButtons[index] == nil then
		local parent;
		local parentString;
		if index == 1 then
			parent = QuestieTracker.frame;
		else
			parent = QuestieTracker.questButtons[index-1]; -- this allows easy dynamic positioning
		end
		local btn = CreateFrame("Button", "QuestieTrackerButtonNew"..index, QuestieTracker.frame);
		btn.objectives = {};
		btn:SetWidth(0);
		btn:SetHeight(0);
		btn:EnableMouse(true);
		btn:SetMovable(true);
		btn:SetScript("OnDragStart", QuestieTracker.frame.StartMoving)
		btn:SetScript("OnDragStop", QuestieTracker.frame.StopMovingOrSizing)
		btn:SetScript("OnMouseDown", function()
			btn.dragstartx, btn.dragstarty = GetCursorPosition();
			if IsControlKeyDown() and IsShiftKeyDown() then
				QuestieTracker.frame:StartMoving();
			end
		end);
		btn:SetScript("OnMouseUp", function()
			local dragstopx, dragstopy = GetCursorPosition();
			if (btn.dragstartx == dragstopx and btn.dragstarty == dragstopy) then
				btn:click();
			end
			QuestieTracker.frame:StopMovingOrSizing();
			QuestieTracker.frame:SetUserPlaced(false);
			QuestieTracker:saveFramePosition();
		end);
		btn.dragstartx = 0;
		btn.dragstarty = 0;
		btn:SetScript("OnEnter", function()
			QuestieTracker.frame.texture:SetAlpha(0.3);
		end);
		btn:SetScript("OnLeave", function()
			QuestieTracker.frame.texture:SetAlpha(0.0);
		end);
		btn:RegisterForClicks("RightButtonDown","LeftButtonUp", "LeftClick");
		btn.click = function()
			if (QuestieConfig.arrowEnabled == true) then
				SetArrowObjective(btn.hash);
			else
				return
			end
		end
		if (QuestieConfig.showTrackerHeader == true) then
			if (QuestieConfig.trackerList == true) then
				if index == 1 then
					btn:SetPoint("BOTTOMLEFT", parent, "BOTTOMLEFT", 0, 10);
				else
					btn:SetPoint("BOTTOMLEFT", parent, "TOPLEFT",  0, 2);
				end
			elseif (QuestieConfig.trackerList == false) then
				if index == 1 then
					btn:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -22);
				else
					btn:SetPoint("TOPLEFT", parent, "BOTTOMLEFT",  0, -2);
				end
			end
		elseif (QuestieConfig.showTrackerHeader == false) then
			if (QuestieConfig.trackerList == true) then
				if index == 1 then
					btn:SetPoint("BOTTOMLEFT", parent, "BOTTOMLEFT", 0, 0);
				else
					btn:SetPoint("BOTTOMLEFT", parent, "TOPLEFT",  0, 0);
				end
			elseif (QuestieConfig.trackerList == false) then
				if index == 1 then
					btn:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -10);
				else
					btn:SetPoint("TOPLEFT", parent, "BOTTOMLEFT",  0, -2);
				end
			end
		end
		local quest = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
		quest:SetPoint("TOPLEFT", btn, "TOPLEFT", 10, 0)
		btn.quest = quest;
		local level = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
		level:SetPoint("TOPLEFT", btn, "TOPLEFT", 10, 0)
		btn.level = level;
		QuestieTracker.questButtons[index] = btn;
	end
	return QuestieTracker.questButtons[index];
end

QuestieTracker.highestIndex = 0;

function QuestieTracker:GetDifficultyColor(level)
	if level == nil then return "FFFFFFFF"; end
	local levelDiff = level - UnitLevel("player");
	if ( levelDiff >= 5 ) then
		return "FFFF1A1A";
	elseif ( levelDiff >= 3 ) then
		return "FFFF8040";
	elseif ( levelDiff >= -2 ) then
		return "FFFFFF00";
	elseif ( -levelDiff <= GetQuestGreenRange() ) then
		return "FF40C040";
	else
		return "FFC0C0C0";
	end
end

local function RGBToHex(r, g, b)
	if r > 255 then r = 255; end
	if g > 255 then g = 255; end
	if b > 255 then b = 255; end;
	return string.format("%02x%02x%02x", r, g, b)
end

local function fRGBToHex(r, g, b)
	return RGBToHex(r*254, g*254, b*254);
end

function QuestieTracker:AddObjectiveToButton(button, objective, index)
	local objt;
	if button.objectives[index] == nil then
		objt = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	else
		objt = button.objectives[index];
	end
	objt:SetPoint("TOPLEFT", button, "TOPLEFT", 20, -(index * 12+1))
	if QuestieConfig.boldColors == true then
		local r, g, b = QuestieTracker:getRGBForObjectiveBold(objective["desc"]);
		local clr = fRGBToHex(r, g, b);
		objt:SetText("|cFF"..clr..objective["desc"].."|r");
		button.objectives[index] = objt;
	else
		local r, g, b = QuestieTracker:getRGBForObjective(objective["desc"]);
		local clr = fRGBToHex(r, g, b);
		objt:SetText("|cFF"..clr..objective["desc"].."|r");
		button.objectives[index] = objt;
	end
	for i, v in (button.objectives) do
		local otextWidth = button.objectives[i]:GetStringWidth() + 32
		table.insert(QuestieTracker.questObjects, otextWidth);
	end
	local omaxWidth = 0
	for i, v in ipairs(QuestieTracker.questObjects) do
		if (QuestieTracker.questObjects) then
			omaxWidth = math.max(omaxWidth, v)
			table.insert(QuestieTracker.MaxButtonWidths, omaxWidth);
			QuestieTracker.questObjects = {};
		end
	end
end

function QuestieTracker:AddEventToButton(button, objective, index)
	local objt;
	if button.objectives[index] == nil then
		objt = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	else
		objt = button.objectives[index];
	end
	objt:SetPoint("TOPLEFT", button, "TOPLEFT", 20, -(index * 11+1))
	if QuestieConfig.boldColors == true then
		local r, g, b = QuestieTracker:getRGBForObjectiveBold(objective["desc"]);
		local clr = fRGBToHex(r, g, b);
		objt:SetText("|cFFFF0000"..objective["desc"].."|r");
		button.objectives[index] = objt;
	else
		local r, g, b = QuestieTracker:getRGBForObjective(objective["desc"]);
		local clr = fRGBToHex(r, g, b);
		objt:SetText("|cFFCCCCCC"..objective["desc"].."|r");
		button.objectives[index] = objt;
	end
	for i, v in (button.objectives) do
		local otextWidth = button.objectives[i]:GetStringWidth() + 32
		table.insert(QuestieTracker.questObjects, otextWidth);
	end
	local omaxWidth = 0
	for i, v in ipairs(QuestieTracker.questObjects) do
		if (QuestieTracker.questObjects) then
			omaxWidth = math.max(omaxWidth, v)
			table.insert(QuestieTracker.MaxButtonWidths, omaxWidth);
			QuestieTracker.questObjects = {};
		end
	end
end

function QuestieTracker:GetFinisherLocation(typ, name)
	local C, Z, X, Y;
	if typ == "monster" then
		local npc = QuestieMonsters[name];
		if npc == nil then
			npc = QuestieAdditionalStartFinishLookup[name];
			if not (npc == nil) then
				C, Z, X, Y = npc[1], npc[2], npc[3], npc[4];
			else
			end
		else
			local loc = npc['locations'][1];
			mapid = loc[1];
			x = loc[2];
			y = loc[3];
			C, Z, X, Y = QuestieZoneIDLookup[mapid][4], QuestieZoneIDLookup[mapid][5], x, y
		end
	elseif typ == "object" then
		local obj = QuestieObjects[name];
		if not (obj == nil) then
			local loc = obj['locations'][1];
			mapid = loc[1];
			x = loc[2];
			y = loc[3];
			C, Z, X, Y = QuestieZoneIDLookup[mapid][4], QuestieZoneIDLookup[mapid][5], x, y
		else
			local npc = QuestieMonsters[name];
			if npc == nil then
				npc = QuestieAdditionalStartFinishLookup[name];
				if not (npc == nil) then
					C, Z, X, Y = npc[1], npc[2], npc[3], npc[4];
				else
				end
			else
				local loc = npc['locations'][1];
				mapid = loc[1];
				x = loc[2];
				y = loc[3];
				C, Z, X, Y = QuestieZoneIDLookup[mapid][4], QuestieZoneIDLookup[mapid][5], x, y
			end
		end
	end
	return C, Z, X, Y;
end

function QuestieTracker:fillTrackingFrame()
	local index = 1;
	local sortedByDistance = {};
	local distanceControlTable = {};
	local C,Z,X,Y = Astrolabe:GetCurrentPlayerPosition() -- continent, zone, x, y
	local distanceNotes = {};
	local objc = 0;
	for hash,quest in pairs(QuestieHandledQuests) do
		if QuestieTrackedQuests[hash] and QuestieHashMap[hash] then
			objc = 0;
			if QuestieTrackedQuests[hash]["isComplete"] then
			else
				for name,notes in pairs(quest.objectives.objectives) do
					for k,v in pairs(notes) do
						if not v.done then
							local continent, zone, xNote, yNote = QuestieZoneIDLookup[v.mapid][4], QuestieZoneIDLookup[v.mapid][5], v.x, v.y
							if continent and zone and xNote and yNote then
								local dist, xDelta, yDelta = Astrolabe:ComputeDistance( C, Z, X, Y, continent, zone, xNote, yNote )
								if dist and xDelta and yDelta then
									local info = {
										["dist"] = dist,
										["hash"] = hash,
										["xDelta"] = xDelta,
										["yDelta"] = yDelta,
										["c"] = continent,
										["z"] = zone,
										["x"] = xNote,
										["y"] = yNote,
									}
									objc = objc + 1;
									table.insert(distanceNotes, info);
								end
							end
						end
					end
				end
			end
			if objc == 0 then
				local continent, zone, xNote, yNote = QuestieTracker:GetFinisherLocation(QuestieHashMap[hash]['finishedType'], QuestieHashMap[hash]['finishedBy']);
				if continent and zone and xNote and yNote then
					local dist, xDelta, yDelta = Astrolabe:ComputeDistance( C, Z, X, Y, continent, zone, xNote, yNote );
					if dist and xDelta and yDelta  then
						local info = {
							["dist"] = dist,
							["hash"] = hash,
							["xDelta"] = xDelta,
							["yDelta"] = yDelta,
							["c"] = continent,
							["z"] = zone,
							["x"] = xNote,
							["y"] = yNote,
						}
						table.insert(distanceNotes, info);
					end
				end
			end
		end
	end
	if (QuestieConfig.trackerList == true) then
		sort(distanceNotes, function (a, b)
			return a["dist"] > b["dist"]
		end)
	elseif (QuestieConfig.trackerList == false) then
			sort(distanceNotes, function (a, b)
			return a["dist"] < b["dist"]
		end)
	end
	-- not sure what this bit is for
	for k,v in pairs(distanceNotes) do
		if not distanceControlTable[v["hash"]] then
			distanceControlTable[v["hash"]] = true
			table.insert(sortedByDistance, v);
		end
	end
	if QuestieConfig.boldColors == true then
		for i,v in pairs(sortedByDistance) do
			local hash = v["hash"];
			local quest = QuestieTrackedQuests[hash];
			quest['rend'] = true;
			local button = QuestieTracker:createOrGetTrackingButton(index);
			button.hash = hash;
			local colorString = "|c" .. QuestieTracker:GetDifficultyColor(quest["level"]);
			local titleData = colorString;
				if QuestieConfig['alwaysShowLevel'] then
					if quest["questTag"] then
						titleData = titleData .. "[" .. quest["level"] .. "+" .. "] " ;
					else
						titleData = titleData .. "[" .. quest["level"] .. "] " ;
					end
				end
				titleData = titleData .. "|r|cFFFFFFFF" .. quest["questName"] .. "|r";
				if QuestieConfig['AlwaysShowDistance'] then
					titleData = titleData .. " ("..math.floor(v["dist"]).." Yd)";
				end
			button.quest:SetText(titleData);
			local obj = 1;
			if quest["questTag"] then
				v["title"] = colorString .. "[" .. quest["level"] .. "+" .. "] |r" .. quest["questName"];
			else
				v["title"] = colorString .. "[" .. quest["level"] .. "] |r" .. quest["questName"];
			end
			quest["arrowPoint"] = v
			if quest["isComplete"] or quest["leaderboards"] == 0 then
			QuestieTracker:AddObjectiveToButton(button, {['desc']="Quest Complete!"}, obj);
				obj = 2;
			else
				while true do
					local beefcake = quest["objective" .. obj];
					if beefcake == nil then break; end
					if beefcake["type"] == "event" then
						QuestieTracker:AddEventToButton(button, beefcake, obj);
						obj = obj + 1;
					else
						QuestieTracker:AddObjectiveToButton(button, beefcake, obj);
						obj = obj + 1;
					end
				end
			end
			button.currentObjectiveCount = obj - 1;
			local heightLoss = 0;
			while true do
				if button.objectives[obj] == nil then break; end
				button.objectives[obj]:SetText(""); --hecks
				heightLoss = heightLoss + 11;
				obj = obj + 1;
			end
			button:SetHeight(14 + (button.currentObjectiveCount * 11));
			for i, v in (button.quest) do
				local qtextWidth = button.quest:GetStringWidth() + 20
				table.insert(QuestieTracker.questNames, qtextWidth);
			end
			local qmaxWidth = 0
			for i, v in ipairs(QuestieTracker.questNames) do
				if (QuestieTracker.questObjects) then
					qmaxWidth = math.max(qmaxWidth, v)
					table.insert(QuestieTracker.MaxButtonWidths, qmaxWidth);
					QuestieTracker.questNames = {};
				end
			end
			local maxWidth = 0
			for i, v in ipairs(QuestieTracker.MaxButtonWidths) do
				maxWidth = math.max(maxWidth, v)
				QuestieTracker.questButtons.maxWidth = maxWidth
			end
			button:SetWidth(maxWidth);
			QuestieTracker.GeneralInterval = QuestieTracker.GeneralInterval + 1;
			if (QuestieTracker.GeneralInterval > (QuestieTracker.btnUpdate*1.4)) then
				QuestieTracker.GeneralInterval = 0
				button:Show();
				if (QuestieConfig.showTrackerHeader == true) then
					QuestieTrackerHeader:Show();
				end
			end
			index = index + 1;
		end
		QuestieTracker.highestIndex = index - 1;
		while true do
			local d = QuestieTracker.questButtons[index];
			if d == nil then break end;
			d:Hide();
			index = index + 1;
		end
		QuestieTracker:updateTrackingFrameSize();
		QuestieTracker.frame:Show();
	else
	 	for i,v in pairs(sortedByDistance) do
			local hash = v["hash"];
			local quest = QuestieTrackedQuests[hash];
			quest['rend'] = true;
			local button = QuestieTracker:createOrGetTrackingButton(index);
			button.hash = hash;
			local colorString = "|c" .. QuestieTracker:GetDifficultyColor(quest["level"]);
			local titleData = colorString;
				if QuestieConfig['alwaysShowLevel'] then
					if quest["questTag"] then
						titleData = titleData .. "[" .. quest["level"] .. "+" .. "] " ;
					else
						titleData = titleData .. "[" .. quest["level"] .. "] " ;
					end
				end
				titleData = titleData .. quest["questName"];
				if QuestieConfig['AlwaysShowDistance'] then
					titleData = titleData .. " ("..math.floor(v["dist"]).." Yd)";
				end
			titleData = titleData  .. "|r";
			button.quest:SetText(titleData);
			local obj = 1;
			if quest["questTag"] then
				v["title"] = colorString .. "[" .. quest["level"] .. "+" .. "] " .. quest["questName"] .. "|r";
			else
				v["title"] = colorString .. "[" .. quest["level"] .. "] " .. quest["questName"] .. "|r";
			end
			quest["arrowPoint"] = v
			if quest["isComplete"] or quest["leaderboards"] == 0 then
				QuestieTracker:AddObjectiveToButton(button, {['desc']="Quest Complete!"}, obj);
				obj = 2;
			else
				while true do
					local beefcake = quest["objective" .. obj];
					if beefcake == nil then break; end
					if beefcake["type"] == "event" then
						QuestieTracker:AddEventToButton(button, beefcake, obj);
						obj = obj + 1;
					else
						QuestieTracker:AddObjectiveToButton(button, beefcake, obj);
						obj = obj + 1;
					end
				end
			end
			button.currentObjectiveCount = obj - 1;
			local heightLoss = 0;
			while true do
				if button.objectives[obj] == nil then break; end
				button.objectives[obj]:SetText(""); --hecks
				heightLoss = heightLoss + 11;
				obj = obj + 1;
			end
			button:SetHeight(14 + (button.currentObjectiveCount * 11));
			for i, v in (button.quest) do
				local qtextWidth = button.quest:GetStringWidth() + 20
				table.insert(QuestieTracker.questNames, qtextWidth);
			end
			local qmaxWidth = 0
			for i, v in ipairs(QuestieTracker.questNames) do
				if (QuestieTracker.questObjects) then
					qmaxWidth = math.max(qmaxWidth, v)
					table.insert(QuestieTracker.MaxButtonWidths, qmaxWidth);
					QuestieTracker.questNames = {};
				end
			end
			local maxWidth = 0
			for i, v in ipairs(QuestieTracker.MaxButtonWidths) do
				maxWidth = math.max(maxWidth, v)
				QuestieTracker.questButtons.maxWidth = maxWidth
			end
			button:SetWidth(maxWidth);
			QuestieTracker.GeneralInterval = QuestieTracker.GeneralInterval + 1;
			if (QuestieTracker.GeneralInterval > (QuestieTracker.btnUpdate*1.4)) then
				QuestieTracker.GeneralInterval = 0
				button:Show();
				if (QuestieConfig.showTrackerHeader == true) then
					QuestieTrackerHeader:Show();
				end
			end
			index = index + 1;
		end
		QuestieTracker.highestIndex = index - 1;
		while true do
			local d = QuestieTracker.questButtons[index];
			if d == nil then break end;
			d:Hide();
			index = index + 1;
		end
		QuestieTracker:updateTrackingFrameSize();
		QuestieTracker.frame:Show();
	end
end

function QuestieTracker:createTrackingFrame()
	QuestieTracker.frame = CreateFrame("Frame", "QuestieTrackerFrame", UIParent);
	QuestieTracker.frame:SetWidth(1);
	QuestieTracker.frame:SetHeight(1);
	QuestieTracker.frame:SetPoint(
		QuestieTrackerVariables["position"]["point"],
		QuestieTrackerVariables["position"]["relativeTo"],
		QuestieTrackerVariables["position"]["relativePoint"],
		QuestieTrackerVariables["position"]["xOfs"],
		QuestieTrackerVariables["position"]["yOfs"]
	);
	QuestieTracker.frame.texture = QuestieTracker.frame:CreateTexture(nil, "BACKGROUND");
	QuestieTracker.frame.texture:SetTexture(0,0,0); -- black
	QuestieTracker.frame.texture:SetAlpha(0.0);
	QuestieTracker.frame.texture:SetAllPoints(QuestieTracker.frame);
	QuestieTracker.frame:Show();
	QuestieTracker.frame:EnableMouse(true);
	QuestieTracker.frame:SetMovable(true);
	--Fix submitted by wardz - thank you!
	QuestieTracker.frame:SetClampedToScreen(true);
	QuestieTracker.frame.prevoffset = 0;
	QuestieTracker.frame:SetScript("OnMouseUp", function()
		this:StopMovingOrSizing();
		this:SetUserPlaced(false);
		QuestieTracker:saveFramePosition();
	end);
	if (QuestieConfig.trackerList == true) then
		local header = CreateFrame("Button", "QuestieTrackerHeader", QuestieTracker.frame);
		local watcher = header:CreateFontString(nil, "OVERLAY", "GameFontNormal")
		watcher:SetPoint("TOPLEFT", QuestieTracker.frame, "TOPLEFT", 10, -8)
		local numEntries, numQuests = GetNumQuestLogEntries();
		watcher:SetText("QuestLog Status: ("..numQuests.."/20)");
		QuestieTrackerHeader:Hide();
	elseif (QuestieConfig.trackerList == false) then
		local header = CreateFrame("Button", "QuestieTrackerHeader", QuestieTracker.frame);
		local watcher = header:CreateFontString(nil, "OVERLAY", "GameFontNormal")
		watcher:SetPoint("TOPLEFT", QuestieTracker.frame, "TOPLEFT", 10, -8)
		local numEntries, numQuests = GetNumQuestLogEntries();
		watcher:SetText("QuestLog Status: ("..numQuests.."/20)");
		QuestieTrackerHeader:Hide();
	end
end

function QuestLogTitleButton_OnClick(button)
	if(EQL3_Player) then -- could also hook EQL3_AddQuestWatch(index) I guess
		if ( IsShiftKeyDown() ) then
			if not ChatFrameEditBox:IsVisible() then
				QuestieTracker:setQuestInfo(this:GetID() + FauxScrollFrame_GetOffset(EQL3_QuestLogListScrollFrame));
			end
		end
		QuestLogTitleButton_OnClick(button);
		EQL3_QuestWatchFrame:Hide();
	else
		if ( button == "LeftButton" ) then
			if ( IsShiftKeyDown() ) then
				if(ChatFrameEditBox:IsVisible()) then
					ChatFrameEditBox:Insert(this:GetText());
				else
					-- add/remove quest to/from tracking
					QuestieTracker:setQuestInfo(this:GetID() + FauxScrollFrame_GetOffset(QuestLogListScrollFrame));
				end
			end
			QuestLog_SetSelection(this:GetID() + FauxScrollFrame_GetOffset(QuestLogListScrollFrame))
			QuestLog_Update();
		end
	end
	QuestWatchFrame:Hide()
	QuestieTracker:fillTrackingFrame();
end

function QuestieTracker:saveFramePosition()
	local frame = getglobal("QuestieTrackerFrame");
	local point, _, relativePoint, xOfs, yOfs = frame:GetPoint();
	if (QuestieConfig.trackerList == true) then
		QuestieTrackerVariables = {};
		QuestieTrackerVariables["position"] = {
			["point"] = "BOTTOMLEFT",
			["relativePoint"] = "BOTTOMLEFT",
			["relativeTo"] = "UIParent",
			["yOfs"] = (QuestieTracker.frame:GetBottom()),
			["xOfs"] = (QuestieTracker.frame:GetLeft()),
		};
	elseif (QuestieConfig.trackerList == false) then
			QuestieTrackerVariables = {};
			QuestieTrackerVariables["position"] = {
			["point"] = "TOPLEFT",
			["relativePoint"] = "TOPLEFT",
			["relativeTo"] = "UIParent",
			["yOfs"] = yOfs,
			["xOfs"] = xOfs,
		};
	end
end

-- end ui code

-- begin logic code

local function trim(s)
	return string.gsub(s, "^%s*(.-)%s*$", "%1");
end

function QuestieTracker:addQuestToTracker(hash, logId, level) -- never used???
	local startTime = GetTime()
	if(type(QuestieTrackedQuests[hash]) ~= "table") then
		QuestieTrackedQuests[hash] = {};
	end
	if not logId then
		logId = Questie:GetQuestIdFromHash(hash)
	end
	if logId == nil then
		Questie:debug_Print("TrackerError! LogId still nil after GetQuestIdFromHash ", hash);
		return;
	end
	local questName, level, questTag, isHeader, isCollapsed, isComplete = QuestieCompat_GetQuestLogTitle(logId);
	QuestieTrackedQuests[hash]["questName"] = questName
	QuestieTrackedQuests[hash]["level"] = level
	QuestieTrackedQuests[hash]["questTag"] = questTag
	QuestieTrackedQuests[hash]["isComplete"] = isComplete
	QuestieTrackedQuests[hash]["leaderboards"] = GetNumQuestLeaderBoards(logId);
	for i=1, GetNumQuestLeaderBoards(logId) do
		local desc, type, done = GetQuestLogLeaderBoard(i, logId);
		QuestieTrackedQuests[hash]["objective"..i] = {
			["desc"] = desc,
			["type"] = type,
			["done"] = done,
			["notes"] = {},
		}
	end
	-- fallback for running quests
	if GetNumQuestLeaderBoards() == 0 or isComplete then
		QuestieTrackedQuests[hash]["objective1"] = {
			["desc"] = "Quest Complete!",
			["type"] = type,
			["done"] = true,
			["notes"] = {},
		}
	end
	Questie:debug_Print("Added QuestInfo to Tracker - Time: " .. (GetTime()-startTime)*1000 .. "ms");
	QuestieTracker:fillTrackingFrame()
	Questie:RedrawNotes();
	if QuestieTrackedQuests[hash]["objective1"] then
		if QuestieTrackedQuests[hash]["objective1"]["type"] == nil then
			QuestieTracker:updateFrameOnTracker(hash, logId, level)
		end
	end

end

function QuestieTracker:updateFrameOnTracker(hash, logId, level)
	if AUTO_QUEST_WATCH == "1" and QuestieTrackedQuests[hash] == nil then
		QuestieTracker:addQuestToTracker(hash, logId, level);
	end
	local startTime = GetTime()
	if not logId then
		logId = Questie:GetQuestIdFromHash(hash)
	end
	if QuestieTrackedQuests[hash] == false then
		return
	end
	local questName, level, questTag, isHeader, isCollapsed, isComplete = QuestieCompat_GetQuestLogTitle(logId);
	if not QuestieTrackedQuests[hash] then
		QuestieTrackedQuests[hash] = {};
	end
	QuestieTrackedQuests[hash]["questName"] = questName;
	QuestieTrackedQuests[hash]["isComplete"] = isComplete;
	QuestieTrackedQuests[hash]["questTag"] = questTag;
	QuestieTrackedQuests[hash]["level"] = level;
	QuestieTrackedQuests[hash]["leaderboards"] = GetNumQuestLeaderBoards(logId);
	local uggo = 0;
	for i=1, GetNumQuestLeaderBoards(logId) do
		local desc, type, done = GetQuestLogLeaderBoard(i, logId);
		if not QuestieTrackedQuests[hash]["objective"..i] then
			QuestieTrackedQuests[hash]["objective"..i] = {};
		end
		QuestieTrackedQuests[hash]["objective"..i]["desc"] = desc
		QuestieTrackedQuests[hash]["objective"..i]["done"] = done
		uggo = i;
	end
	uggo = uggo - 1;
	QuestieTracker:fillTrackingFrame()
end

function QuestieTracker:removeQuestFromTracker(hash)
	if QuestieTrackedQuests[hash] then
		if (QuestieSeenQuests[hash] == 0) then
			QuestieTrackedQuests[hash] = nil
			QuestieTrackedQuests[hash] = false
		else
			return
		end
		if (QuestieSeenQuests[hash] == 1) then
			QuestieTrackedQuests[hash] = nil
		end
		if (QuestieSeenQuests[hash] == -1) then
			QuestieSeenQuests[hash] = nil
			QuestieTrackedQuests[hash] = nil
		end
	end
	QuestieTracker.questNames = {};
	QuestieTracker.questObjects = {};
	QuestieTracker.MaxButtonWidths = {};
	QuestieTracker:fillTrackingFrame();
	Questie:RedrawNotes();
	QuestieTrackerHeader:Hide();
	if (QuestieTracker.highestIndex) == 0 then
		QuestieTracker.frame:SetHeight(1);
		QuestieTracker.frame:SetWidth(1);
	end
end

function QuestieTracker:findLogIdByName(name)
	for i=1,GetNumQuestLogEntries() do
		local questName, level, questTag, isHeader, isCollapsed, isComplete = QuestieCompat_GetQuestLogTitle(i);
		if(name == questName) then
			return i;
		end
	end
end

function QuestieTracker:isTracked(quest)
	if quest == nil then return false; end
	if(type(quest) == "string") then
		local hash = Questie:GetHashFromName(quest)
		if(QuestieTrackedQuests[hash] and QuestieTrackedQuests[hash] ~= false) then
			return true;
		end
	else
		local questName, level, questTag, isHeader, isCollapsed, isComplete = QuestieCompat_GetQuestLogTitle(quest);
		local hash = Questie:GetHashFromName(questName)
		if(QuestieTrackedQuests[hash] and QuestieTrackedQuests[hash] ~= false) then
			return true;
		end
	end
	return false;
end

function QuestieTracker:setQuestInfo(id)
	local questInfo = {};
	local questName, level, questTag, isHeader, isCollapsed, isComplete = QuestieCompat_GetQuestLogTitle(id);
	if not isHeader and not isCollapsed then
		local hash = Questie:GetHashFromName(questName)
		if(QuestieTracker:isTracked(questName)) then
			QuestieTracker:removeQuestFromTracker(hash);
			return;
		end
		QuestieTracker:addQuestToTracker(hash, id, level);
	end
end

function QuestieTracker:CurrentUserToggles()
	DEFAULT_CHAT_FRAME:AddMessage("Questie Settings:", 0.5, 0.5, 1)
	local Vars = {
		[1] = { "alwaysShowLevel" },
		[2] = { "alwaysShowQuests" },
		[3] = { "arrowEnabled" },
		[4] = { "boldColors" },
		[5] = { "maxLevelFilter" },
		[6] = { "maxShowLevel" },
		[7] = { "minLevelFilter" },
		[8] = { "minShowLevel" },
		[9] = { "showMapAids" },
		[10] = { "showProfessionQuests" },
		[11] = { "showTrackerHeader" },
		[12] = { "trackerEnabled" },
		[13] = { "trackerList" },
	}
	if QuestieConfig then
		i = 1
		v = 1
		while Vars[i] and Vars[i][v]do
			curVar = Vars[i][v]
			DEFAULT_CHAT_FRAME:AddMessage("  "..curVar.." = "..(tostring(QuestieConfig[curVar])), 0.5, 0.5, 1)
			i = i + 1
		end
	end
end

function QuestieTracker:PLAYER_LOGIN()
	QuestieTracker:createTrackingFrame();
	QuestieTracker:syncEQL3();
end

function QuestieTracker:syncEQL3()
	if(EQL3_Player) then
		for id=1, GetNumQuestLogEntries() do
			local questName, level, questTag, isHeader, isCollapsed, isComplete = QuestieCompat_GetQuestLogTitle(id);
			if ( not isHeader and EQL3_IsQuestWatched(id) and not QuestieTracker:isTracked(questName) ) then
				QuestieTracker:addQuestToTracker(Questie:GetHashFromName(questName), id, level);
			elseif( not isHeader and not EQL3_IsQuestWatched(id) and QuestieTracker:isTracked(questName) ) then
				QuestieTracker:removeQuestFromTracker(Questie:GetHashFromName(questName));
			end
		end
	end
end

function QuestieTracker:ADDON_LOADED()
	if not ( QuestieTrackerVariables ) then
		QuestieTrackerVariables = {};
		QuestieTrackerVariables["position"] = {
			point = "LEFT",
			relativeTo = "UIParent",
			relativePoint = "LEFT",
			xOfs = 0,
			yOfs = 0,
		};
	end
	if not QuestieTrackedQuests then
		QuestieTrackedQuests = {}
	end
	-- bye vanilla tracker
	QuestWatchFrame:Hide()
	QuestWatchFrame.Show = function () end;
end
-- end logic code