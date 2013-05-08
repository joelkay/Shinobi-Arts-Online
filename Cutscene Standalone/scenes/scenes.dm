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
				//src.filltest()//only they can see it
				winset(src,null,{"
				default.main.left = "map";
				default.bottomchild.left = "bottombars";
				default.belowchatchild.left = "belowchat";
				default.macro= macro
				"})
				src.scene1begin()





















