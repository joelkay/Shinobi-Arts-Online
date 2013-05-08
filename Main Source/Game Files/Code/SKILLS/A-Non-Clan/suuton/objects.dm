obj
	Suitondragon
		icon='Waterdragon.dmi'
		icon_state = "head" //read New() above for more info. also check the projectiles.dmi
		layer = MOB_LAYER + 1//??
		var/list/wdtrails=new
		density=1

		New()
			..()
			spawn(60)//mpve lasts 6 secs
				del(src)

		Bump(atom/movable/a)
			if(ismob(a))
				var/mob/A=a
				var/mob/G=src.owner
				var/dmg=1000+(G.chakraforcemain/2)
				if(A!=G)
					A.Dec_health(dmg,G,"Suiton_Dragon")
					A << output("[src.owner]'s Suiton dragon you for [dmg]!", "combatlog")
				del(src)
			else
				del(src)

		Move()
			..()
			var/turf/old_loc = src.loc
			spawn()
				var/obj/O = new(old_loc)
				O.dir = src.dir
				O.icon = 'Waterdragon.dmi'
				O.icon_state="body"
				src.wdtrails += O




		Del()
			for(var/obj/o in src.wdtrails)
				del(o)
			..()


obj

	SuitonW // :)
		icon='Suiton.dmi'
		layer = MOB_LAYER + 1//??
		var/list/wtrails=new
		density=1

		one
			icon_state = "1"

		two
			icon_state = "2"

		three
			icon_state = "3"

		New()
			..()
			spawn(40)//mpve lasts 6 secs
				del(src)

		Bump(atom/movable/a)
			if(ismob(a))
				var/mob/A=a
				var/mob/B=src.owner
				src.loc=A.loc//plave object on user to carry on moving.
				var/dmg=500
				if(A==B)
					return
				A.Dec_health(dmg,B,"Suiton_Wave")
				A << output("[B]'s Suiton wave hit you for [dmg]!", "combatlog")

			if(isobj(a))
				var/obj/b=a
				src.loc=b.loc

		Move()
			..()
			var/turf/old_loc = src.loc
			spawn()
				var/obj/WATER/deletable/O = new/obj/WATER/deletable(old_loc)
				O.dir = src.dir
				O.owner=src.owner
				src.wtrails += O




	SuitonGW // :)
		icon='projectiles.dmi'
		icon_state = "Watershockwave" //read New() above for more info. also check the projectiles.dmi
		layer = MOB_LAYER + 1//??
		var/list/gwtrails=new
		density=1

		New()
			..()
			spawn(40)//mpve lasts 6 secs
				del(src)

		Bump(atom/movable/a)
			if(ismob(a))
				var/mob/A=a
				var/mob/B=src.owner
				src.loc=A.loc
				var/dmg=500
				if(A==B)
					return
				A.Dec_health(dmg,src.owner,"Suiton_GiantWave")
				A << output("[B]'s Suiton Giant wave hit you for [dmg]!", "combatlog")

			if(isobj(a))
				var/obj/b=a
				src.loc=b.loc

		Move()
			..()
			var/turf/old_loc = src.loc
			spawn()
				var/obj/WATER/deletable/O = new/obj/WATER/deletable(old_loc)
				O.dir = src.dir
				O.owner=src.owner
				src.gwtrails += O





	Suitonshark
		icon='projectiles.dmi'
		icon_state = "Watershark" //read New() above for more info. also check the projectiles.dmi
		layer = MOB_LAYER + 1//??
		var/list/wdtrails=new
		density=1

		New()
			..()
			spawn(60)//mpve lasts 6 secs
				del(src)

		Bump(atom/movable/a)
			if(ismob(a))
				var/mob/A=a
				var/dmg=2500
				A.Dec_health(dmg,src.owner,"Suiton_Shark")
				A << output("[src.owner]'s Suiton shark you for [dmg]!", "combatlog")
				del(src)
