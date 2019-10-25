QuestieMap.utils = {};

local HBD = LibStub("HereBeDragonsQuestie-2.0")

-- ALl the speed we can get is worth it.
local tinsert = table.insert;
local pairs = pairs;

function QuestieMap.utils:SetDrawOrder(frame, level)
  frame.texture:SetDrawLayer("OVERLAY", level);
end

---@param points table<integer, Point> @Pointlist {x=0, y=0}
---@return Point @{x=?, y=?}
function QuestieMap.utils:CenterPoint(points)
    local center = {};
    local count = 0;
    center.x = 0;
    center.y = 0;
    for index, point in pairs(points) do
        center.x = center.x + point.x
        center.y = center.y + point.y
        count = count + 1;
    end
    center.x = center.x / count;
    center.y = center.y / count;
    return center;
end

---@param points table<integer, Point> @A simple pointlist with {x=0, y=0, zone=0}
---@param rangeR integer @Range of the hotzones.
---@return table<integer, table<integer, Point>> @A table of hotzones
function QuestieMap.utils:CalcHotzones(points, rangeR)
    if(points == nil) then return nil; end
    
    local range = rangeR or 100;
    local hotzones = {};
    local itt = 0;
    while(true) do
    	local FoundUntouched = nil;
    	for index, point in pairs(points) do
    		if(point.touched == nil) then
    			local notes = {};
    			FoundUntouched = true;
    			point.touched = true;
    			tinsert(notes, point);
          for index2, point2 in pairs(points) do
            --We only want to cluster icons that are on the same map.
            if(point.UIMapId == point2.UIMapId) then
              local times = 1;
              
              --We want things further away to be clustered more
              local movingRange = range;
              if(point.distance and point.distance < 1000) then
                movingRange = movingRange * 1;
              elseif(point.distance and point.distance < 1500) then
                movingRange = movingRange * 1.5;
              elseif(point.distance and point.distance > 2000) then
                movingRange = movingRange * 2;
              end

              if(point.x > 1 and point.y > 1) then times = 100; end
              local aX, aY = HBD:GetWorldCoordinatesFromZone(point.x/times, point.y/times, point.UIMapId);
              local bX, bY = HBD:GetWorldCoordinatesFromZone(point2.x/times, point2.y/times, point2.UIMapId);
              --local dX = (point.x*times) - (point2.x*times)
              --local dY = (point.y*times) - (point2.y*times);
              local distance = QuestieLib:Euclid(aX or 0, aY or 0, bX or 0, bY or 0);
              if(distance < movingRange and point2.touched == nil) then
                point2.touched = true;
                tinsert(notes, point2);
              end
            end
    			end
    			tinsert(hotzones, notes);
    		end
    	end
    	if(FoundUntouched == nil) then
    		break;
    	end
    	itt = itt +1
    end
    return hotzones;
end

function QuestieMap.utils:IsExplored(uiMapId, x, y)
  if uiMapId then
      local exploredAreaIDs = C_MapExplorationInfo.GetExploredAreaIDsAtPosition(uiMapId, CreateVector2D(x / 100, y / 100));
      if exploredAreaIDs then return true              -- Explored
      elseif (uiMapId == 1453) then return true     -- Stormwind
      elseif (uiMapId == 1455) then return true     -- Ironforge
      elseif (uiMapId == 1457) then return true     -- Darnassus
      elseif (uiMapId == 1458) then return true     -- Undercity
      elseif (uiMapId == 1454) then return true     -- Orgrimmar
      elseif (uiMapId == 1456) then return true     -- Thunder Bluff
      end
  end
  return false;
end

function QuestieMap.utils:MapExplorationUpdate()
  for questId, frameList in pairs(QuestieMap.questIdFrames) do
      for _, frameName in ipairs(frameList) do
          local frame = _G[frameName];
          if(frame and frame.x and frame.y and frame.UiMapID and frame.hidden) then
            if(QuestieMap.utils:IsExplored(frame.UiMapID, frame.x, frame.y)) then
              frame:FakeUnhide();
            end
          end
      end
  end
end