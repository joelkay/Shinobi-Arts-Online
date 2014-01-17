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
				src.align()
				scene1begin(src)
				vis.can_see(src.name)




















