world
	New()
		swapmaps_mode=SWAPMAPS_TEXT
		swapmaps_iconcache=list("grass"='cutscene.dmi',"tile"='cutscene.dmi',"wall"='cutscene.dmi',"ladder"='cutscene.dmi')
		..()

mob/proc
	savemap()
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
	verb
		testhouse()
			set hidden=1
			set category="Player House"
			src.Createmap()

mob
	proc
		windowset()
			winset(src,null,{"
			default.is-maximized="true";
			fulls.is-disabled="false";
			televerbs.is-disabled="false";
			commandz.is-disabled="false";
			defaulta.default_main.left = "mapbox";
			defaulta.default_right.left = "childright";
			defaulta.default_top.left = "childtop";
			childtop.label2.text = "[mname]";
			childtop.label5.text = "[current]";
			"})
			src.mapmode=2
			src.client.Resolution()

mob
	var/tmp
		swapmap/map	  //Creates a variable that is a swapmaps map
		swapmap/map2	  //Creates a variable that is a swapmaps map
		location	//Is used later on to see who is on who's map


mob
	proc
		Createmap()
			src.map = SwapMaps_Load("Maps/playerhouses/[src.ckey]")	  //We check to see if there is a map already made
			if(src.location) return//can only do it in real world.
			if(src.map)	  //If a map is found...
				covermap(src.map)//cover the area
				src.windowset()
			/*	sr
				var/turf/House/Po = new/turf/House(src.loc)	  //We place the house turf at the players location
				Po.owner = src	  //Set the house's owner to the player
				Po.name = "[src]'s House"	//Change the houses name so everyone knows who it belongs to
			*/
				src.loc = locate(src.map.x1+32,src.map.y1+2,src.map.z1)	  //We teleport the player to the house
				src.client.eye=src
			//	src.verbs -= /mob/verb/Claim_Land	//Lastly we get rid of this verb
				src.location = "[src]'s house"
				src.toggle()//show map
				src<<"Map Loaded."

			else
				src<<"Generating your player house with a custom template."
				src.windowset()

				src.map = new("Maps/playerhouses/[src.ckey]",40,40,1)	//If there isn't a map we create a new one that is 60x60 tiles

				src.map.BuildFilledRectangle(locate(map.x1+26,map.y1+1,map.z1),\
				                         locate(map.x1+38,map.y1+15,map.z1),\
				                         /turf/Tile)	//We build a filled rectangle from 26,1 to 38,15

				src.map.BuildRectangle(locate(map.x1+25,map.y1,map.z1),\
				                   locate(map.x1+39,map.y1+14,map.z1),\
				                   /turf/Wall)	  //We build a rectangle from 25,0 to 39,14

				new/turf/Ladder(locate(src.map.x1+32,src.map.y1+1,src.map.z1))

				covermap(src.map)//cover the area

				src.loc = locate(src.map.x1+32,src.map.y1+2,src.map.z1)
				src.location = "[src]'s house"
				spawn() src.savemap()
				src.toggle()//show map




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
		layer=9999

		Entered(mob/M)
			if(ismob(M) && M.client)	//If a mon entered the ladder and is a player
				Apopup(M,"no world to go out in :P")
				M.location = null

		Del()
			Apopup(usr,"thats clever, so how do you plan to go out? baka")
			new/turf/Ladder(locate(usr.map.x1+32,usr.map.y1+1,usr.map.z1))


	densevoid
		density = 1
		//This is used so players cannot run off the map if the swapmaps map is bigger than
		//the other maps










