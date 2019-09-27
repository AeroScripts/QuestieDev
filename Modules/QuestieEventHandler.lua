local function _Hack_prime_log() -- this seems to make it update the data much quicker
  for i=1,GetNumQuestLogEntries()+1 do
    GetQuestLogTitle(i)
    QuestieQuest:GetRawLeaderBoardDetails(i)
  end
end

local libS = LibStub:GetLibrary("AceSerializer-3.0")
local libC = LibStub:GetLibrary("LibCompress")
local updateQuestId = {};

--- GLOBAL ---
--This is needed for functions around the addon, due to UnitLevel("player") not returning actual level PLAYER_LEVEL_UP unless this is used.
QuestieEventHandler = {}


__UPDATEFIX_IDX = 1; -- temporary bad fix

--- LOCAL ---
local QuestWatchTimers = {
    cancelTimer = nil,
    repeatTimer = nil
}
local lastState = {}
--False -> true -> nil
local playerEntered = false;
local hasFirstQLU = false;

local questWatchFrames = {}
for i = 1, 35 do
    questWatchFrames[i] = CreateFrame("Frame", "QuestWatchFrame"..i)
    questWatchFrames[i].questLogIndex = i;
    questWatchFrames[i].refresh = false;
    questWatchFrames[i].accept = false;
    questWatchFrames[i].objectives = {}
    questWatchFrames[i]:RegisterEvent("QUEST_LOG_UPDATE")--, QUEST_LOG_UPDATE
    questWatchFrames[i]:SetScript("OnEvent", function(self, event, ...)
        if (event == "QUEST_LOG_UPDATE") then
            C_Timer.After(1, function() 
                if(self.refresh) then
                    --Get quest info
                    local QuestInfo = QuestieQuest:GetRawLeaderBoardDetails(self.questLogIndex)

                    --No need to run this unless we have to.
                    if(Questie.db.global.debugEnabled) then
                        Questie:Debug(DEBUG_DEVELOP, event, "Updating index", self.questLogIndex, "Title:", QuestInfo.title, "Id:", QuestInfo.Id)
                        for index, objective in pairs(QuestInfo.Objectives) do
                            Questie:Debug(DEBUG_DEVELOP, "-------->", objective.description);
                        end
                    end
                    --Update the quest
                    --C_Timer.After(1, function ()
                    QuestieQuest:UpdateQuest(QuestInfo.Id)
                    --end)
                    --QuestieQuest:UpdateQuest(QuestInfo.Id);
                    self.refresh = false;
                end
                if(self.accept) then
                    local QuestInfo = QuestieQuest:GetRawLeaderBoardDetails(self.questLogIndex)
                    Questie:Debug(DEBUG_DEVELOP, event, "Accepted quest", self.questLogIndex, "Title:", QuestInfo.title, "Id:", QuestInfo.Id)

                    --Accept the quest.
                    QuestieQuest:AcceptQuest(QuestInfo.Id)
                    --Delay the update by 1 second to let everything propagate, should not be needed...
                    --C_Timer.After(1, function ()
                    Questie:Debug(DEBUG_DEVELOP, event, "Updated quest", self.questLogIndex, "Title:", QuestInfo.title, "Id:", QuestInfo.Id)
                    QuestieQuest:UpdateQuest(QuestInfo.Id)
                    --end)
                    
                    -- deferred update (possible desync fix)
                    C_Timer.After(2, function()
                        QuestieQuest:PopulateObjectiveNotes(QuestieDB:GetQuest(QuestInfo.Id))
                        QuestieQuest:UpdateQuest(QuestInfo.Id)
                    end)
                    
                    self.accept = false;
                end
            end)
        end
    end)
end

function QuestieEventHandler:PLAYER_ENTERING_WORLD()
    C_Timer.After(1, function()
        QuestieDB:Initialize()
    end)
    C_Timer.After(4, function()
        -- We want the framerate to be HIGH!!!
        QuestieMap:InitializeQueue();
        _Hack_prime_log()
        QuestiePlayer:Initialize();
        QuestieQuest:Initialize()
        QuestieQuest:GetAllQuestIdsNoObjectives()
        QuestieQuest:CalculateAvailableQuests()
        QuestieQuest:DrawAllAvailableQuests()
        QuestieNameplate:Initialize();
        Questie:Debug(DEBUG_ELEVATED, "PLAYER_ENTERED_WORLD")
        playerEntered = true
        -- manually fire QLU since enter has been delayed past the first QLU
        if hasFirstQLU then
            QuestieEventHandler:QUEST_LOG_UPDATE()
        end
    end)
end

--Fires when a quest is accepted in anyway.
function QuestieEventHandler:QUEST_ACCEPTED(questLogIndex, questId)
    Questie:Debug(DEBUG_DEVELOP, "EVENT: QUEST_ACCEPTED", "QLogIndex: "..questLogIndex,  "QuestID: "..questId);
    _Hack_prime_log()

    --Update the information on next QUEST_LOG_UPDATE
    questWatchFrames[questLogIndex].accept = true;

    local data = {}
    data.questId = questId;
    data.objectives = C_QuestLog.GetQuestObjectives(questId);
    -- Do we even need to do this hash?
    local hash = libC:fcs32init()
    hash = libC:fcs32update(hash, libS:Serialize(data.objectives))
    hash = libC:fcs32final(hash)
    data.hash = hash;
    data.type = "accept";
    Questie:Print("Register Accept Change", questId, hash);
    updateQuestId[questId] = data;

    -- Add quest accept journey note.
    local data = {};
    data.Event = "Quest";
    data.SubType = "Accept";
    data.Quest = questId;
    data.Level = UnitLevel("player");
    data.Timestamp = time();
    data.Party = {};

    if GetHomePartyInfo() then
        data.Party = {};
        local p = {};
        for i, v in pairs(GetHomePartyInfo()) do
            p.Name = v;
            p.Class,_ ,_ = UnitClass(v);
            p.Level = UnitLevel(v);
            table.insert(data.Party, p);
        end
    end
    
    table.insert(Questie.db.char.journey, data);

end

--Fires when a quest is removed from the questlog, this includes turning it in!
function QuestieEventHandler:QUEST_REMOVED(QuestId)
    _Hack_prime_log()
    Questie:Debug(DEBUG_DEVELOP, "EVENT: QUEST_REMOVED", QuestId);
    QuestieQuest:AbandonedQuest(QuestId)

    -- Abandon Quest added to Journey
    -- first check to see if the quest has been completed already or not
    local skipAbandon = false;
    for i in ipairs(Questie.db.char.journey) do

        local entry = Questie.db.char.journey[i];
        if entry.Event == "Quest" then
            if entry.Quest == QuestId then
                if entry.SubType == "Complete" then
                    skipAbandon = true;
                end
            end
        end
    end

    if not skipAbandon then
        local data = {};
        data.Event = "Quest";
        data.SubType = "Abandon";
        data.Quest = QuestId;
        data.Level = UnitLevel("player");
        data.Timestamp = time()
        data.Party = {};

        if GetHomePartyInfo() then
            local p = {};
            for i, v in pairs(GetHomePartyInfo()) do
                p.Name = v;
                p.Class, _, _ = UnitClass(v);
                p.Level = UnitLevel(v);
                table.insert(data.Party, p);
            end
        end
        
        table.insert(Questie.db.char.journey, data);
    end
end

--Fires when a quest is turned in.
function QuestieEventHandler:QUEST_TURNED_IN(questID, xpReward, moneyReward)
    _Hack_prime_log()
    Questie:Debug(DEBUG_DEVELOP, "EVENT: QUEST_TURNED_IN", questID, xpReward, moneyReward);
    QuestieQuest:CompleteQuest(questID)

    -- Complete Quest added to Journey
    local data = {};
    data.Event = "Quest";
    data.SubType = "Complete";
    data.Quest = questID;
    data.Level = UnitLevel("player");
    data.Timestamp = time();
    data.Party = {};

    if GetHomePartyInfo() then
        local p = {};
        for i, v in pairs(GetHomePartyInfo()) do
            p.Name = v;
            p.Class, _, _ = UnitClass(v);
            p.Level = UnitLevel(v);
            table.insert(data.Party, p);
        end
    end
        
    table.insert(Questie.db.char.journey, data);
end

function QuestieEventHandler:QUEST_LOG_UPDATE()
    Questie:Debug(DEBUG_DEVELOP, "QUEST_LOG_UPDATE")
    hasFirstQLU = true
    if(playerEntered)then
        Questie:Debug(DEBUG_DEVELOP, "---> Player entered world, START.")
        C_Timer.After(1, function ()
            Questie:Debug(DEBUG_DEVELOP, "---> Player entered world, DONE.")
            QuestieQuest:GetAllQuestIds()
            QuestieTracker:Initialize()
            QuestieTracker:Update()
        end)
        playerEntered = nil;
    end

    -- Run the new change detection system.
    QuestieEventHandler:UpdateQuests();
end

function QuestieEventHandler:UpdateQuests()
  for questId, data in pairs(updateQuestId) do
        local objectives = C_QuestLog.GetQuestObjectives(questId);
        if(objectives ~= nil) then
            local hash = libC:fcs32init();
            hash = libC:fcs32update(hash, libS:Serialize(objectives));
            hash = libC:fcs32final(hash);
            if(data.hash ~= hash) then
                Questie:Print("Change detected! Id:", questId, hash, data.type)
                -- I think the accept is a dead path, the hash will always be the same for hash... TODO: Remove, probably.
                if(data.type == "accept") then
                    QuestieQuest:AcceptQuest(questId)
                end
                --

                QuestieQuest:UpdateQuest(questId)

                -- Maybe this should just be a straight call rather than a message.
                Questie:SendMessage("QC_ID_BROADCAST_QUEST_UPDATE", questId);

                updateQuestId[questId] = nil;
            elseif(data.type =="accept" and data.hash == hash) then
                Questie:Print("Change not detected! ACCEPT Id:", questId, hash, data.type)
                QuestieQuest:AcceptQuest(questId)
                QuestieQuest:UpdateQuest(questId)

                -- Maybe this should just be a straight call rather than a message.
                Questie:SendMessage("QC_ID_BROADCAST_QUEST_UPDATE", questId);
            else
                Questie:Print("No change detected! Hash:", hash, ":", data.hash, "-", questId)
            end
        end
    end
end

function QuestieEventHandler:QUEST_WATCH_UPDATE(QuestLogIndex)
    Questie:Debug(DEBUG_INFO, "QUEST_WATCH_UPDATE", QuestLogIndex)
    --When a quest gets updated, wait until next QUEST_LOG_UPDATE before updating.
    --questWatchFrames[QuestLogIndex].refresh = true

    local _, _, _, _, _, _, _, questId = GetQuestLogTitle(QuestLogIndex)
    local data = {}
    data.questId = questId;
    data.objectives = C_QuestLog.GetQuestObjectives(questId);
    local hash = libC:fcs32init()
    hash = libC:fcs32update(hash, libS:Serialize(data.objectives))
    hash = libC:fcs32final(hash)
    data.hash = hash;
    data.type = "update";
    Questie:Print("Register Update Change", questId, hash);
    updateQuestId[questId] = data;
end

function QuestieEventHandler:QUEST_LOG_CRITERIA_UPDATE(questID, specificTreeID, description, numFulfilled, numRequired)
    Questie:Debug(DEBUG_DEVELOP, "EVENT: QUEST_LOG_CRITERIA_UPDATE", questID, specificTreeID, description, numFulfilled, numRequired);
end

function QuestieEventHandler:CUSTOM_QUEST_COMPLETE()
    local numEntries, numQuests = GetNumQuestLogEntries();
    --Questie:Debug(DEBUG_CRITICAL, "CUSTOM_QUEST_COMPLETE", "Quests: "..numQuests);
end

function QuestieEventHandler:PLAYER_LEVEL_UP(level, hitpoints, manapoints, talentpoints, ...)
    Questie:Debug(DEBUG_DEVELOP, "EVENT: PLAYER_LEVEL_UP", level);
    
    QuestiePlayer:SetPlayerLevel(level);
    
    -- deferred update (possible desync fix?)
    C_Timer.After(3, function() 
        QuestiePlayer:SetPlayerLevel(level);

        QuestieQuest:CalculateAvailableQuests();
        QuestieQuest:DrawAllAvailableQuests();
    end)

    -- Complete Quest added to Journey
    local data = {};
    data.Event = "Level";
    data.NewLevel = level;
    data.Timestamp = time();
    data.Party = {};

   if GetHomePartyInfo() then
        data.Party = {};
        local p = {};
        for i, v in pairs(GetHomePartyInfo()) do
            p.Name = v;
            p.Class, _, _ = UnitClass(v);
            p.Level = UnitLevel(v);
            table.insert(data.Party, p);
        end
    end 
    
    table.insert(Questie.db.char.journey, data);
end

--Old stuff

--This is used to see if they acually completed the quest or just fucking with us...
local NumberOfQuestInLog = -1

function QuestieEventHandler:QUEST_COMPLETE()
    local numEntries, numQuests = GetNumQuestLogEntries();
    NumberOfQuestInLog = numQuests;
    --Questie:Debug(DEBUG_CRITICAL, "EVENT: QUEST_COMPLETE", "Quests: "..numQuests);
end

function QuestieEventHandler:QUEST_FINISHED()
    local numEntries, numQuests = GetNumQuestLogEntries();
    if (NumberOfQuestInLog ~= numQuests) then
        --Questie:Debug(DEBUG_CRITICAL, "EVENT: QUEST_FINISHED", "CHANGE");
        NumberOfQuestInLog = -1
    end
    --Questie:Debug(DEBUG_CRITICAL, "EVENT: QUEST_FINISHED", "NO CHANGE");
end

function QuestieEventHandler:MODIFIER_STATE_CHANGED(key, down)
    if GameTooltip and GameTooltip:IsShown() and GameTooltip._Rebuild then
        GameTooltip:Hide()
        GameTooltip:ClearLines()
        GameTooltip:SetOwner(GameTooltip._owner, "ANCHOR_CURSOR");
        GameTooltip:_Rebuild() -- rebuild the tooltip
        GameTooltip:SetFrameStrata("TOOLTIP");
        GameTooltip:Show()
    end
end

-- Fired when some chat messages about skills are displayed
function QuestieEventHandler:CHAT_MSG_SKILL()
    Questie:Debug(DEBUG_DEVELOP, "CHAT_MSG_SKILL")
    QuestieProfessions:Update()
end

local numOfMembers = -1;
function QuestieEventHandler:PARTY_MEMBERS_CHANGED()
  local currentMembers = GetNumGroupMembers();
  -- Only want to do logic when number increases, not decreases.
  if(numOfMembers < currentMembers) then
    -- Tell comms to send information to members.
    Questie:SendMessage("QC_ID_BROADCAST_FULL_QUESTLIST");
    numOfMembers = currentMembers;
  else
    -- We do however always want the local to be the current number to allow up and down.
    numOfMembers = currentMembers;
  end
end