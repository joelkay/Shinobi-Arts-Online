obj/DemonMirror
	icon='ice_mirrors.dmi'
	density=1


obj
	Mirrorice
		icon='mirror.dmi'
		icon_state="ice"
		density=1

		New()
			..()
			spawn(30)
				del(src)

		Bump(atom/movable/a)
			if(ismob(a))
				var/mob/B=a
				Blood(B.x,B.y,B.z)
				var/mob/G=src.owner
				var/dmg=(G.reflexmain/40)*5
				var/X=rand(2,5)
				if(B)
					B.Dec_life(X,G,"ice_mirrors")
					B << output("[G]'s iceneedle hit you for [dmg]!", "combatlog")
					B.Dec_health(dmg,G,"ice_mirrors")// use Dec_health boi
				del(src)
			else
				del(src)


obj
	DenseThing
		density=1



obj
	mirrorbump
		icon='mirror.dmi'
		icon_state="start"
		density=1
		Bump(atom/movable/a)
			if(ismob(a))
				var/mob/X=a
				src.loc=locate(X.x,X.y,X.z)
				var/mob/Z=src.owner
				if(X==Z)
					return
				if(!X==Z.targeted)
					return
				X.canmove=0
				Z.canmove=0
				Z.loc=src.loc
				Mirror_create(X,Z,src)
			else
				del(src)

proc
	Mirror_create(mob/X,mob/Z,obj/M)
		if(!X)return
		var/obj/DemonMirror/A = new /obj/DemonMirror
		var/obj/DemonMirror/B = new /obj/DemonMirror
		var/obj/DemonMirror/C = new /obj/DemonMirror
		var/obj/DemonMirror/D = new /obj/DemonMirror
		var/obj/DemonMirror/E = new /obj/DemonMirror
		var/obj/DemonMirror/F = new /obj/DemonMirror
		var/obj/DemonMirror/G = new /obj/DemonMirror
		var/obj/DemonMirror/H = new /obj/DemonMirror
		A.owner=Z
		B.owner=Z
		C.owner=Z
		D.owner=Z
		E.owner=Z
		F.owner=Z
		G.owner=Z
		H.owner=Z
		A.icon_state="forming"
		B.icon_state="forming"
		C.icon_state="forming"
		D.icon_state="forming"
		E.icon_state="forming"
		F.icon_state="forming"
		G.icon_state="forming"
		H.icon_state="forming"

		A.dir=NORTH
		B.dir=NORTHWEST
		C.dir=NORTHEAST

		D.dir=WEST
		E.dir=EAST

		F.dir=SOUTH
		G.dir=SOUTHWEST
		H.dir=SOUTHEAST


		A.loc = locate(Z.x,Z.y+2,Z.z)//North
		B.loc = locate(Z.x-2,Z.y+2,Z.z)//NorthWest
		C.loc = locate(Z.x+2,Z.y+2,Z.z)//NorthEast

		D.loc = locate(Z.x-3,Z.y,Z.z)//West
		E.loc = locate(Z.x+3,Z.y,Z.z)//East

		F.loc = locate(Z.x,Z.y-2,Z.z)//South
		G.loc = locate(Z.x-2,Z.y-2,Z.z)//SouthWest
		H.loc = locate(Z.x+2,Z.y-2,Z.z)//SouthEast


		spawn(7)
			A.icon_state="final"
			B.icon_state="final"
			C.icon_state="final"
			D.icon_state="final"
			E.icon_state="final"
			F.icon_state="final"
			G.icon_state="final"
			H.icon_state="final"
			del(M)

		Z.invisibility=100
		var/x=pick(1,4)
		switch(x)
			if(1)
				Z.loc=A.loc
			if(2)
				Z.loc=D.loc
			if(3)
				Z.loc=E.loc
			if(4)
				Z.loc=F.loc
		Z.doing=1
		X.canmove=1
		X.doing=1
		spawn()Z.Mirrors(X)




mob
	proc
		Mirrors(mob/X)
			var/list/tiles=list()
			for(var/obj/DemonMirror/F in range(20,src))
				if(F.owner==src)
					tiles.Add(F)

			if(!tiles.len)
				src.canmove=1
				src.invisibility=0
				src.DelMirrors()
				return

			var/time=40//20 needles
			while(time)
				var/obj/DemonMirror/P=pick(tiles)
				if(P && X && X in range(20,src))//if they are inside the mirrors
					spawn()createmirrorneedle(P,src,X)
				time--
				sleep(1)


			src.doing=0
			src.canmove=1
			X.doing=0
			src.DelMirrors()
			src.invisibility=0


		createmirrorneedle(obj/P,mob/M,mob/X)
			flick("mirrorshoot",P)
			var/obj/Mirrorice/I=new/obj/Mirrorice
			if(debug)src<<"[I]"
			I.owner=M
			I.loc=P.loc
			I.dir=P.dir
			walk_towards(I,X,2)



		DelMirrors()
			spawn(20)
				for(var/obj/DemonMirror/A in world)
					if(A.owner==src)
						del(A)
