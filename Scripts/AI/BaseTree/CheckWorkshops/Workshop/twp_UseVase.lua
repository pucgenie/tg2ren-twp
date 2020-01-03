function Weight()
	if not AliasExists("MyWorkshop") then
		return 0
	end
	
	-- need right type
	local BuildType = BuildingGetType("MyWorkshop")
	if BuildType ~= GL_BUILDING_TYPE_TAVERN then
		if BuildType ~= GL_BUILDING_TYPE_CHURCH_EV then
			if BuildType ~= GL_BUILDING_TYPE_CHURCH_CATH then
				if BuildType ~= GL_BUILDING_TYPE_HOSPITAL then
					if BuildType ~= GL_BUILDING_TYPE_BANKHOUSE then
						if BuildType ~= GL_BUILDING_TYPE_PIRAT then
							return 0
						end
					end
				end
			end
		end
	end
	
	if GetImpactValue("MyWorkshop", "Vase") > 0 then
		return 0
	end
	
	local Item = "vase"
	local Money = GetMoney("SIM")
	
	if Money < 7500 then
		return 0
	end
	
	if GetRepeatTimerLeft("SIM", GetMeasureRepeatName2("Use"..Item)) > 0 then
		return 0
	end
	
	local Price = ai_CanBuyItem("SIM", Item)
	
	if Price < 0 then
		return 0
	end
	
	return 5
end

function Execute()
	MeasureRun("SIM", nil, "Usevase")
end