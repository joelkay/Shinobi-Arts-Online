var/loadedmaps=1
var/list/mapsets=list()
Map
	var/name
	var/time=2
	var/inuse=0
	var/ready=1
	var/uses=0
	var/list/handler=list()
	var/swapmap/mapsa
	var/swapmap/mapsb
	var/swapmap/mapsc

	New(mob/h)
		time=30//last 15 minutes before maps get phased out
		spawn(5) countdown()
		mapsets.Add(src)

	proc
		standby()
			set background=1
			ready=1
			uses++


	proc
		Generate(mob/M)
			src.mapsa = SwapMaps_CreateFromTemplate("Maps/field")	 //load the scene map
			covermap(src.mapsa)
			spawn() Generateb(M)

		Generateb(mob/M)
			src.mapsb = SwapMaps_CreateFromTemplate("Maps/dungeon")	 //load the next scene map
			covermap(src.mapsb)
			spawn() Generatec(M)

		Generatec(mob/M)
			src.mapsc = SwapMaps_CreateFromTemplate("Maps/Dungeon2")	 //load the next scene map
			covermap(src.mapsc)
			if(M)
				M.map=src.mapsa
				M.map2=src.mapsb
				M.map3=src.mapsc
				M.mapset=src
				src.handler.Add(M)
			src.name="set[loadedmaps]"
			src.inuse=1
			loadedmaps++



	proc
		countdown()
			set background=1
			while(time&&handler.len)
				sleep(600)
				time--

			if(!time||!handler.len)
				mapsa.Del()
				mapsb.Del()
				mapsc.Del()
				world.cleanup()
				loadedmaps--
			mapsets.Remove(src)





mob/var/mapset

mob
	proc
		Allocate_Maps()
			var/list/available_maps=list()

			if(mapsets.len)
				for(var/Map/D in mapsets)	//first check if a map is available
					//if(D.inuse)continue
					if(D)available_maps.Add(D)

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
					D.Generate(src)


			else
				//if not
				var/Map/D = new/Map
				//alert(src,"no maps in game generating a new map")
				D.Generate(src)









mob/Owner
	verb
		check_Mapsets()
			set category="SwapMaps"
			if(!mapsets.len)
				src<<"No Loaded maps at the moment.."
			for(var/Map/D in mapsets)
				src<<"[D.name],clients:[D.handler], inuse:[D.inuse], uses:[D.uses], time before deletion:[D.time]"



