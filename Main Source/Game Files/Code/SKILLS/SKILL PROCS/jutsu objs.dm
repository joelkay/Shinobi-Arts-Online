////Fireblast////
obj
	Chidoritrail
		icon='Chidori Trail.dmi'
		layer=MOB_LAYER+1

obj
	kaitenblob
		icon='KaitenZ.dmi'
		//pixel_y=-5
		density=1
		layer=MOB_LAYER+1

obj
	trigram
		icon='trigram.dmi'
		pixel_y=-64
		pixel_x=-64
		density=0
		layer=3


obj
	butterflywings
		icon='butterfly.dmi'
		pixel_x=-16
		density=1
		layer=MOB_LAYER+1


obj/ball

	a1
		icon = 'Fireball.dmi'
		icon_state = "2"
		density = 0
		layer = MOB_LAYER + 1
	a2
		icon = 'Fireball.dmi'
		icon_state = "2"
		density = 0
		layer = MOB_LAYER + 1
	a3
		icon = 'Fireball.dmi'
		icon_state = "2"
		density = 0
		layer = MOB_LAYER + 1

	a4
		icon = 'Fireball.dmi'
		icon_state = "2"
		density = 0
		layer = MOB_LAYER + 1
	a5
		icon = 'Fireball.dmi'
		icon_state = "2"
		density = 0
		layer = MOB_LAYER + 1
	a6
		icon = 'Fireball.dmi'
		icon_state = "2"
		density = 0
		layer = MOB_LAYER + 1




mob/var/insleep=0
obj
	triggerable
		sleep
			icon = 'paralyse.dmi'
			density = 0
			layer = MOB_LAYER - 1
			var/time
			New()
				..()
				spawn(60)//mpve lasts 6 secs
					del(src)


			SteppedOn(atom/movable/a)
				..()
				if(ismob(a))
					var/mob/A=owner
					var/mob/M=a
					if(src.time>50)
						src.time=50
					if(M==A)return
					if(M.kawad)
						M.kawa()
						return

					M.doing=1
					M.canmove=0
					M.icon_state="ko"
					M.insleep=1
					spawn(src.time)
						M.canmove=1
						M.doing=0
						M.icon_state=""


			Entered(atom/movable/a)
				..()
				if(ismob(a))
					var/mob/A=owner
					var/mob/M=a
					if(src.time>50)
						src.time=50
					if(M==A)return
					if(M.kawad)
						M.kawa()
						return

					M.doing=1
					M.canmove=0
					M.icon_state="ko"
					M.insleep=1
					spawn(src.time)
						M.canmove=1
						M.doing=1
						M.icon_state=""




obj/DotonT

	open
		icon='dotoncage.dmi'
		icon_state = "begin"
		density = 0
		layer = MOB_LAYER + 1
		pixel_x=-32

	trapped
		icon='dotoncage.dmi'
		icon_state = "trap"
		density = 0
		layer = MOB_LAYER + 1
		pixel_x=-32
		var/trapped

		New()
			..()
			var/mob/g=owner
			var/mob/A=trapped
			if(!g||!A)return

			spawn(60)//lasts 10 secs
				del(src)
				g.canleech=0
				A.canmove=1
				A.indot=0
				A.doing=0


		Del()
			..()
			src.icon_state="release"

	leech
		icon='dotoncage.dmi'
		icon_state = "leech"
		density = 0
		layer = MOB_LAYER + 1
		pixel_x=-32
		var/trapped

		New()
			..()
			var/mob/g=owner
			var/mob/A=trapped
			if(!g||!A)return

			spawn(60)//lasts 10 secs
				del(src)
				g.canleech=0
				A.canmove=1
				g.canmove=1
				A.indot=0
				A.doing=0





		Del()
			..()
			src.icon_state="release"


/*
		New()
			..()
			overlays+=/obj/dpart1
			overlays+=/obj/dpart2
			overlays+=/obj/dpart3
			overlays+=/obj/dpart4
			..()

	trapped
		icon='dotoncage.dmi'
		icon_state = ""
		density = 0
		layer = MOB_LAYER + 1



		New()
			..()
			overlays+=/obj/epart1
			overlays+=/obj/epart2
			overlays+=/obj/epart3
			overlays+=/obj/epart4
			..()

	crushed
		icon='dotoncage.dmi'
		icon_state = ""
		density = 1
		layer = MOB_LAYER + 1

		New()
			..()
			overlays+=/obj/cpart1
			overlays+=/obj/cpart2
			overlays+=/obj/cpart3
			overlays+=/obj/cpart4
			..()

*/
obj
	dpart1
		icon='dotoncage.dmi'
		icon_state = "trap1"
		density = 0
		pixel_y=16
		pixel_x=-16
		layer = MOB_LAYER + 1


	dpart2
		icon='dotoncage.dmi'
		icon_state = "trap2"
		density = 0
		pixel_y=16
		pixel_x=16
		layer = MOB_LAYER + 1

	dpart3
		icon='dotoncage.dmi'
		icon_state = "trap3"
		density = 0
		pixel_y=-16
		pixel_x=16
		layer = MOB_LAYER + 1

	dpart4
		icon='dotoncage.dmi'
		icon_state = "trap4"
		density = 0
		pixel_y=-16
		pixel_x=-16
		layer = MOB_LAYER + 1

/////////////////////////////////////////

	epart1
		icon='dotoncage.dmi'
		icon_state = "doton1"
		density = 0
		pixel_y=16
		pixel_x=-16
		layer = MOB_LAYER + 1


	epart2
		icon='dotoncage.dmi'
		icon_state = "doton2"
		density = 0
		pixel_y=16
		pixel_x=16
		layer = MOB_LAYER + 1

	epart3
		icon='dotoncage.dmi'
		icon_state = "doton3"
		density = 0
		pixel_y=-16
		pixel_x=-16
		layer = MOB_LAYER + 1

	epart4
		icon='dotoncage.dmi'
		icon_state = "doton4"
		density = 0
		pixel_y=-16
		pixel_x=16
		layer = MOB_LAYER + 1

////////////////////////////////////////////////

	cpart1
		icon='dotoncage.dmi'
		icon_state = "crush1"
		density = 0
		pixel_y=16
		pixel_x=-16
		layer = MOB_LAYER + 1

	cpart2
		icon='dotoncage.dmi'
		icon_state = "crush2"
		density = 0
		pixel_y=16
		pixel_x=16
		layer = MOB_LAYER + 1

	cpart3
		icon='dotoncage.dmi'
		icon_state = "crush3"
		density = 0
		pixel_y=-16
		pixel_x=-16
		layer = MOB_LAYER + 1

	cpart4
		icon='dotoncage.dmi'
		icon_state = "crush4"
		density = 0
		pixel_y=-16
		pixel_x=16
		layer = MOB_LAYER + 1
/////PROJECTILES////


	shunshin
		icon='dirt trail.dmi'
		icon_state = "" //read New() above for more info. also check the projectiles.dmi
		layer = MOB_LAYER - 1
		var/list/strails=new
		density=0


	DotonR // :)
		icon='projectiles.dmi'
		icon_state = "Dotonriver" //read New() above for more info. also check the projectiles.dmi
		layer = MOB_LAYER - 1
		var/list/dtrails=new
		density=1

		New(loc,d,o) //loc = location, d = direction, o = owner
			..()
			owner = o
			walk(src,d,1) //utilize the walk() proc's third argument please...
			spawn(60) //6 seconds later...
				del (src) //delete itself


		Move()
			..()
			var/turf/old_loc = src.loc
			spawn()
				var/obj/O = new(old_loc)
				O.dir = src.dir
				O.icon = 'projectiles.dmi'
				O.icon_state="Dotonriver_trail"
				src.dtrails += O
		Del()
			for(var/obj/o in src.dtrails)
				del(o)
			..()

		Bump(atom/movable/a)
			if(ismob(a))
				var/mob/A=a
				var/dmg=2500
				A.Dec_health(dmg,src.owner,"Doton_River")
				A << output("[src.owner]'s doton river hit you for [dmg]!", "combatlog")
				del(src)
			else
				del(src)



	FuutonS // :)
		icon='projectiles.dmi'
		icon_state = "Fuutonsweep" //read New() above for more info. also check the projectiles.dmi
		layer = MOB_LAYER + 1//??
		density=1

		New(loc,d,o) //loc = location, d = direction, o = owner
			..()
			owner = o
			walk(src,d,2) //utilize the walk() proc's third argument please...
			spawn(40) //4 seconds later...
				del src //delete itself


		Bump(atom/movable/a)
			if(ismob(a))
				var/mob/A=a
				var/mob/B=src.owner
				if(A==B)
					return
				var/dmg=500
				A.Dec_health(dmg,B,"Fuuton_Sweep")
				A << output("[B]'s Fuuton sweep hit you for [dmg]!", "combatlog")
				del(src)
			else
				del(src)

	FuutonT // :)
		icon='projectiles.dmi'
		icon_state = "Fuutontornado" //read New() above for more info. also check the projectiles.dmi
		layer = MOB_LAYER + 1//??
		density=1

		New(loc,d,o) //loc = location, d = direction, o = owner
			..()
			owner = o
			walk(src,d,1) //utilize the walk() proc's third argument please...
			spawn(40) //4 seconds later...
				del src //delete itself


		Bump(atom/movable/a)
			if(ismob(a))
				var/mob/A=a
				var/mob/B=src.owner
				if(A==B)
					return
				var/dmg=800
				A.Dec_health(dmg,B,"Fuuton_Tornado")
				A << output("[B]'s Fuuton tornado hit you for [dmg]!", "combatlog")
				del(src)
			else
				del(src)

	FuutonSl // :)
		icon='projectiles.dmi'
		icon_state = "Fuutonslice" //read New() above for more info. also check the projectiles.dmi
		layer = MOB_LAYER + 1//??
		density=1


		New(loc,d,o) //loc = location, d = direction, o = owner
			..()
			owner = o
			walk(src,d,2) //utilize the walk() proc's third argument please...
			spawn(40) //4 seconds later...
				del src //delete itself


		Bump(atom/movable/a)
			if(ismob(a))
				var/mob/A=a
				var/mob/B=src.owner
				if(A==B)
					return
				var/dmg=1000
				Blood(A.x,A.y,A.z)
				var/randi=rand(1,8)
				A.Dec_life(randi,B,"Fuuton_Slice")
				A.Dec_health(dmg,B,"Fuuton_Slice")
				A << output("[B]'s Fuuton slice hit you for [dmg]!", "combatlog")
				del(src)
			else
				del(src)

	Fuuton_Trail
		icon='fuutonblast.dmi'
		icon_state = "trail" //read New() above for more info. also check the projectiles.dmi
		layer = MOB_LAYER + 1//??
		density=0


		New()
			..()
			spawn(40)//mpve lasts 6 secs
				del(src)


	FuutonB // :)
		icon='fuutonblast.dmi'
		icon_state = "wave" //read New() above for more info. also check the projectiles.dmi
		layer = MOB_LAYER + 1//??
		density=1


		New()
			..()
			spawn(30)//mpve lasts 6 secs
				del(src)

		Bump(atom/movable/a)
			if(ismob(a))
				var/mob/A=a
				var/mob/B=src.owner
				src.loc=A.loc
				var/dmg=2000
				if(A==B)
					return
				A.Dec_health(dmg,src.owner,"Fuuton_Blast")
				A << output("[B]'s Fuuton Blast hit you for [dmg]!", "combatlog")
			else
				del(src)


		Move()
			..()
			var/turf/old_loc = src.loc
			spawn()
				var/obj/Fuuton_Trail/O = new/obj/Fuuton_Trail(old_loc)
				O.dir = src.dir
				O.owner=src.owner



	DotonBH
		icon='projectiles.dmi'
		icon_state = "Muddragon" //read New() above for more info. also check the projectiles.dmi
		layer = MOB_LAYER + 1//??
		density=1

		New()
			..()
			spawn(240)//mpve lasts 6 secs
				del(src)



	DotonB
		icon='projectiles.dmi'
		icon_state = "Mudbullet" //read New() above for more info. also check the projectiles.dmi
		layer = MOB_LAYER + 1//??
		density=1

		New(loc,d,o) //loc = location, d = direction, o = owner
			..()
			owner = o
			walk(src,d,1) //utilize the walk() proc's third argument please...
			spawn(40) //4 seconds later...
				del src //delete itself


		Bump(atom/movable/a)
			if(ismob(a))
				var/mob/A=a
				var/dmg=500
				A.Dec_health(dmg,src.owner,"Doton_MudBullets")
				A << output("[src.owner]'s Doton Mud Bullet hit you for [dmg]!", "combatlog")
				del(src)
			else
				del(src)






obj
	iceneedle
		//cx = 8
		//cy = 8
		icon='haku.dmi'
		icon_state = "needle"
		layer = MOB_LAYER+1
		density=1


		Bump(atom/movable/a)
			if(ismob(a))
				var/mob/B=a
				Blood(B.x,B.y,B.z)
				var/mob/G=src.owner
				var/dmg=(G.reflexmain/40)*250
				var/X=rand(2,5)
				B.Dec_life(X,G,"ice_needles")
				B << output("[G]'s iceneedle hit you for [dmg]!", "combatlog")
				B.Dec_health(dmg,G,"ice_needles")// use Dec_health boi
				del(src)
			else
				del(src)

obj
	giveice  // <----- Made an Object that has the icon bluealert.dmi in it.
		icon = 'giveice.dmi'


obj
	meattank
		//cx = 8
		//cy = 8
		icon='meattank.dmi'
		layer = MOB_LAYER+1
		density=1

mob
	Bump(atom/movable/a)
		if(ismob(a))
			if(src.inmeat)
				var/mob/B=a
				var/mob/G=src
				G.loc=B.loc
				var/dmg=(G.strengthmain/50)*500
				B << output("[G]'s meattank hit you for [dmg]!", "combatlog")
				B.Dec_health(dmg,G,"Meattank")// use Dec_health boi

		..()



/*
///////NARA//////////////
obj
	shadowtrail2
		icon='kagemane.dmi'
		icon_state="needle trail"

		layer=MOB_LAYER-1

	Needlebar
		icon='kagemane.dmi'
		icon_state="Bar"

		layer=MOB_LAYER-1




	spike
		density=1
		icon='kagemane.dmi'
		icon_state="Spike"

		layer=MOB_LAYER-1
		var/list/naratrails=new
		var/nfirst=0


		Del()
			for(var/obj/O in src.naratrails)
				del(O)
			..()

		Bump(atom/movable/a)
			if(ismob(a))
				var/mob/A=a
				var/mob/G=src.owner
				if(A==G)
					return
				src.loc=A.loc
				Blood(A.x,A.y,A.z)
				var/dmg=(G.chakraforcemain/50)*250
				A << output("[G]'s spike needle hit you for [dmg]!", "combatlog")
				A.Dec_health(dmg,G,"Shadow_Needles")// use Dec_health boi

		Move()
			..()
			var/obj/shadowtrail2/T = new /obj/shadowtrail2
			if(src.dir == NORTH)
				T.loc = src.loc
				T.y = src.y-1
				T.dir = src.dir
				T.owner=src.owner
			if(src.dir == SOUTH)
				T.loc = src.loc
				T.y = src.y+1
				T.dir = src.dir
				T.owner=src.owner
			if(src.dir == WEST)
				T.loc = src.loc
				T.x = src.x+1
				T.dir = src.dir
				T.owner=src.owner
			if(src.dir == EAST)
				T.loc = src.loc
				T.x = src.x-1
				T.dir = src.dir
				T.owner=src.owner
			if(src.dir == NORTHWEST)
				T.loc = src.loc
				T.y = src.y-1
				T.x = src.x+1
				T.dir = src.dir
				T.owner=src.owner
			if(src.dir == NORTHEAST)
				T.loc = src.loc
				T.y = src.y-1
				T.x = src.x-1
				T.dir = src.dir
				T.owner=src.owner
			if(src.dir == SOUTHWEST)
				T.loc = src.loc
				T.x = src.x+1
				T.y = src.y+1
				T.dir = src.dir
				T.owner=src.owner
			if(src.dir == SOUTHEAST)
				T.loc = src.loc
				T.x = src.x-1
				T.y = src.y+1
				T.dir = src.dir
				T.owner=src.owner


*/
///////////HYUUGA////////////
obj
	hake1
		icon='hake64.dmi'
		icon_state="0,0"
		layer=MOB_LAYER-1
	hake2
		icon='hake64.dmi'
		icon_state="1,0"
		layer=MOB_LAYER-1
	hake3
		icon='hake64.dmi'
		icon_state="2,0"
		layer=MOB_LAYER-1
	hake4
		icon='hake64.dmi'
		icon_state="0,1"
		layer=MOB_LAYER-1
	hake5
		icon='hake64.dmi'
		icon_state="1,1"
		layer=MOB_LAYER-1
	hake6
		icon='hake64.dmi'
		icon_state="2,1"
		layer=MOB_LAYER-1
	hake7
		icon='hake64.dmi'
		icon_state="0,2"
		layer=MOB_LAYER-1
	hake8
		icon='hake64.dmi'
		icon_state="1,2"
		layer=MOB_LAYER-1
	hake9
		icon='hake64.dmi'
		icon_state="2,2"
		layer=MOB_LAYER-1




obj
	Bbullet
		icon='kaguya.dmi'
		icon_state="bbulet"
		density=1



		Bump(atom/movable/a)
			if(ismob(a))
				var/mob/B=a
				Blood(B.x,B.y,B.z)
				var/mob/G=src.owner
				var/dmg=(G.reflexmain/40)*150
				var/X=rand(2,5)
				B.Dec_life(X,G,"Bone_Bullets")
				B << output("[G]'s Bone Bullets hit you for [dmg]!", "combatlog")
				B.Dec_health(dmg,G,"Bone_Bullets")// use Dec_health boi
				del(src)
			else
				del(src)


obj
	SShuriken
		icon='gaara.dmi'
		icon_state="shuriken"
		density=1



		Bump(atom/movable/a)
			if(ismob(a))
				var/mob/B=a
				Blood(B.x,B.y,B.z)
				var/mob/G=src.owner
				var/dmg=(G.reflexmain/30)*100
				var/X=rand(2,5)
				B.Dec_life(X,G,"Sand_shuriken")
				B << output("[G]'s Sand shuriken hit you for [dmg]!", "combatlog")
				B.Dec_health(dmg,G,"Sand_shuriken")// use Dec_health boi
				del(src)
			else
				del(src)

	Sandspike
		icon='gaara.dmi'
		icon_state="spike"
		density=0


		New()
			..()
			spawn(80)
				del(src)


	Sawa
		icon='kaguya.dmi'
		icon_state="spike"
		density=1


		New()
			..()
			spawn(80)
				del(src)


	RatonS // :)
		icon='chidori spear.dmi'
		icon_state = "tip" //read New() above for more info. also check the projectiles.dmi
		layer = MOB_LAYER - 1
		var/list/dtrails=new
		density=1

		var/canbump=1

		New(loc,d,o) //loc = location, d = direction, o = owner
			..()
			owner = o
			src.canbump=1
			walk(src,d,1) //utilize the walk() proc's third argument please...
			spawn(60) //6 seconds later...
				del(src) //delete itself


		Move()
			..()
			var/turf/old_loc = src.loc
			spawn()
				var/obj/O = new(old_loc)
				O.dir = src.dir
				O.icon = 'chidori spear.dmi'
				O.icon_state="mid"
				src.dtrails += O

		Del()
			for(var/obj/o in src.dtrails)
				del(o)
			..()


		Bump(atom/movable/a)
			if(!src.canbump)
				return
			if(ismob(a))
				if(!owner) return
				var/mob/A=a
				if(A&&src.owner)
					var/dmg=(owner:reflexmain*25)
					var/X=rand(5,20)
					A.Dec_life(X,src.owner,"Chidori_Blade")
					if(A)A.Dec_health(dmg,src.owner,"Chidori_Blade")
					Blood(A.x,A.y,A.z)
					A << output("[src.owner]'s Raton sword hit you for [dmg]!", "combatlog")
					src.canbump=0
				spawn(20)
					del(src)
			else
				del(src)


	PoisonB
		icon='poison.dmi'
		icon_state = "" //read New() above for more info. also check the projectiles.dmi
		layer = MOB_LAYER + 1
		density=1


		New()
			..()
			spawn(40)
				del(src)


		Bump(atom/movable/a)
			if(ismob(a))
				var/mob/D=src.owner
				var/mob/A=a
				var/dmg=500
				flick('poison2.dmi',src)
				A.Dec_health(dmg,D,"Poison_Bomb")
				A << output("[src.owner]'s poison hit you for [dmg]!", "combatlog")
				del(src)
			else
				del(src)



obj
	triggerable
		bloodcircle
			icon = 'Jashin.dmi'
			icon_state = "circle"
			density = 0
			layer = MOB_LAYER - 1

			SteppedOn(a)
				..()
				if(ismob(a))
					var/mob/O=a
					if(O)
						if(src.owner==O)
							O<<"<font color=blue>You enter the circle.."
							O.incircle=1


			SteppedOff(a)
				..()
				if(ismob(a))
					var/mob/O=a
					if(O)
						if(src.owner==O)
							O<<"<font color=blue>You exit the circle.."
							O.incircle=0




mob
	puppet1
		icon='puppet1.dmi'
		name
		health
		owner=""
		overlays
		deletable=1
		savedi
		strength
		contrtol
	puppet2
		icon='puppet2.dmi'
		name
		health
		overlays
		deletable=1
		savedi
		owner=""
		strength
		contrtol
	puppet3
		icon='puppet3.dmi'
		name
		health
		overlays
		deletable=1
		savedi
		owner=""
		strength
		contrtol
		var/crushing=0

		Bump(atom/movable/a)
			if(ismob(a))
				var/mob/D=src.owner
				var/mob/A=a
				var/dmg=4000
				if(src.crushing)
					D<<"You have trapped an opponent.."
					src.icon_state="pwned"
					A.loc=src.loc
					A.icon="pwn"
					A.canmove=0
					src.canmove=0
					src.crushing=0
					sleep(40)
					A.Affirm_Icon()
					Blood(A.x,A.y,A.z)
					A.canmove=1
					src.canmove=1
					A.Dec_health(dmg,D,"Puppet_Crush")
					A << output("[src.owner]'s puppet crush hit you for [dmg]!", "combatlog")
					src.crushing=0






obj
	C3effect
		icon='C3 effect.dmi'
		icon_state="ExplodeMiddle"
		density=0
		layer=FLY_LAYER


		New()
			..()
			overlays+=/obj/side
			overlays+=/obj/side2
			overlays+=/obj/side3
			overlays+=/obj/side4
			overlays+=/obj/side5
			overlays+=/obj/side6
			spawn(60)
				del(src)
			..()

obj
	side
		icon='C3 effect.dmi'
		icon_state="ExplodeTopRight"


obj
	side2
		icon='C3 effect.dmi'
		icon_state="ExplodeTopLeft"


obj
	side3
		icon='C3 effect.dmi'
		icon_state="ExplodeMiddleLeft"


obj
	side4
		icon='C3 effect.dmi'
		icon_state="ExplodeMiddleRight"

obj
	side5
		icon='C3 effect.dmi'
		icon_state="ExplodeBottomLeft"


obj
	side6
		icon='C3 effect.dmi'
		icon_state="ExplodeBottomRight"


obj/smoke
	icon = 'smokeeff.dmi'
	opacity=1
	luminosity=1
	layer=MOB_LAYER+1
	New()
		..()
		flick("explode v2",src)
		walk_rand(src,5)
		src.icon_state="effect v2"
		spawn(200)
			del(src)

mob
	var/smoketime=0
	verb
		test_smoke()//TEST SMOKE
			set category = "Character Management"

			if(smoketime)
				src<<"Hold on, dont spam.."
				smoketime=10
				return
			else
				src<<"Creating smoke.."


			while(smoketime>0)
				smoketime--
				spawn()
				new/obj/smoke(locate(src.x,src.y,src.z))

			return



/*
obj/dull // :)
	icon='dull.dmi'
	icon_state = "100" //read New() above for more info. also check the projectiles.dmi
	density=1
	opacity=1
	layer=MOB_LAYER+5
	var/namz

	New(a) //loc = location, d = direction, o = owner
		..()
		src.namz=a
		src.Refresh()

	proc/Refresh()
		for(var/Skill/e in usr.client.screen)
			if(e.sindex==src.namz)
				var/percent=round(e.cooldown/e.maxcooldown*80,10)
				for(var/obj/dull/x in e.overlays)
					x.icon_state=num2text(percent)


		for(var/Skill/f in usr.contents)
			if(f.sindex==src.namz)
				var/percent2=round(f.cooldown/f.maxcooldown*80,10)
				for(var/obj/dull/z in f.overlays)
					z.icon_state=num2text(percent2)


		spawn(10)

			src.Refresh()

*/