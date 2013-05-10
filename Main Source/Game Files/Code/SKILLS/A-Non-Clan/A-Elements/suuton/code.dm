mob
	proc/Skillsuiton(w)
		switch(w)
/////////////////////Suiton/////////////////////

			if("Suiton_Wave")
				src.canmove=0
				src.icon_state="blow"
				src << output("[src]: Suiton_Wave", "combatlog")
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)//face M
				if(src.dir == NORTH)
					var/obj/SuitonW/one/A = new /obj/SuitonW/one(locate(src.x, src.y, src.z))
					var/obj/SuitonW/two/B = new /obj/SuitonW/two(locate(src.x+1, src.y, src.z))
					var/obj/SuitonW/three/C = new /obj/SuitonW/three(locate(src.x-1, src.y, src.z))
					A.owner=src
					B.owner=src
					C.owner=src
					A.dir = NORTH
					B.dir = NORTH
					C.dir = NORTH
					spawn()
						walk(A,src.dir,2)
						walk(B,src.dir,2)
						walk(C,src.dir,2)
					spawn(15)// 1.5 secs
						src.icon_state=""
						src.canmove=1

					return
				if(src.dir == SOUTH)
					var/obj/SuitonW/one/A = new /obj/SuitonW/one(locate(src.x, src.y, src.z))
					var/obj/SuitonW/two/B = new /obj/SuitonW/two(locate(src.x+1, src.y, src.z))
					var/obj/SuitonW/three/C = new /obj/SuitonW/three(locate(src.x-1, src.y, src.z))
					A.owner=src
					B.owner=src
					C.owner=src
					A.dir = SOUTH
					B.dir = SOUTH
					C.dir = SOUTH
					spawn()
						walk(A,src.dir,2)
						walk(B,src.dir,2)
						walk(C,src.dir,2)
					spawn(15)// 1.5 secs
						src.icon_state=""
						src.canmove=1

				if(src.dir == WEST)
					var/obj/SuitonW/one/A = new /obj/SuitonW/one(locate(src.x, src.y, src.z))
					var/obj/SuitonW/two/B = new /obj/SuitonW/two(locate(src.x, src.y-1, src.z))
					var/obj/SuitonW/three/C = new /obj/SuitonW/three(locate(src.x, src.y+1, src.z))
					A.owner=src
					B.owner=src
					C.owner=src
					A.dir = WEST
					B.dir = WEST
					C.dir = WEST
					spawn()
						walk(A,src.dir,2)
						walk(B,src.dir,2)
						walk(C,src.dir,2)
					spawn(15)// 1.5 secs
						src.icon_state=""
						src.canmove=1

				if(src.dir == EAST)
					var/obj/SuitonW/one/A = new /obj/SuitonW/one(locate(src.x, src.y, src.z))
					var/obj/SuitonW/two/B = new /obj/SuitonW/two(locate(src.x, src.y-1, src.z))
					var/obj/SuitonW/three/C = new /obj/SuitonW/three(locate(src.x, src.y+1, src.z))
					A.owner=src
					B.owner=src
					C.owner=src
					A.dir = EAST
					B.dir = EAST
					C.dir = EAST
					spawn()
						walk(A,src.dir,2)
						walk(B,src.dir,2)
						walk(C,src.dir,2)

					spawn(15)// 1.5 secs
						src.icon_state=""
						src.canmove=1

			if("Suiton_GiantWave")
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)//face M
				src << output("[src]: Suiton_GiantWave", "combatlog")
				src.canmove=0
				src.icon_state="blow"
				if(src.dir == NORTH)
					var/obj/SuitonGW/A = new /obj/SuitonGW(locate(src.x, src.y, src.z))
					var/obj/SuitonGW/B = new /obj/SuitonGW(locate(src.x+1, src.y, src.z))
					var/obj/SuitonGW/C = new /obj/SuitonGW(locate(src.x-1, src.y, src.z))
					var/obj/SuitonGW/D = new /obj/SuitonGW(locate(src.x-2, src.y, src.z))
					var/obj/SuitonGW/E = new /obj/SuitonGW(locate(src.x+2, src.y, src.z))
					var/obj/SuitonGW/F = new /obj/SuitonGW(locate(src.x+3, src.y, src.z))
					var/obj/SuitonGW/G = new /obj/SuitonGW(locate(src.x-3, src.y, src.z))
					var/obj/SuitonGW/H = new /obj/SuitonGW(locate(src.x+4, src.y, src.z))
					var/obj/SuitonGW/I = new /obj/SuitonGW(locate(src.x-4, src.y, src.z))
					A.owner=src
					B.owner=src
					C.owner=src
					D.owner=src
					E.owner=src
					F.owner=src
					G.owner=src
					H.owner=src
					I.owner=src
					A.dir = NORTH
					B.dir = NORTH
					C.dir = NORTH
					D.dir = NORTH
					E.dir = NORTH
					F.dir = NORTH
					G.dir = NORTH
					H.dir = NORTH
					I.dir = NORTH
					spawn()
						walk(A,src.dir,2)
						walk(B,src.dir,2)
						walk(C,src.dir,2)
						walk(D,src.dir,2)
						walk(E,src.dir,2)
						walk(F,src.dir,2)
						walk(G,src.dir,2)
						walk(H,src.dir,2)
						walk(I,src.dir,2)
					spawn(15)
						src.icon_state=""
						src.canmove=1

				if(src.dir == SOUTH)
					var/obj/SuitonGW/A = new /obj/SuitonGW(locate(src.x, src.y, src.z))
					var/obj/SuitonGW/B = new /obj/SuitonGW(locate(src.x+1, src.y, src.z))
					var/obj/SuitonGW/C = new /obj/SuitonGW(locate(src.x-1, src.y, src.z))
					var/obj/SuitonGW/D = new /obj/SuitonGW(locate(src.x-2, src.y, src.z))
					var/obj/SuitonGW/E = new /obj/SuitonGW(locate(src.x+2, src.y, src.z))
					var/obj/SuitonGW/F = new /obj/SuitonGW(locate(src.x-3, src.y, src.z))
					var/obj/SuitonGW/G = new /obj/SuitonGW(locate(src.x+3, src.y, src.z))
					var/obj/SuitonGW/H = new /obj/SuitonGW(locate(src.x-4, src.y, src.z))
					var/obj/SuitonGW/I = new /obj/SuitonGW(locate(src.x+4, src.y, src.z))
					A.owner=src
					B.owner=src
					C.owner=src
					D.owner=src
					E.owner=src
					F.owner=src
					G.owner=src
					H.owner=src
					I.owner=src
					A.dir = SOUTH
					B.dir = SOUTH
					C.dir = SOUTH
					D.dir = SOUTH
					E.dir = SOUTH
					F.dir = SOUTH
					G.dir = SOUTH
					H.dir = SOUTH
					I.dir = SOUTH
					spawn()
						walk(A,src.dir,2)
						walk(B,src.dir,2)
						walk(C,src.dir,2)
						walk(D,src.dir,2)
						walk(E,src.dir,2)
						walk(F,src.dir,2)
						walk(G,src.dir,2)
						walk(H,src.dir,2)
						walk(I,src.dir,2)

					spawn(15)
						src.icon_state=""
						src.canmove=1

				if(src.dir == WEST)
					var/obj/SuitonGW/A = new /obj/SuitonGW(locate(src.x, src.y, src.z))
					var/obj/SuitonGW/B = new /obj/SuitonGW(locate(src.x, src.y-1, src.z))
					var/obj/SuitonGW/C = new /obj/SuitonGW(locate(src.x, src.y-2, src.z))
					var/obj/SuitonGW/D = new /obj/SuitonGW(locate(src.x, src.y+1, src.z))
					var/obj/SuitonGW/E = new /obj/SuitonGW(locate(src.x, src.y+2, src.z))
					var/obj/SuitonGW/F = new /obj/SuitonGW(locate(src.x, src.y-3, src.z))
					var/obj/SuitonGW/G = new /obj/SuitonGW(locate(src.x, src.y-4, src.z))
					var/obj/SuitonGW/H = new /obj/SuitonGW(locate(src.x, src.y+3, src.z))
					var/obj/SuitonGW/I = new /obj/SuitonGW(locate(src.x, src.y+4, src.z))
					A.owner=src
					B.owner=src
					C.owner=src
					D.owner=src
					E.owner=src
					F.owner=src
					G.owner=src
					H.owner=src
					I.owner=src
					A.dir = WEST
					B.dir = WEST
					C.dir = WEST
					D.dir = WEST
					E.dir = WEST
					F.dir = WEST
					G.dir = WEST
					H.dir = WEST
					I.dir = WEST
					spawn()
						walk(A,src.dir,2)
						walk(B,src.dir,2)
						walk(C,src.dir,2)
						walk(D,src.dir,2)
						walk(E,src.dir,2)
						walk(F,src.dir,2)
						walk(G,src.dir,2)
						walk(H,src.dir,2)
						walk(I,src.dir,2)

					spawn(15)
						src.icon_state=""
						src.canmove=1

				if(src.dir == EAST)
					var/obj/SuitonGW/A = new /obj/SuitonGW(locate(src.x, src.y, src.z))
					var/obj/SuitonGW/B = new /obj/SuitonGW(locate(src.x, src.y-1, src.z))
					var/obj/SuitonGW/C = new /obj/SuitonGW(locate(src.x, src.y-2, src.z))
					var/obj/SuitonGW/D = new /obj/SuitonGW(locate(src.x, src.y+1, src.z))
					var/obj/SuitonGW/E = new /obj/SuitonGW(locate(src.x, src.y+2, src.z))
					var/obj/SuitonGW/F = new /obj/SuitonGW(locate(src.x, src.y-3, src.z))
					var/obj/SuitonGW/G = new /obj/SuitonGW(locate(src.x, src.y-4, src.z))
					var/obj/SuitonGW/H = new /obj/SuitonGW(locate(src.x, src.y+3, src.z))
					var/obj/SuitonGW/I = new /obj/SuitonGW(locate(src.x, src.y+4, src.z))
					A.owner=src
					B.owner=src
					C.owner=src
					D.owner=src
					E.owner=src
					F.owner=src
					G.owner=src
					H.owner=src
					I.owner=src
					A.dir = EAST
					B.dir = EAST
					C.dir = EAST
					D.dir = EAST
					E.dir = EAST
					F.dir = EAST
					G.dir = EAST
					H.dir = EAST
					I.dir = EAST
					spawn()
						walk(A,src.dir,2)
						walk(B,src.dir,2)
						walk(C,src.dir,2)
						walk(D,src.dir,2)
						walk(E,src.dir,2)
						walk(F,src.dir,2)
						walk(G,src.dir,2)
						walk(H,src.dir,2)
						walk(I,src.dir,2)

					spawn(15)
						src.icon_state=""
						src.canmove=1


			if("Suiton_Dragon")
				////////////////////////////////////////////
				if(!src.inwater)
					src << output("You must be in water..", "combatlog")
					ReturnPrice("Suiton_Dragon")//proc to make it so you can use the skill again
					return
				var/mob/S=src.targeted
				if(!S)
					src << output("You need to target someone first..", "combatlog")
					ReturnPrice("Suiton_Dragon")//proc to make it so you can use the skill again
					return
				src << output("[src]: Suiton_Dragon", "combatlog")
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)//face M
					var/obj/Suitondragon/A=new/obj/Suitondragon
					var/obj/O=new/obj
					O.icon = 'Waterdragon.dmi'
					O.icon_state="tail"
					O.loc=src.loc
					O.loc=src.dir
					A.loc=src.loc
					A.dir=src.dir
					A.owner=src
					walk_towards(A,M,2)

			if("Suiton_Shark")
				var/mob/S=src.targeted
				if(!S)
					src << output("You need to target someone first..", "combatlog")
					ReturnPrice("Suiton_Shark")//proc to make it so you can use the skill again
					return
				if(!src.inwater)
					src << output("You must be in water..", "combatlog")
					ReturnPrice("Suiton_Shark")//proc to make it so you can use the skill again
					return
				if(!S.inwater)
					src << output("Your oponent must be in water..", "combatlog")
					ReturnPrice("Suiton_Shark")//proc to make it so you can use the skill again
					return
				src << output("[src]: Suiton_Shark", "combatlog")
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)//face M
					var/obj/Suitonshark/A=new/obj/Suitonshark
					A.loc=src.loc
					A.dir=src.dir
					A.owner=src
					walk_towards(A,M,1)
					sleep(40)
					del(A)


