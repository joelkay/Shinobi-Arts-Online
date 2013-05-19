mob
	verb
		Locate()
			set hidden=1
			Apopup(src,"[src.x],[src.y]")


	proc
		checkmap()
			map_locate()
			winset(src,null,{"
			Cpanel-checkmap.yourmarker.is-visible= "true";
			Cpanel-checkmap.enemymarker.is-visible= "true";
			Cpanel-checkmap.yourmarker.pos= "[y1],[y2]";
			Cpanel-checkmap.enemymarker.pos= "[e1],[e2]";
			"})

/*
	proc
		markers(num)
			for(num>0)
				winclone(src, "yourmarker", "yourmarker[num]")
				num--
				src.markers++

*/