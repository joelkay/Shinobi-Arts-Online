mob
	var/tmp/swapmap/mapd
	var/tmp/Missionx
	var/tmp/Missiony
	var/tmp/Missionz
	proc
		retrieve_scroll_mission()

			src.mapd = SwapMaps_CreateFromTemplate("Maps/field")	 //load the scene map
			covermap(src.mapd)
			if(src.mapd)
				maps_created.Add(src.mapd)


				src.missionbegin()






		mission_begin()
			Missionx=src.x
			Missiony=src.y
			Missionz=src.z
			src.loc=locate(x,y,mapd.z1)




		mission_end()
			(src)














