mob
	proc/Skillfuuton(f)
		switch(f)

//////////////////FUUTON//////////////////////
			if("Fuuton_Sweep")

				rem="Fuuton_Sweep"//shari_copy
				nem=250//cost of Chamber_of_Nothingness
				dem=20
				sharicopy(src)
				////////////////////////////////////////////
				src.hsealvalue=20//slep 2 seconds
				src.seals()
				src << output("[src]: Fuuton_Sweep", "combatlog")
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)//face M
				new/obj/FuutonS(src.loc,src.dir,src)

			if("Fuuton_Blast")

				rem="Fuuton_Blast"//shari_copy
				nem=350//cost of Chamber_of_Nothingness
				dem=80
				sharicopy(src)
				////////////////////////////////////////////
				src.hsealvalue=20//slep 2 seconds
				src.seals()
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)//face M
				src << output("[src]: Fuuton_Blast", "combatlog")
				if(src.dir == NORTH)
					var/obj/FuutonB/A = new /obj/FuutonB(locate(src.x, src.y, src.z))
					var/obj/FuutonB/B = new /obj/FuutonB(locate(src.x+1, src.y, src.z))
					var/obj/FuutonB/C = new /obj/FuutonB(locate(src.x-1, src.y, src.z))
					var/obj/FuutonB/D = new /obj/FuutonB(locate(src.x-2, src.y, src.z))
					var/obj/FuutonB/E = new /obj/FuutonB(locate(src.x+2, src.y, src.z))
					A.owner=src
					B.owner=src
					C.owner=src
					D.owner=src
					E.owner=src
					A.dir = NORTH
					B.dir = NORTH
					C.dir = NORTH
					D.dir = NORTH
					E.dir = NORTH
					walk(A,src.dir,2)
					walk(B,src.dir,2)
					walk(C,src.dir,2)
					walk(D,src.dir,2)
					walk(E,src.dir,2)
					sleep(60)
					del(A)
					del(B)
					del(C)
					del(D)
					del(E)
					return
				if(src.dir == SOUTH)
					var/obj/FuutonB/A = new /obj/FuutonB(locate(src.x, src.y, src.z))
					var/obj/FuutonB/B = new /obj/FuutonB(locate(src.x+1, src.y, src.z))
					var/obj/FuutonB/C = new /obj/FuutonB(locate(src.x-1, src.y, src.z))
					var/obj/FuutonB/D = new /obj/FuutonB(locate(src.x-2, src.y, src.z))
					var/obj/FuutonB/E = new /obj/FuutonB(locate(src.x+2, src.y, src.z))
					A.owner=src
					B.owner=src
					C.owner=src
					D.owner=src
					E.owner=src
					A.dir = SOUTH
					B.dir = SOUTH
					C.dir = SOUTH
					D.dir = SOUTH
					E.dir = SOUTH
					walk(A,src.dir,2)
					walk(B,src.dir,2)
					walk(C,src.dir,2)
					walk(D,src.dir,2)
					walk(E,src.dir,2)
					sleep(60)
					del(A)
					del(B)
					del(C)
					del(D)
					del(E)
					return
				if(src.dir == WEST)
					var/obj/FuutonB/A = new /obj/FuutonB(locate(src.x, src.y, src.z))
					var/obj/FuutonB/B = new /obj/FuutonB(locate(src.x, src.y-1, src.z))
					var/obj/FuutonB/C = new /obj/FuutonB(locate(src.x, src.y-2, src.z))
					var/obj/FuutonB/D = new /obj/FuutonB(locate(src.x, src.y+1, src.z))
					var/obj/FuutonB/E = new /obj/FuutonB(locate(src.x, src.y+2, src.z))
					A.owner=src
					B.owner=src
					C.owner=src
					D.owner=src
					E.owner=src
					A.dir = WEST
					B.dir = WEST
					C.dir = WEST
					D.dir = WEST
					E.dir = WEST
					walk(A,src.dir,2)
					walk(B,src.dir,2)
					walk(C,src.dir,2)
					walk(D,src.dir,2)
					walk(E,src.dir,2)
					sleep(60)
					del(A)
					del(B)
					del(C)
					del(D)
					del(E)
					return
				if(src.dir == EAST)
					var/obj/FuutonB/A = new /obj/FuutonB(locate(src.x, src.y, src.z))
					var/obj/FuutonB/B = new /obj/FuutonB(locate(src.x, src.y-1, src.z))
					var/obj/FuutonB/C = new /obj/FuutonB(locate(src.x, src.y-2, src.z))
					var/obj/FuutonB/D = new /obj/FuutonB(locate(src.x, src.y+1, src.z))
					var/obj/FuutonB/E = new /obj/FuutonB(locate(src.x, src.y+2, src.z))
					A.owner=src
					B.owner=src
					C.owner=src
					D.owner=src
					E.owner=src
					A.dir = EAST
					B.dir = EAST
					C.dir = EAST
					D.dir = EAST
					E.dir = EAST
					walk(A,src.dir,2)
					walk(B,src.dir,2)
					walk(C,src.dir,2)
					walk(D,src.dir,2)
					walk(E,src.dir,2)
					sleep(60)
					del(A)
					del(B)
					del(C)
					del(D)
					del(E)
					return
				return

			if("Fuuton_Tornado")

				rem="Fuuton_Tornado"//shari_copy
				nem=250//cost of Chamber_of_Nothingness
				dem=30
				sharicopy(src)
				////////////////////////////////////////////
				src.hsealvalue=30//slep 3 seconds
				src.seals()
				src << output("[src]: Fuuton_Tornado", "combatlog")
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)//face M
				new/obj/FuutonT(src.loc,src.dir,src)


			if("Fuuton_Slice")

				rem="Fuuton_Slice"//shari_copy
				nem=250//cost of Chamber_of_Nothingness
				dem=30
				sharicopy(src)
				////////////////////////////////////////////
				src.hsealvalue=30//slep 3 seconds
				src.seals()
				src << output("[src]: Fuuton_Slice", "combatlog")
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)//face M
				new/obj/FuutonSl(src.loc,src.dir,src)
