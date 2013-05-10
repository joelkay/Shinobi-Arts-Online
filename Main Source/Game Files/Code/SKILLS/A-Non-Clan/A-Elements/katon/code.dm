mob
	proc/Skillkaton(k)
		switch(k)
/////////////////KATON////////

			/*
			if("Fireblast")//grand Fireblast example, do if(2) if (3) for skillcards and edit those skillcards sindex value to 2 and 3
				src.Fireblastu++
				rem="Fireblast"//shari_copy
				nem=150//cost of Fireblast
				dem=100
				sharicopy()
				////////////////////////////////////////////
				src.hsealvalue=20//sleep 2 seconds
				src.seals()
				view() << output("[src]: Katon-GrandFireblast no-Jutsu!", "combatlog")
				src.icon_state="blow"
				src.overlays+='breathfire.dmi'
				src.stunned=5
				var/mob/M=src.targeted
				src.Facedir(M)
				//AOE(x,y,z,radius,stamdamage,duration)
				if(src.dir==NORTH)
					spawn()AOE(src.x,src.y+3,src.z,2,30,500,src,5,1)//500 = health damage 50 = duration (5 seconds) health damage * 5 seconds = 30*5 = 150 dmg
					spawn()Fire(src.x,src.y+3,src.z,2,50)
				if(src.dir==SOUTH)
					spawn()AOE(src.x,src.y-3,src.z,2,30,500,src,5,1)
					spawn()Fire(src.x,src.y-3,src.z,2,50)
				if(src.dir==EAST)
					spawn()AOE(src.x+3,src.y,src.z,2,30,500,src,5,1)
					spawn()Fire(src.x+3,src.y,src.z,2,50)
				if(src.dir==WEST)
					spawn()AOE(src.x-3,src.y,src.z,2,30,500,src,5,1)
					spawn()Fire(src.x-3,src.y,src.z,2,50)
				spawn(50)
					src.icon_state=""
					src.overlays-='breathfire.dmi'

				*/
			if("Fireblast")

				rem="Fireblast"//shari_copy
				nem=150//cost of Fireblast
				dem=100
				sharicopy()
				////////////////////////////////////////////
				src.hsealvalue=20//sleep 2 seconds
				src.seals()
				view() << output("[src]: Katon-Fireblast no-Jutsu!", "combatlog")
				src.icon_state="blow"
				src.overlays+='createfire.dmi'
				src.canmove=0
				src.doing=1
				src.icon_state="blow"
				src.inmove=1//stop client calls
				var/mob/M=src.targeted
				src.Facedir(M)
				src.icon_state="blow"
				var/obj/KatonG/z=new /obj/KatonG
				z.dir=src.dir
				if(src.dir==NORTH)
					z.loc=locate(src.x, src.y+3, src.z)

				if(src.dir==SOUTH)
					z.loc=locate(src.x, src.y-3, src.z)

				if(src.dir==EAST)
					z.loc=locate(src.x+3, src.y, src.z)

				if(src.dir==WEST)
					z.loc=locate(src.x-3, src.y, src.z)
				src.icon_state="blow"
				src.canmove=0
				src.overlays-='createfire.dmi'
				src.icon_state="blow"
				z.dir=src.dir
				z.owner=src







			if("Multiple_FirePoenix")// housenka

				rem="Multiple_FirePoenix"//shari_copy
				nem=350//cost of Fireblast
				dem=205
				sharicopy()
				////////////////////////////////////////////
				src.hsealvalue=3//slep 3 seconds
				src.seals()
				src.icon_state="blow"
				src << output("[src]: Multiple_FirePoenix", "combatlog")
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)//face M
				spawn()
					src.createhosenka()

				spawn(3)
					src.createhosenka()

				spawn(6)
					src.createhosenka()


			if("Mystic_Fire_Dragon")

				rem="Mystic_Fire_Dragon"//shari_copy
				nem=400//cost of Chamber_of_Nothingness
				dem=30
				sharicopy()
				////////////////////////////////////////////
				src.hsealvalue=20//slep 3 seconds
				src.seals()
				src << output("[src]: Mystic_Fire_Dragon", "combatlog")
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)//face M
				new/obj/KatonD(src.loc,src.dir,src)





mob
	proc
		createhosenka()
			//NORTH
			if(src.dir==NORTH)
				spawn()
					var/obj/Katonball/A = new /obj/Katonball(locate(src.x, src.y+1, src.z))
					A.dir=NORTH
					A.owner=src
					walk(A,NORTH,1)
				spawn()
					var/obj/Katonball/D = new /obj/Katonball(locate(src.x+2, src.y+1, src.z))
					D.dir=NORTH
					D.owner=src
					walk(D,NORTH,1)

				spawn()
					var/obj/Katonball/E = new /obj/Katonball(locate(src.x-2, src.y+1, src.z))
					E.dir=NORTH
					E.owner=src
					walk(E,NORTH,1)

				spawn()
					var/obj/Katonball/B = new /obj/Katonball(locate(src.x-1, src.y+1, src.z))
					B.owner=src
					B.dir=NORTHWEST
					walk(B,NORTHWEST,1)


				spawn()
					var/obj/Katonball/C = new /obj/Katonball(locate(src.x+1, src.y+1, src.z))
					C.dir=NORTHEAST
					C.owner=src
					walk(C,NORTHEAST,1)




			if(src.dir==SOUTH)
				spawn()
					var/obj/Katonball/A = new /obj/Katonball(locate(src.x, src.y-1, src.z))
					A.dir=SOUTH
					A.owner=src
					walk(A,SOUTH,1)

				spawn()
					var/obj/Katonball/B = new /obj/Katonball(locate(src.x-1, src.y-1, src.z))
					B.owner=src
					B.dir=SOUTHWEST
					walk(B,SOUTHWEST,1)

				spawn()
					var/obj/Katonball/C = new /obj/Katonball(locate(src.x+1, src.y-1, src.z))
					C.dir=SOUTHEAST
					C.owner=src
					walk(C,SOUTHEAST,1)

				spawn()
					var/obj/Katonball/D = new /obj/Katonball(locate(src.x+2, src.y-1, src.z))
					D.dir=SOUTH
					D.owner=src
					walk(D,SOUTH,1)

				spawn()
					var/obj/Katonball/E = new /obj/Katonball(locate(src.x-2, src.y-1, src.z))
					E.dir=SOUTH
					E.owner=src
					walk(E,SOUTH,1)






			if(src.dir==EAST)
				spawn()
					var/obj/Katonball/A = new /obj/Katonball(locate(src.x+1, src.y, src.z))
					A.dir=EAST
					A.owner=src
					walk(A,EAST,1)

				spawn()
					var/obj/Katonball/B = new /obj/Katonball(locate(src.x+1, src.y+1, src.z))
					B.owner=src
					B.dir=NORTHEAST
					walk(B,NORTHEAST,1)

				spawn()
					var/obj/Katonball/C = new /obj/Katonball(locate(src.x+1, src.y-1, src.z))
					C.dir=SOUTHEAST
					C.owner=src
					walk(C,SOUTHEAST,1)

				spawn()
					var/obj/Katonball/D = new /obj/Katonball(locate(src.x+1, src.y+2, src.z))
					D.dir=EAST
					D.owner=src
					walk(D,EAST,1)

				spawn()
					var/obj/Katonball/E = new /obj/Katonball(locate(src.x+1, src.y-2, src.z))
					E.dir=EAST
					E.owner=src
					walk(E,EAST,1)






			if(src.dir==WEST)
				spawn()
					var/obj/Katonball/A = new /obj/Katonball(locate(src.x-1, src.y, src.z))
					A.dir=WEST
					A.owner=src
					walk(A,WEST,1)

				spawn()
					var/obj/Katonball/B = new /obj/Katonball(locate(src.x-1, src.y+1, src.z))
					B.owner=src
					B.dir=NORTHWEST
					walk(B,NORTHWEST,1)

				spawn()
					var/obj/Katonball/C = new /obj/Katonball(locate(src.x-1, src.y-1, src.z))
					C.dir=SOUTHEAST
					C.owner=src
					walk(C,SOUTHEAST,1)

				spawn()
					var/obj/Katonball/D = new /obj/Katonball(locate(src.x-1, src.y+2, src.z))
					D.dir=WEST
					D.owner=src
					walk(D,WEST,1)

				spawn()
					var/obj/Katonball/E = new /obj/Katonball(locate(src.x-1, src.y-2, src.z))
					E.dir=WEST
					E.owner=src
					walk(E,WEST,1)




