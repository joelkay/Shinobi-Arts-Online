mob
	var/tmp/list/maps_created=list()
	var/tmp/b=0
	var/tmp/swapmap/map3
	var/tmp/completedscenes=1
	var/tmp/firstattack=0
	proc
		mainscene1()
			completedscenes=0
			if(src.map)
				src.client.show_verb_panel = 1

				vis.can_see(src.name)//make them see their instance
				//vis.is_a(src.name)/this creates double mobs

				src.align()
				src.scene1begin()















