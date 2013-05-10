mob/var/tmp/ride=0
mob/var/tmp/summoned=0
mob/var/frogsummoning=0
mob/var/snakesummoning=0
mob/var/slugsummoning=0
mob/var/beesummoning=0

mob/proc
	frog()
		if(usr.frogsummoning<=50)
			var/mob/Medium_Frog/B = new()
			B.owner=src
			B.name = "Gamakoucho"
			B.loc = locate(src.x, src.y - 1, src.z)
			src.summoned=1
			src.frogsummoning+=1
			B.health = 5000
			return

		if(usr.frogsummoning>=51)
			var/mob/Gamabunta/B = new()
			B.owner=src
			B.name = "Gamabunta"
			B.loc = locate(src.x, src.y - 1, src.z)
			src.summoned=1
			B.health = 5000
			return

	snake()
		if(usr.snakesummoning<=50)
			var/mob/Medium_Snake/B = new()
			B.owner=src
			B.name = "Small Snake"
			B.loc = locate(src.x, src.y - 1, src.z)
			src.summoned=1
			src.frogsummoning+=1
			B.health = 5000
			return

		if(usr.snakesummoning>=51)
			var/mob/Big_Snake/B = new()
			B.owner=src
			B.name = "Manda"
			B.loc = locate(src.x, src.y - 1, src.z)
			src.summoned=1
			B.health = 5000
			return

	slug()
		if(usr.slugsummoning<=50)
			var/mob/Medium_Slug/B = new()
			B.owner=src
			B.name = "Small Slug"
			B.loc = locate(src.x, src.y - 1, src.z)
			src.summoned=1
			src.frogsummoning+=1
			B.health = 5000
			return

		if(usr.slugsummoning>=51)
			var/mob/Big_Slug/B = new()
			B.owner=src
			B.name = "Katsuya"
			B.loc = locate(src.x, src.y - 1, src.z)
			src.summoned=1
			B.health = 5000
			return

	bee()
		if(usr.beesummoning<=50)
			var/mob/Medium_Bee/B = new()
			B.owner=src
			B.name = "Young Bee"
			B.loc = locate(src.x, src.y - 1, src.z)
			src.summoned=1
			src.frogsummoning+=1
			B.health = 5000
			return

		if(usr.beesummoning>=51)
			var/mob/Bee/B = new()
			B.owner=src
			B.name = "Beetha"
			B.loc = locate(src.x, src.y - 1, src.z)
			src.summoned=1
			B.health = 5000
			return








mob
	Bee
		icon='beetha1.dmi'
		icon_state="2"
		density=1
		layer=FLY_LAYER

		Bump(atom/M)
			if(istype(M,/mob/)) // If they run into the player
				if(M == owner)
					return
				if(!src.pk)
					usr<<"NONE PK ZONE!!!"
					return
				else
					var/mob/P = M
					var/Damage = 1000
					P.Dec_health(Damage,src,"Summon") // Takes the players health
					view()<<"The [src] attacks [M] for [Damage]!"




		New()
			..()
			overlays+=/obj/bpart2
			overlays+=/obj/bpart3
			overlays+=/obj/bpart4
			overlays+=/obj/bpart5
			overlays+=/obj/bpart6
			..()
		verb/Ride()
			set src in oview(1)
			set category="Summon"
			for(var/mob/Bee/G in oview(1,usr))
				if(G.owner==usr)
					if(!usr.ride&&!G.ride)
						usr.ride=1
						usr.controlled = G
						if(G)
							G.ride=1

					else
						usr.ride=0
						usr.controlled = null
						if(G)
							G.ride=0
		Move()
			..()
			var/mob/O = src.owner
			if(O.ride&&src.ride)
				O.loc=src.loc
				O.dir=src.dir
				O.y+=1

obj
	bpart2
		icon='beetha1.dmi'
		icon_state="1"
		density=1
		pixel_y=32
		name="2"
obj
	bpart3
		icon='beetha1.dmi'
		icon_state="3"
		density=1
		pixel_y=-32
		name="3"
obj
	bpart4
		icon='beetha1.dmi'
		icon_state="4"
		density=1
		pixel_x=32
		name="4"
obj
	bpart5
		icon='beetha1.dmi'
		icon_state="5"
		pixel_x=-32
		density=1
		name="5"

obj
	bpart6
		icon='beetha1.dmi'
		icon_state="5"
		density=1
		name="2"














mob
	Gamabunta
		icon='gammabunta1.dmi'
		icon_state="1,1"
		density=1
		layer=FLY_LAYER

		Bump(atom/M)
			if(istype(M,/mob/)) // If they run into the player
				if(M == owner)
					return
				if(!src.pk)
					usr<<"NONE PK ZONE!!!"
					return
				else
					var/mob/P = M
					var/Damage = 1000
					P.Dec_health(Damage,src,"Summon") // Takes the players health
					view()<<"The [src] attacks [M] for [Damage]!"




		New()
			..()
			overlays+=/obj/part2
			overlays+=/obj/part3
			overlays+=/obj/part4
			overlays+=/obj/part5
			overlays+=/obj/part6
			overlays+=/obj/part7
			overlays+=/obj/part8
			overlays+=/obj/part9
			overlays+=/obj/part10
			..()
		verb/Ride()
			set src in oview(1)
			set category="Summon"
			for(var/mob/Gamabunta/G in oview(1,usr))
				if(G.owner==usr)
					if(!usr.ride&&!G.ride)
						usr.ride=1
						usr.controlled = G
						if(G)
							G.ride=1

					else
						usr.ride=0
						usr.controlled = null
						if(G)
							G.ride=0
		Move()
			..()
			var/mob/O = src.owner
			if(O.ride&&src.ride)
				O.loc=src.loc
				O.dir=src.dir
				O.y+=1

obj
	part2
		icon='gammabunta1.dmi'
		icon_state="1,2"
		density=1
		pixel_y=32
		name="1"
obj
	part3
		icon='gammabunta1.dmi'
		icon_state="0,1"
		density=1
		pixel_x=-32
		name="2"
obj
	part4
		icon='gammabunta1.dmi'
		icon_state="2,1"
		density=1
		pixel_x=32
		name="3"
obj
	part5
		icon='gammabunta1.dmi'
		icon_state="0,2"
		pixel_x=-32
		density=1
		pixel_y=32
		name="4"
obj
	part6
		icon='gammabunta1.dmi'
		icon_state="2,2"
		pixel_x=32
		density=1
		pixel_y=32
		name="5"
obj
	part7
		icon='gammabunta1.dmi'
		icon_state="0,0"
		pixel_x=-32
		pixel_y=-32
		density=1
		name="6"
obj
	part8
		icon='gammabunta1.dmi'
		icon_state="1,0"
		density=1
		pixel_y=-32
		name="7"
obj
	part9
		icon='gammabunta1.dmi'
		icon_state="2,0"
		pixel_x=32
		density=1
		pixel_y=-32
		name="8"

obj
	part10
		icon='gammabunta1.dmi'
		icon_state="1,1"
		density=1
















mob
	Big_Snake
		icon='orochimarusnake.dmi'
		icon_state="0,0"
		density=1
		layer=FLY_LAYER

		Bump(atom/M)
			if(istype(M,/mob/)) // If they run into the player
				if(M == owner)
					return
				if(src.pk==0)
					usr<<"NONE PK ZONE!!!"
					return
				else
					var/mob/P = M
					var/Damage = 1000
					P.Dec_health(Damage,src,"Summon") // Takes the players health
					view()<<"The [src] attacks [M] for [Damage]!"




		New()
			..()
			overlays+=/obj/snake1
			overlays+=/obj/snake2
			overlays+=/obj/snake3
			overlays+=/obj/snake4
			overlays+=/obj/snake5
			overlays+=/obj/snake6
			overlays+=/obj/snake7
			overlays+=/obj/snake8
			..()
		verb/Ride()
			set src in oview(2)
			set category="Summon"
			for(var/mob/Big_Snake/G in oview(1,usr))
				if(G.owner==usr)
					if(!usr.ride&&!G.ride)
						usr.ride=1
						usr.controlled = G
						if(G)
							G.ride=1

					else
						usr.ride=0
						usr.controlled = null
						if(G)
							G.ride=0
		Move()
			..()
			var/mob/O = src.owner
			if(O.ride&&src.ride)
				O.loc=src.loc
				O.dir=src.dir
				O.y+=2
obj
	snake1
		icon='orochimarusnake.dmi'
		icon_state="0,1"
		density=1
		pixel_y=32
		name="2"
obj
	snake2
		icon='orochimarusnake.dmi'
		icon_state="1,0"
		density=1
		pixel_x=32
		name="2"
obj
	snake3
		icon='orochimarusnake.dmi'
		icon_state="1,1"
		density=1
		pixel_x=32
		pixel_y=32
		name="2"
obj
	snake4
		icon='orochimarusnake.dmi'
		icon_state="0,2"
		density=1
		pixel_y=64
		name="2"
obj
	snake5
		icon='orochimarusnake.dmi'
		icon_state="1,2"
		density=1
		pixel_x=32
		pixel_y=64
		name="2"

obj
	snake6
		icon='orochimarusnake.dmi'
		icon_state="0,0"
		density=1




obj
	snake7
		icon='orochimarusnake.dmi'
		icon_state="2,0"
		density=1

obj
	snake8
		icon='orochimarusnake.dmi'
		icon_state="2,1"
		density=1












mob
	Big_Slug
		icon='katsuya(1).dmi'
		icon_state="1,0"
		density=1
		layer=FLY_LAYER

		Bump(atom/M)
			if(istype(M,/mob/)) // If they run into the player
				if(M == owner)
					return
				if(src.pk==0)
					usr<<"NONE PK ZONE!!!"
					return
				else
					var/mob/P = M
					var/Damage = 1000
					P.Dec_health(Damage,src,"Summon") // Takes the players health
					view()<<"The [src] attacks [M] for [Damage]!"




		New()
			..()
			overlays+=/obj/kata1
			overlays+=/obj/kata2
			overlays+=/obj/kata3
			overlays+=/obj/kata4
			overlays+=/obj/kata5
			overlays+=/obj/kata6
			..()
		verb/Ride()
			set src in oview(1)
			set category="Summon"
			for(var/mob/Big_Slug/G in oview(1,usr))
				if(G.owner==usr)
					if(!usr.ride&&!G.ride)
						usr.ride=1
						usr.controlled = G
						if(G)
							G.ride=1
					else
						usr.ride=0
						usr.controlled = null
						if(G)
							G.ride=0
		Move()
			..()
			var/mob/O = src.owner
			if(O.ride&&src.ride)
				O.loc=src.loc
				O.dir=src.dir
				O.y+=1
obj
	kata1
		icon='katsuya(1).dmi'
		icon_state="0,0"
		density=1
		pixel_x=-32

obj
	kata2
		icon='katsuya(1).dmi'
		icon_state="2,0"
		density=1
		pixel_x=32

obj
	kata3
		icon='katsuya(1).dmi'
		icon_state="1,1"
		density=1
		pixel_y=32
obj
	kata4
		icon='katsuya(1).dmi'
		icon_state="0,1"
		density=1
		pixel_x=-32
		pixel_y=32

obj
	kata5
		icon='katsuya(1).dmi'
		icon_state="2,1"
		density=1
		pixel_x=32
		pixel_y=32

obj
	kata6
		icon='katsuya(1).dmi'
		icon_state="1,0"
		density=1








mob
	Medium_Frog
		icon='medium frog.dmi'
		icon_state="0,1"
		density=1


		Bump(atom/M)
			if(istype(M,/mob/)) // If they run into the player
				if(M == owner)
					return
				if(src.pk==0)
					usr<<"NONE PK ZONE!!!"
					return
				else
					var/mob/P = M
					var/Damage = 1000
					P.Dec_health(Damage,src,"Summon") // Takes the players health
					view()<<"The [src] attacks [M] for [Damage]!"


		New()
			..()
			overlays+=/obj/mfrog1
			overlays+=/obj/mfrog2
			overlays+=/obj/mfrog3
			overlays+=/obj/mfrog4
			..()
obj
	mfrog1
		icon='medium frog.dmi'
		icon_state="0,0"
		density=1
		pixel_y=-32
obj
	mfrog2
		icon='medium frog.dmi'
		icon_state="1,1"
		density=1
		pixel_x=32
obj
	mfrog3
		icon='medium frog.dmi'
		icon_state="1,0"
		density=1
		pixel_x=32
		pixel_y=-32
obj
	mfrog4
		icon='medium frog.dmi'
		icon_state="0,1"
		density=1










mob
	Medium_Bee
		icon='medium bee.dmi'
		icon_state="2"
		density=1

		layer=FLY_LAYER
		Bump(atom/M)
			if(istype(M,/mob/)) // If they run into the player
				if(M == owner)
					return
				if(src.pk==0)
					usr<<"NONE PK ZONE!!!"
					return
				else
					var/mob/P = M
					var/Damage = 1000
					P.Dec_health(Damage,src,"Summon") // Takes the players health
					view()<<"The [src] attacks [M] for [Damage]!"

		New()
			..()

			overlays+=/obj/mbee2
			overlays+=/obj/mbee3
			overlays+=/obj/mbee4
			overlays+=/obj/mbee5
			overlays+=/obj/mbee6
			..()
obj
	mbee2
		icon='beetha1.dmi'
		icon_state="1"
		density=1
		pixel_y=32
		name="2"
obj
	mbee3
		icon='beetha1.dmi'
		icon_state="3"
		density=1
		pixel_y=-32
		name="3"
obj
	mbee4
		icon='beetha1.dmi'
		icon_state="4"
		density=1
		pixel_x=32
		name="4"
obj
	mbee5
		icon='beetha1.dmi'
		icon_state="5"
		pixel_x=-32
		density=1
		name="5"

obj
	mbee6
		icon='beetha1.dmi'
		icon_state="2"










mob/Medium_Slug
	icon='mediumslug.dmi'
	icon_state="0,0"
	Bump(atom/M)
		if(istype(M,/mob/)) // If they run into the player
			if(M == owner)
				return
			if(src.pk==0)
				usr<<"NONE PK ZONE!!!"
				return
			else
				var/mob/P = M
				var/Damage = 1000
				P.Dec_health(Damage,src,"Summon") // Takes the players health
				view()<<"The [src] attacks [M] for [Damage]!"


	New()
		..()
		overlays+=/obj/msnail1
		overlays+=/obj/msnail2
		overlays+=/obj/msnail3
		overlays+=/obj/msnail4
		..()
obj
	msnail1
		icon='mediumslug.dmi'
		icon_state="1,0"
		density=1
		pixel_x=32
obj
	msnail2
		icon='mediumslug.dmi'
		icon_state="0,1"
		density=1
		pixel_y=32
obj
	msnail3
		icon='mediumslug.dmi'
		icon_state="1,1"
		density=1
		pixel_x=32
		pixel_y=32

obj
	msnail4
		icon='mediumslug.dmi'
		icon_state="0,0"
		density=1







mob
	Medium_Snake
		icon='snakemedium.dmi'
		icon_state="0,0"
		density=1
		layer=FLY_LAYER
		Bump(atom/M)
			if(istype(M,/mob/)) // If they run into the player
				if(M == owner)
					return
				if(src.pk==0)
					usr<<"NONE PK ZONE!!!"
					return
				else
					var/mob/P = M
					var/Damage = 1000
					P.Dec_health(Damage,src,"Summon") // Takes the players health
					view()<<"The [src] attacks [M] for [Damage]!"


		New()
			..()
			overlays+=/obj/msnake1
			overlays+=/obj/msnake2
			..()

obj
	msnake1
		icon='snakemedium.dmi'
		icon_state="0,1"
		density=1
		pixel_y=32

obj
	msnake2
		icon='snakemedium.dmi'
		icon_state="0,0"
		density=1









mob/failedslug
	icon='fail summons.dmi'
	icon_state="slug"

mob/failedsnake
	icon='fail summons.dmi'
	icon_state="snake"
mob/failedfrog
	icon='fail summons.dmi'
	icon_state="frog"
mob/failedbee
	icon='fail summons.dmi'
	icon_state="bee"










//////////////SUMMON PIECES/////////////////

turf/Click()
	for(var/mob/Medium_Snake/M in view())
		if(M.owner==usr)
			walk_towards(M,src)
	..()
mob/Click()
	for(var/mob/Medium_Snake/M in view())
		if(M.owner==usr)
			walk_towards(M,src)
	..()
turf/Click()
	for(var/mob/Medium_Frog/M in view())
		if(M.owner==usr)
			walk_towards(M,src)
	..()
mob/Click()
	for(var/mob/Medium_Frog/M in view())
		if(M.owner==usr)
			walk_towards(M,src)
	..()
turf/Click()
	for(var/mob/Medium_Slug/M in view())
		if(M.owner==usr)
			walk_towards(M,src)
	..()
mob/Click()
	for(var/mob/Medium_Slug/M in view())
		if(M.owner==usr)
			walk_towards(M,src)
	..()
turf/Click()
	for(var/mob/Big_Slug/M in view())
		if(M.owner==usr)
			walk_towards(M,src)
	..()
mob/Click()
	for(var/mob/Big_Slug/M in view())
		if(M.owner==usr)
			walk_towards(M,src)
	..()

turf/Click()
	for(var/mob/Medium_Bee/M in view())
		if(M.owner==usr)
			walk_towards(M,src)
	..()
mob/Click()
	for(var/mob/Medium_Bee/M in view())
		if(M.owner==usr)
			walk_towards(M,src)











obj/summoneffect
	icon='summoningeffect.dmi'
	density=0
obj/summoncircle
	icon='summoncircle.dmi'
	density=0
	layer=MOB_LAYER+1
mob/proc/Summoneffect()
	var/obj/summoneffect/U = new()
	var/obj/summoneffect/D = new()
	var/obj/summoneffect/L = new()
	var/obj/summoneffect/R = new()
	var/obj/summoneffect/NW = new()
	var/obj/summoneffect/NE = new()
	var/obj/summoneffect/SE = new()
	var/obj/summoneffect/SW = new()
	var/obj/summoncircle/SC = new()
	SC.loc=usr.loc
	flick("summon",SC)
	U.loc=src.loc
	walk(U,NORTH)
	D.loc=src.loc
	walk(D,SOUTH)
	L.loc=src.loc
	walk(L,WEST)
	R.loc=src.loc
	walk(R,EAST)
	NW.loc=src.loc
	walk(NW,NORTHWEST)
	NE.loc=src.loc
	walk(NE,NORTHEAST)
	SE.loc=src.loc
	walk(SE,SOUTHEAST)
	SW.loc=src.loc
	walk(SW,SOUTHWEST)
	sleep(3)
	if(U)
		del(U)
	if(D)
		del(D)
	if(L)
		del(L)
	if(R)
		del(R)
	if(NW)
		del(NW)
	if(NE)
		del(NE)
	if(SE)
		del(SE)
	if(SW)
		del(SW)

	if(SC)
		del(SC)