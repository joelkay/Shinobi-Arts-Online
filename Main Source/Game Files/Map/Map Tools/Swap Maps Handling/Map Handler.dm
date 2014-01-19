var/loadedmaps=1
var/list/mapsets=list()
var/MAPTIME=10//this var specifies how long the Map deleter waits before deleting maps
Map
	var/mname//maps name
	var/time//time before it gets deleted
	var/inuse=0//shows if the map is in use
	var/ready=1// shows if its ready, idk if this is used
	var/uses=0// number of uses the map has had
	var/setnum//this is the set the map contains
	var/houseowner//this var is for maps that have houses
	var/list/handler=list()//list of people in the map
	var/swapmap/mapsa//map a  it contains
	var/swapmap/mapsb//map b  it contains
	var/swapmap/mapsc//map c  it contains

	New(mob/h)
		time=MAPTIME//last 10 minutes before maps get phased out
		spawn(5) countdown()
		mapsets.Add(src)

	proc
		standby()//shows map is ready; for maps that dont allow instancing. Dungeons maybe? :)
			set background=1
			ready=1
			inuse=0
			uses++

		countdown()//the map deleter oh ohh
			set background=1
			while(time&&handler.len)
				sleep(600)//one minute
				time--
			if(!time)
				purge()


		purge()
			set background=1
			if(!time&&!handler.len)
				mapsa.Del()
				mapsb.Del()
				mapsc.Del()
				world.cleanup()
				loadedmaps--
				mapsets.Remove(src)

			else
				time=MAPTIME//well start again
				countdown()


	proc
		Generate(mob/M,var/num)// so allocating a map with just Allocate_Maps()gives the default stuff
			//Allocate_Maps(2)//gives us next map e,t.c
			switch(num)
				if(1)//allowing expansion for new cutscenes
					src.mapsa = SwapMaps_CreateFromTemplate("Maps/field")	 //load the scene map
					covermap(src.mapsa)
					spawn() Generateb(M,num)

				//if(2)
				//	src.mapsa = SwapMaps_CreateFromTemplate("Maps/blah")	 //load the scene map
				//	covermap(src.mapsa)
				//	spawn() Generateb(M,num)


		Generateb(mob/M,var/num)
			switch(num)
				if(1)//allowing expansion for new cutscenes
					src.mapsb = SwapMaps_CreateFromTemplate("Maps/dungeon")	 //load the next scene map
					covermap(src.mapsb)
					spawn() Generatec(M,num)

				//if(2)
				//	src.mapsa = SwapMaps_CreateFromTemplate("Maps/blah")	 //load the scene map
				//	covermap(src.mapsa)
				//	spawn() Generateb(M,num)



		Generatec(mob/M,var/num)
			switch(num)
				if(1)//allowing expansion for new cutscenes
					src.mapsc = SwapMaps_CreateFromTemplate("Maps/Dungeon2")	 //load the next scene map
					covermap(src.mapsc)

				//if(2)//allowing expansion for new cutscenes
				//	src.mapsc = SwapMaps_CreateFromTemplate("Maps/blah")	 //load the next scene map
				//	covermap(src.mapsc)



			if(M)//if they are there
				M.map=src.mapsa//hand out the fresh maps
				M.map2=src.mapsb//hand out the fresh maps
				M.map3=src.mapsc//hand out the fresh maps
				src.handler.Add(M)//add them to the list
			src.mname="set:[num],[loadedmaps]"//name our map
			M.mapset=src.name//for deleting later
			src.inuse=1//make it in use
			loadedmaps++//so we can keep track of the sets generated






mob/var/mapset

mob
	proc
		Allocate_House()
			var/available_map
			if(mapsets.len)
				for(var/Map/D in mapsets)	//first check if a map is available
					//if(D.inuse)continue
					if(D.houseowner==src.key)available_map=D//xD

				if(available_map)//if its in game already
					var/Map/D=available_map
					src.map = D.mapsa
					D.houseowner=src.key
					if(!src in D.handler)
						D.handler.Add(src)
					if(debug) src<<"[src.map.x1+32],[src.map.y1+2],[src.map.z1]"
					src.Savedx = src.x	  //We save the players X position into a variable
					src.Savedy = src.y	  //We save the players Y position into a variable
					src.Savedz = src.z	  //We save the players Z position into a variable
					src.loc = locate(src.map.x1+32,src.map.y1+2,src.map.z1)
					src.location = "[src]'s house"
					src.toggle()//show map
					AreaUpdate()
					D.handler.Add(src)//add em back to list
					//since its already named if in the list
					//D.name="house[src.name],[loadedmaps]"
					D.inuse=1
					D.uses++
					src<<"Map Loaded.."


				else//make a new one for them
					var/Map/D = new/Map
					var/loop=0
					D.mapsa = src.Createmap()//load the house map
					LOOP
					if(D.mapsa)
						D.houseowner=src.key
						D.handler.Add(src)
						src.map=D.mapsa
						if(debug) src<<"[src.map.x1+32],[src.map.y1+2],[src.map.z1]"
						src.loc = locate(src.map.x1+32,src.map.y1+2,src.map.z1)
						src.location = "[src]'s house"
						src.toggle()//show map
						AreaUpdate()
						if(D.time<MAPTIME)
							D.time=MAPTIME//give it more time before deletion
						D.mname="house[src.name],[loadedmaps]"
						D.inuse=1
						D.uses++
					else
						if(loop<10)//10 tries incase of lag e.e.tc
							loop++
							goto LOOP
						else
							src<<"Error1:We failed to create your map"

			else//if no map handlers are in game
				var/Map/D = new/Map
				var/loop=0
				D.mapsa = src.Createmap()	 //load the house map
				LOOP
				if(D.mapsa)
					D.houseowner=src.key
					D.handler.Add(src)
					src.map=D.mapsa
					if(debug) src<<"[src.map.x1+32],[src.map.y1+2],[src.map.z1]"
					src.loc = locate(src.map.x1+32,src.map.y1+2,src.map.z1)
					src.location = "[src]'s house"
					src.toggle()//show map
					AreaUpdate()
					loadedmaps++
					D.mname="house[src.name],[loadedmaps]"
					D.inuse=1
					D.uses++

				else
					if(loop<10)//10 tries incase of lag e.e.tc
						loop++
						goto LOOP
					else
						src<<"Error2:We failed to create your map"




		Allocate_Maps(var/num)//0= default maps in the cutscenes stuff
			var/list/available_maps=list()

			if(mapsets.len)
				for(var/Map/D in mapsets)	//first check if a map is available
					//if(D.inuse)continue
					if(!D.houseowner&&D.setnum==num)available_maps.Add(D)//dont give them houses

				if(available_maps.len)
					REPICK
					var/Map/x=pick(available_maps)
					if(x)
						x.inuse=1
						src.map = x.mapsa
						src.map2 = x.mapsb
						src.map3 = x.mapsc
						x.time=30//counter
						x.handler.Add(src)
						src.mapset=x
						//alert(src,"loading a preloaded map")
						AreaUpdate()
					else
						goto REPICK

				else
					//if not
					var/Map/D = new/Map
					//alert(src,"all maps in use, generating a new map")
					if(num)//default =1
						D.setnum=num//so it knows
						D.Generate(src,num)


			else
				//if not
				var/Map/D = new/Map
				//alert(src,"no maps in game generating a new map")
				if(num)//default =1
					D.setnum=num
					D.Generate(src,num)









mob/Owner
	verb
		check_Mapsets()
			set category="SwapMaps"
			if(!mapsets.len)
				src<<"No Loaded maps at the moment.."
			for(var/Map/D in mapsets)
				var/listclients=dd_list2text(D.handler, "; ")
				src<<"[D.mname],clients:[listclients], inuse:[D.inuse], uses:[D.uses], time before deletion:[D.time] minutes"



