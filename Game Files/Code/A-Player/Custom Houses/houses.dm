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
			src.Createmap()

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

			src.map = SwapMaps_Load("Maps/playerhouses/[src.ckey]")	  //We check to see if there is a map already made

			if(src.map)	  //If a map is found...
				maps_created.Add(src.map)
				src.Savedx = src.x	  //We save the players X position into a variable
				src.Savedy = src.y	  //We save the players Y position into a variable
				src.Savedz = src.z	  //We save the players Z position into a variable

				covermap(src.map)//cover the area
			/*
				var/turf/House/Po = new/turf/House(src.loc)	  //We place the house turf at the players location
				Po.owner = src	  //Set the house's owner to the player
				Po.name = "[src]'s House"	//Change the houses name so everyone knows who it belongs to
			*/
				if(debug) world<<"[src.map.x1+32],[src.map.y1+2],[src.map.z1]"
				src.loc = locate(src.map.x1+32,src.map.y1+2,src.map.z1)	  //We teleport the player to the house
				src.toggle()//show map
				src.client.eye=src
			//	src.verbs -= /mob/verb/Claim_Land	//Lastly we get rid of this verb
				src.location = "[src]'s house"

				src<<"Map Loaded.."

			else
				src<<"Generating your player house with a custom template.."
				src.Savedx = src.x	  //We save the players X position into a variable
				src.Savedy = src.y	  //We save the players Y position into a variable
				src.Savedz = src.z	  //We save the players Z position into a variable

				src.map = new("Maps/playerhouses/[src.ckey]",40,40,1)	//If there isn't a map we create a new one that is 60x60 tiles

				src.map.BuildFilledRectangle(locate(map.x1+26,map.y1+1,map.z1),\
				                         locate(map.x1+38,map.y1+15,map.z1),\
				                         /turf/Tile)	//We build a filled rectangle from 26,1 to 38,15

				src.map.BuildRectangle(locate(map.x1+25,map.y1,map.z1),\
				                   locate(map.x1+39,map.y1+14,map.z1),\
				                   /turf/Wall)	  //We build a rectangle from 25,0 to 39,14

				new/turf/Ladder(locate(src.map.x1+32,src.map.y1+1,src.map.z1))

				covermap(src.map)//cover the area
				if(debug) world<<"[src.map.x1+32],[src.map.y1+2],[src.map.z1]"
				src.loc = locate(src.map.x1+32,src.map.y1+2,src.map.z1)
				src.location = "[src]'s house"
				src.toggle()//show map

				spawn() src.savemap()



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
				M.loc = locate(M.Savedx,M.Savedy,M.Savedz)	 //We teleport them to their saved location
				M.location = null


	densevoid
		density = 1
		//This is used so players cannot run off the map if the swapmaps map is bigger than
		//the other maps










