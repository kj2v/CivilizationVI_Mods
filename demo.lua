function OnUnitMoveComplete(playerID, UnitID, iX, iY)
	if(playerID == 0)	then
		local pPlayer = Players[playerID]
		local flag = 0
		local pUnit = pPlayer:GetUnits():FindID(UnitID)
		local pPlot = Map.GetPlot(iX, iY)
		local tNeighborPlots = Map.GetAdjacentPlots(iX, iY);
		local unitString = GameInfo.Units[pUnit:GetType()+1].UnitType
		for i, pNeighborPlot in ipairs(tNeighborPlots) do
			for loop, unit in ipairs(Units.GetUnitsInPlot(pNeighborPlot)) do
				if(unit:GetType() == pUnit:GetType()) then
					UnitManager.Kill(unit)
					flag = 1
					break
				end
			end
		end
		if(flag == 1)	then
			UnitManager.Kill(pUnit)
			UnitManager.InitUnitValidAdjacentHex(playerID, unitString, iX, iY, 1)
		end
	end
end

Events.UnitMoveComplete.Add(OnUnitMoveComplete)
		
		
		
		

		
		