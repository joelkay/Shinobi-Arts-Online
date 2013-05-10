mob
	proc/Skillsuiton(w)
		switch(w)
/////////////////////Suiton/////////////////////

			if("Suiton_Wave")

				rem="Suiton_Wave"//shari_copy
				nem=150//cost of Chamber_of_Nothingness
				dem=40
				sharicopy()
				////////////////////////////////////////////
				src.hsealvalue=20//slep 2 seconds
				src.seals()
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
					spawn(60)//6 seconds
						src.icon_state=""

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
					spawn(60)//6 seconds
						src.icon_state=""

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
					spawn(60)//6 seconds
						src.icon_state=""

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
					spawn(60)//6 seconds
						src.icon_state=""

			if("Suiton_GiantWave")

				rem="Suiton_Wave"//shari_copy
				nem=350//cost of Chamber_of_Nothingness
				dem=80
				sharicopy()
				////////////////////////////////////////////
				src.hsealvalue=20//slep 2 seconds
				src.seals()
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)//face M
				src << output("[src]: Suiton_GiantWave", "combatlog")
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
					walk(A,src.dir,2)
					walk(B,src.dir,2)
					walk(C,src.dir,2)
					walk(D,src.dir,2)
					walk(E,src.dir,2)
					walk(F,src.dir,2)
					walk(G,src.dir,2)
					walk(H,src.dir,2)
					walk(I,src.dir,2)
					sleep(60)
					src.icon_state=""

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
					walk(A,src.dir,2)
					walk(B,src.dir,2)
					walk(C,src.dir,2)
					walk(D,src.dir,2)
					walk(E,src.dir,2)
					walk(F,src.dir,2)
					walk(G,src.dir,2)
					walk(H,src.dir,2)
					walk(I,src.dir,2)
					sleep(60)
					src.icon_state=""

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
					walk(A,src.dir,2)
					walk(B,src.dir,2)
					walk(C,src.dir,2)
					walk(D,src.dir,2)
					walk(E,src.dir,2)
					walk(F,src.dir,2)
					walk(G,src.dir,2)
					walk(H,src.dir,2)
					walk(I,src.dir,2)
					sleep(60)
					src.icon_state=""

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
					walk(A,src.dir,2)
					walk(B,src.dir,2)
					walk(C,src.dir,2)
					walk(D,src.dir,2)
					walk(E,src.dir,2)
					walk(F,src.dir,2)
					walk(G,src.dir,2)
					walk(H,src.dir,2)
					walk(I,src.dir,2)
					sleep(60)
					src.icon_state=""


			if("Suiton_Dragon")

				rem="Suiton_Dragon"//shari_copy
				nem=350//cost of Chamber_of_Nothingness
				dem=60
				sharicopy()
				////////////////////////////////////////////
				src.hsealvalue=20//slep 2 seconds
				src.seals()
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
				rem="Suiton_Shark"//shari_copy
				nem=350//cost of Chamber_of_Nothingness
				dem=50
				sharicopy()
				////////////////////////////////////////////
				src.hsealvalue=20//slep 2 seconds
				src.seals()
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


