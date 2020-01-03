function Weight()
	if GetImpactValue("SIM", "ConfiscateGoods") == 0 then
		return 0
	end
	
	if GetRepeatTimerLeft("SIM", GetMeasureRepeatName2("ConfiscateGoods")) > 0 then
		return 0
	end
	
	if not DynastyGetRandomBuilding("Victim", GL_BUILDING_CLASS_WORKSHOP, -1, "VictimWorkshop") then
		return 0
	end
	
	if AliasExists("RivalBuild") then
		CopyAlias("RivalBuild", "VictimWorkshop")
	end
		
	return 20
end

function Execute()
	MeasureRun("SIM", "VictimWorkshop", "ConfiscateGoods")
end

