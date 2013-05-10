mob
	proc/Skilldeidara(d)
		switch(d)

///////////////DEIDARA///////////////////////////
			if("Clay_clone")
				src << output("[src]: Clay-clone", "combatlog")
				src.KillShadow_Clone()
				var/mob/NPC/CShadow_Clone/A = new /mob/NPC/CShadow_Clone
				A.owner = src
				A.icon = src.icon
				A.overlays = src.overlays
				A.name = src.name
				A.Village = src.Village
				A.health = 300
				A.loc = locate(src.x, src.y-1, src.z)
				flick('smoke2.dmi',A)
				src.controlled = A
				src.kagebunshd = 1
				src.client.eye = A
				src.claycloner=1
				src << output("[src]: Press L to detonate it and revert back to yourself..", "combatlog")


			if("Explode_bird")
				var/mob/S=src.targeted
				if(!S)
					src<<output("You need to target someone first..", "combatlog")
					return

				src << output("[src]:Explode bird!", "combatlog")
				var/mob/M=S
				if(M in range(30,src))
					src.Facedir(M)//face M
					var/obj/Explodebird/A=new/obj/Explodebird(src.loc,src.dir,src)
					A.owner=src
					walk_towards(A,M,1)


			if("Explode_spider")
				src << output("[src]: Explode_spider", "combatlog")
				src<<output("Target someone then press L to make spiders follow them. They detonate on impact", "combatlog")
				var/obj/Explodespider/B=new(0)
				B.loc=src.loc
				B.dir=src.dir
				B.name="[src]'s pider"
				B.owner=src
				src.spiders=1


			if("Multiple_bird")
				src << output("[src]: Multiple_bird", "combatlog")
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)//face M
				spawn()
					src.createbirds()

				spawn(3)
					src.createbirds()

				spawn(6)
					src.createbirds()


			if("C3")
				src << output("[src]: C3 press L to blow up the clay or wait 5 seconds", "combatlog")//
				var/obj/C3/A = new /obj/C3(locate(src.x, src.y, src.z))//
				A.owner=src
				src.c3on=1
				src.c3detoned=0
				spawn(50)
					A.Explode()




			if("Flying_Bird")
				//src.hemisphere(2)//second altitude
				if(!invisibility)
					src << output("[src]: You Begin Flying", "combatlog")//
					var/mob/Flying_Bird/D=new/mob/Flying_Bird
					D.loc=src.loc
					D.owner=src
					D.icon_state="summon"
					src.density=0
					//D.hemis=0//higher hemisphere
					src.invisibility=10
					src.controlled = D
					src.client.eye = D
					src.movespeed=0
					D.icon_state="Run"

				else
					for(var/mob/Flying_Bird/D in range(20,src))
						if(D.owner==src)
							D.End()





mob
	proc
		createbirds()
			//NORTH
			if(src.dir==NORTH)
				spawn()
					var/obj/Explodebirdm/A = new /obj/Explodebirdm(locate(src.x, src.y+1, src.z))
					A.dir=NORTH
					A.owner=src
					walk(A,NORTH,2)
				spawn()
					var/obj/Explodebirdm/D = new /obj/Explodebirdm(locate(src.x+2, src.y+1, src.z))
					D.dir=NORTH
					D.owner=src
					walk(D,NORTH,2)

				spawn()
					var/obj/Explodebirdm/E = new /obj/Explodebirdm(locate(src.x-2, src.y+1, src.z))
					E.dir=NORTH
					E.owner=src
					walk(E,NORTH,2)

				spawn()
					var/obj/Explodebirdm/B = new /obj/Explodebirdm(locate(src.x-1, src.y+1, src.z))
					B.owner=src
					B.dir=NORTHWEST
					walk(B,NORTHWEST,2)


				spawn()
					var/obj/Explodebirdm/C = new /obj/Explodebirdm(locate(src.x+1, src.y+1, src.z))
					C.dir=NORTHEAST
					C.owner=src
					walk(C,NORTHEAST,2)




			if(src.dir==SOUTH)
				spawn()
					var/obj/Explodebirdm/A = new /obj/Explodebirdm(locate(src.x, src.y-1, src.z))
					A.dir=SOUTH
					A.owner=src
					walk(A,SOUTH,2)

				spawn()
					var/obj/Explodebirdm/B = new /obj/Explodebirdm(locate(src.x-1, src.y-1, src.z))
					B.owner=src
					B.dir=SOUTHWEST
					walk(B,SOUTHWEST,2)

				spawn()
					var/obj/Explodebirdm/C = new /obj/Explodebirdm(locate(src.x+1, src.y-1, src.z))
					C.dir=SOUTHEAST
					C.owner=src
					walk(C,SOUTHEAST,2)

				spawn()
					var/obj/Explodebirdm/D = new /obj/Explodebirdm(locate(src.x+2, src.y-1, src.z))
					D.dir=SOUTH
					D.owner=src
					walk(D,SOUTH,2)

				spawn()
					var/obj/Explodebirdm/E = new /obj/Explodebirdm(locate(src.x-2, src.y-1, src.z))
					E.dir=SOUTH
					E.owner=src
					walk(E,SOUTH,2)






			if(src.dir==EAST)
				spawn()
					var/obj/Explodebirdm/A = new /obj/Explodebirdm(locate(src.x+1, src.y, src.z))
					A.dir=EAST
					A.owner=src
					walk(A,EAST,2)

				spawn()
					var/obj/Explodebirdm/B = new /obj/Explodebirdm(locate(src.x+1, src.y+1, src.z))
					B.owner=src
					B.dir=NORTHEAST
					walk(B,NORTHEAST,2)

				spawn()
					var/obj/Explodebirdm/C = new /obj/Explodebirdm(locate(src.x+1, src.y-1, src.z))
					C.dir=SOUTHEAST
					C.owner=src
					walk(C,SOUTHEAST,2)

				spawn()
					var/obj/Explodebirdm/D = new /obj/Explodebirdm(locate(src.x+1, src.y+2, src.z))
					D.dir=EAST
					D.owner=src
					walk(D,EAST,2)

				spawn()
					var/obj/Explodebirdm/E = new /obj/Explodebirdm(locate(src.x+1, src.y-2, src.z))
					E.dir=EAST
					E.owner=src
					walk(E,EAST,2)






			if(src.dir==WEST)
				spawn()
					var/obj/Explodebirdm/A = new /obj/Explodebirdm(locate(src.x-1, src.y, src.z))
					A.dir=WEST
					A.owner=src
					walk(A,WEST,2)

				spawn()
					var/obj/Explodebirdm/B = new /obj/Explodebirdm(locate(src.x-1, src.y+1, src.z))
					B.owner=src
					B.dir=NORTHWEST
					walk(B,NORTHWEST,2)

				spawn()
					var/obj/Explodebirdm/C = new /obj/Explodebirdm(locate(src.x-1, src.y-1, src.z))
					C.dir=SOUTHEAST
					C.owner=src
					walk(C,SOUTHEAST,2)

				spawn()
					var/obj/Explodebirdm/D = new /obj/Explodebirdm(locate(src.x-1, src.y+2, src.z))
					D.dir=WEST
					D.owner=src
					walk(D,WEST,2)

				spawn()
					var/obj/Explodebirdm/E = new /obj/Explodebirdm(locate(src.x-1, src.y-2, src.z))
					E.dir=WEST
					E.owner=src
					walk(E,WEST,2)



