mob
	proc/Skilldoton(d)
		switch(d)

/////////////////////////////DOTON/////////////////
			if("Chamber_of_Nothingness")
				rem="Chamber_of_Nothingness"//shari_copy
				nem=500//cost of Chamber_of_Nothingness
				dem=50
				sharicopy(src)
				////////////////////////////////////////////
				src.hsealvalue=20//slep 2 seconds
				src.seals()
				var/mob/A=src.targeted
				if(!A in view(src))
					return
				if(A==src||A=="")
					return
				src << output("[src]: Chamber_of_Nothingness", "combatlog")
				src.Facedir(A)
				var/obj/DotonT/open/D= new/obj/DotonT/open(locate(A.x,A.y,A.z))
				D.owner=src
				sleep(10)//a sec to kawa.

				if(A.loc==D.loc)
					A.canmove=0
					del(D)
					var/obj/DotonT/trapped/E= new/obj/DotonT/trapped(locate(A.x,A.y,A.z))
					E.owner=src
					A.canmove=0
					A.indot=1
					A.doing=1
					src.canleech=1

				else
					del(D)
					A.canmove=1
					A.indot=0


			if("Chamber_Leech")
				rem="Chamber_Leech"//shari_copy
				nem=500//cost of Chamber_of_Nothingness
				dem=60
				sharicopy(src)
				////////////////////////////////////////////
				src.hsealvalue=30//slep 30 seconds
				var/mob/A=src.targeted
				if(A==src||A=="")
					return
				if(A&&!A.indot||!src.canleech)
					src<<output("You have to target a person in a doton cage to leech", "combatlog")
					return
				src.seals()
				src.newleech=1
				src << output("[src]: Chamber_Leech", "combatlog")
				src.dir=EAST
				src.loc=locate(A.x-2,A.y,A.z)
				src.icon_state="heal"
				src.canmove=0
				var/obj/DotonT/leech/E= new/obj/DotonT/leech(locate(A.x,A.y,A.z))
				E.owner=src
				src.leech(A)


			if("Doton_River")
				rem="Doton_River"//shari_copy
				nem=250//cost of Chamber_of_Nothingness
				dem=30
				sharicopy(src)
				////////////////////////////////////////////
				src.hsealvalue=30//slep 3 seconds
				src.seals()
				src << output("[src]: Doton_River", "combatlog")
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)//face M
				new/obj/DotonR(src.loc,src.dir,src)


			if("Doton_MudBullets")
				rem="Doton_MudBullets"//shari_copy
				nem=350//cost of Chamber_of_Nothingness
				dem=80
				sharicopy(src)
				////////////////////////////////////////////
				src.hsealvalue=30//slep 3 seconds
				src.seals()
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)//face M
				src << output("[src]: Doton_MudBullets", "combatlog")
				var/obj/DotonBH/A = new /obj/DotonBH
				A.loc=src.loc
				A.dir=src.dir
				spawn(20)
				new/obj/DotonB(A.loc,A.dir,src)
				spawn(20)
				new/obj/DotonB(A.loc,A.dir,src)
				spawn(20)
				new/obj/DotonB(A.loc,A.dir,src)
				spawn(20)
				new/obj/DotonB(A.loc,A.dir,src)
				spawn(20)
				new/obj/DotonB(A.loc,A.dir,src)
				spawn(20)
				new/obj/DotonB(A.loc,A.dir,src)
				spawn(20)
				new/obj/DotonB(A.loc,A.dir,src)
				spawn(20)
				new/obj/DotonB(A.loc,A.dir,src)
				spawn(20)
				new/obj/DotonB(A.loc,A.dir,src)
				spawn(20)
				new/obj/DotonB(A.loc,A.dir,src)






