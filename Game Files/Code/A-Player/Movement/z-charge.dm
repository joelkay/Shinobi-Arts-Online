mob
	verb
		attackz()
			set hidden=1
		//	if(!src.completedscenes)
		//		attackzc()//go to these instead
		//		return

			if(src.rasenganon)
				src.rcharge()


			if(src.chidorion)
				src.ccharge()


			if(src.drillon)
				src.drill()




mob/var/dashtrail
mob
	proc/ccharge()
		if(src.chidorion)
			src.canmove=0
			src.movespeed=0//speed up
			src.chidoricharge=1
			src.dashtrail=/obj/Chidoritrail
			var/mob/M=src.targeted
			if(M)
				src.Facedir(M)//face M
			src.Dash(10,src.dir)
			src.overlays-='chidorihold.dmi'
			src.chidoricharge=0
			src.chidorion=0

			spawn(10)
				for(var/X in dashtrails)
					del(X)


	proc/rcharge()
		if(src.rasenganon)
			src.canmove=0
			src.movespeed=0//speed up
			src.rasengancharge=1
			src.dashtrail=/obj/shunshin
			var/mob/M=src.targeted
			if(M)
				src.Facedir(M)//face M
			src.Dash(10,src.dir)
			src.overlays-='rasengan.dmi'
			src.rasengancharge=0
			src.rasenganon=0

			spawn(10)
				for(var/X in dashtrails)
					del(X)


	proc/shuncharge()
		if(src.inshunsh)
			src.canmove=0
			src.movespeed=0//speed up
			src.dashtrail=/obj/shunshin
			var/mob/M=src.targeted
			if(M)
				src.Facedir(M)//face M
			src.Dash(10,src.dir)
			src.overlays-='Shunshin.dmi'
			src.inshunsh=0

			spawn(10)
				for(var/X in dashtrails)
					del(X)



//Dash( tiles, direction, trailobject )


mob
	var/chidoricharge=0
	var/rasengancharge=0
	var/list/tmp/dashtrails=list()


