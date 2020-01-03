function Weight()
	local	Item = "Poem"
	
	if GetRepeatTimerLeft("SIM", GetMeasureRepeatName2("Use"..Item)) > 0 then
		return 0
	end
	
	if SimGetGender("SIM") == SimGetGender("Target") then
		return 0
	end
	
	if GetItemCount("SIM", Item, INVENTORY_STD) >0 then
		return 100
	end
	
	if GetMoney("SIM") < 5000 then
		return 0
	end
	
	local Price = ai_CanBuyItem("SIM", Item)
	if Price<0 then
		return 0
	end

	return 100
end

function Execute()
	MeasureRun("SIM", "Target", "UsePoem")
end
