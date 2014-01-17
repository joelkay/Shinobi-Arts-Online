world
	New()
		swapmaps_mode=SWAPMAPS_TEXT
		swapmaps_iconcache=list("grass"='cutscene.dmi',"tile"='cutscene.dmi',"wall"='cutscene.dmi',"ladder"='cutscene.dmi')
		..()

mob/proc
	savemap()
		set background=1
		map = SwapMaps_Find("Maps/playerhouses/[src.ckey]")	  //At logout we check to see if the player has a map

		if(map)	  //If a map is located
			/*
			var/flag = 0	//This is going to be used later to see if there are any turfects on the map

			for(var/turf/T in block(map.LoCorner(), map.HiCorner()))	//This checks the map for any turfs
				if(locate(/atom/movable ) in T)
					flag = 1	//If there are any turfects on the map then it sets our variable flag to 1
					break
			for(var/mob/M in world)	//This checks all the mobs in the world
				if(M.client && M.location == "[src]'s house")	  //If the mob is a player and their location is the house
					M.loc = locate(M.Savedx,M.Savedy,M.Savedz)	  //They get teleported out of the house

			if(flag)
			*/

			map.Save()	//if there was an turfect found we save the map.


mob
	proc
		testhouse()
			src.Allocate_House()

mob
	var
		Savedx	  //Is used later to record the players X position
		Savedy	  //Is used later to record the players Y position
		Savedz	  //Is used later to record the players Z position
mob
	var/tmp
		swapmap/map	  //Creates a variable that is a swapmaps map
		swapmap/map2	  //Creates a variable that is a swapmaps map
		location	//Is used later on to see who is on who's map

//REMEMBER TO ADD A DENSITY FIELD AROUND THE MAP WHEN LOADING.
//ALSO MAKE A LADDER MANDATORY OR SOME FORM OF EXIT.
mob
	proc
		Createmap()
			set background=1
			if(src.location) return//can only do it in real world.

			var/swapmap/Map=SwapMaps_Load("Maps/playerhouses/[src.ckey]")

			if(Map)//If a map is found + loaded ...
				Apopup(src,"Map Loaded..")

				maps_created.Add(Map)
				src.Savedx = src.x	  //We save the players X position into a variable
				src.Savedy = src.y	  //We save the players Y position into a variable
				src.Savedz = src.z	  //We save the players Z position into a variable

				covermap(Map)//cover the area
			/*
				var/turf/House/Po = new/turf/House(src.loc)	  //We place the house turf at the players location
				Po.owner = src	  //Set the house's owner to the player
				Po.name = "[src]'s House"	//Change the houses name so everyone knows who it belongs to
			*/
				return Map

			else
				Apopup(src,"Generating your player house with a custom template..")
				src.Savedx = src.x	  //We save the players X position into a variable
				src.Savedy = src.y	  //We save the players Y position into a variable
				src.Savedz = src.z	  //We save the players Z position into a variable

				Map = new("Maps/playerhouses/[src.ckey]",40,40,1)	//If there isn't a map we create a new one that is 60x60 tiles

				Map.BuildFilledRectangle(locate(Map.x1+26,Map.y1+1,Map.z1),\
				                         locate(Map.x1+38,Map.y1+15,Map.z1),\
				                         /turf/Tile)	//We build a filled rectangle from 26,1 to 38,15

				Map.BuildRectangle(locate(Map.x1+25,Map.y1,Map.z1),\
				                   locate(Map.x1+39,Map.y1+14,Map.z1),\
				                   /turf/Wall)	  //We build a rectangle from 25,0 to 39,14

				new/turf/Ladder(locate(Map.x1+32,Map.y1+1,Map.z1))

				covermap(Map)//cover the area

				return Map



mob/proc
	ExitMap()
		var/mob/M=src
		M.loc = locate(M.Savedx,M.Savedy,M.Savedz)	 //We teleport them to their saved location
		M.location = null


		//spawn() src.savemap()
		//we will save the maps in a diff way


		var/d=M.checkarea2()//incase they dont get teled
		if(d)//if it returns a swap map
			if(debug)alert("Failed tele")
			M.Respawn()//respawn if they didnt
			if(mapsets.len)
				for(var/Map/D in mapsets)	//first check if a map is available
				//if(D.inuse)continue
					if(D.houseowner==src.key)
						D.handler.Remove(src)//free the map for deleting
						D.inuse=0

		else
			if(mapsets.len)
				for(var/Map/D in mapsets)	//first check if a map is available
				//if(D.inuse)continue
					if(D.houseowner==src.key)
						D.handler.Remove(src)//free the map for deleting
						D.inuse=0






turf
	Tile
		icon='cutscene.dmi'
		icon_state = "tile"

	Wall
		icon='cutscene.dmi'
		icon_state = "wall"
		density = 1

	Ladder
		icon='cutscene.dmi'
		icon_state = "ladder"
		density = 1

		Enter(mob/M)
			if(ismob(M) && M.client)	//If a mon entered the ladder and is a player
				M.ExitMap()



	densevoid
		density = 1
		//This is used so players cannot run off the map if the swapmaps map is bigger than
		//the other maps










