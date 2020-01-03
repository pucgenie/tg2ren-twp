function Weight()

	if not SimGetWorkingPlace("MYRM", "myrm_place") then
		return 0
	end
	
	local Count = BuildingGetWorkerCount("myrm_place")
	
	for l=0,Count-1 do
		if BuildingGetWorker("myrm_place", l, "myrm_quadcheck") then
			if SquadGet("myrm_quadcheck", "myrm_squad") then
				return 100
			end
		end
	end
	
	return 0
end

function Execute()
	SquadAddMember("myrm_squad", -1, "MYRM")
end

