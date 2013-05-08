/////////DEIDARA//////////

obj//to place the stuff.
	C3
		icon = 'gammabomb.dmi'
		icon_state = ""
		density = 1
		layer = MOB_LAYER + 1


		New()
			..()
			spawn(60)//mpve lasts 4 secs
				del(src)

		proc/Explode()
			var/mob/U=owner
			var/dmg=800+(U.chakraforcemain*10)

			src.invisibility=100//dont wna see it
			Execution2(/obj/explosion,12,dmg,src,U)

obj
	Explodespider
		//cx = 8
		//cy = 8
		icon='spider.dmi'
		icon_state = "spider"
		layer = MOB_LAYER+1
		density=1

		New(vari)
			..()
			//world<<"[vari]" debuggin
			if(vari)
				spawn(10)//mpve lasts 1 secs
					del(src)
			else
				spawn(100)//mpve lasts 10 secs
					del(src)

		Del()
			var/mob/G=src.owner
			var/dmg=(G.chakraforcemain/2)+200
			Execution2(/obj/explosion,1,dmg,src,G)
			..()


		Bump(atom/movable/a)
			if(ismob(a))
				var/mob/B=a
				var/mob/G=src.owner

				if(B==G)
					src.loc=G.loc

				else
					var/dmg= 550+G.chakraforcemain
					src.loc=B.loc
					if(B)
						Execution2(/obj/explosion,1,dmg,src,G)
					del(src)
			else
				del(src)

obj
	Explodebird
		//cx = 8
		//cy = 8
		icon='bird.dmi'
		icon_state = "bird"
		layer = MOB_LAYER+1
		density=1
		var/xploded

		New()
			..()
			spawn(45)//mpve lasts 4,5 secs
				del(src)

		Del()
			if(!src.xploded)
				flick('explosion.dmi',src)
				var/mob/G=src.owner
				var/dmg=200+G.chakraforcemain
				Execution2(/obj/explosion,1,dmg,src,G)
			..()

		Bump(atom/movable/a)
			if(ismob(a))
				var/mob/B=a
				var/mob/G=src.owner

				if(B==G)
					src.loc=G.loc

				else
					src.xploded=1
					var/dmg=550+G.chakraforcemain
					if(B)
						Execution2(/obj/explosion,1,dmg,src,G)
					del(src)
			else
				del(src)

	Explodebirdm
		//cx = 8
		//cy = 8
		icon='deidara.dmi'
		icon_state = "bird"
		layer = MOB_LAYER+1
		density=1
		var/xploded

		New()
			..()
			spawn(35)//mpve lasts 3.5 secs
				del(src)

		Del()
			if(!src.xploded)
				flick('explosion.dmi',src)
				var/mob/G=src.owner
				var/dmg=200+G.chakraforcemain
				Execution2(/obj/explosion,1,dmg,src,G)
			..()

		Bump(atom/movable/a)
			if(ismob(a))
				var/mob/B=a
				var/mob/G=src.owner

				if(B==G)
					src.loc=G.loc

				else
					spawn()flick('explosion.dmi',src)
					src.xploded=1
					var/dmg=550+G.chakraforcemain
					if(B)
						Execution2(/obj/explosion,1,dmg,src,G)

					del(src)

			if(isobj(a))
				src.loc=a.loc

			else
				del(src)

mob
	Flying_Bird
		icon='RideBird.dmi'
		canmapskip=1
		icon_state="summon"
		density=0
		layer=FLY_LAYER+5

		proc/unsummon()
			var/mob/G=src.owner
			G.controlled = null
			G.client.eye = G
			icon_state="summon"
			spawn(10)
				del(src)

		Move()
			var/mob/G=src.owner
			if(G&&!G.koed)
				..()
				G.loc=src.loc
			else
				End()


		proc/End()
			var/mob/G=src.owner

			var/turf/T = get_step(src,src.dir)
			if(T.density)
				G << output("[G]: You cant land here", "combatlog")//
				return
			else
				unsummon()
				icon_state="summon"
				G << output("[G]: You Stop Flying", "combatlog")//
				G.invisibility=0
				G.density=1






obj
	explosion
		icon='explosion.dmi'

		New()
			..()
			spawn(10)//mpve lasts 1 secs
				del(src)
