mob
	proc/Skillweapon(w)
		switch(w)

/////////////////////////WEPS///////////////////////////
			if("Sword")
				if(!src.sworded)
					src.overlays+='sword.dmi'
					src.sworded=1
					src.swordtype="normal"
					src<<output("<font color=blue>Equiped sword, press S to attack with it</font>..", "combatlog")
					return
				else
					src.overlays-='sword.dmi'
					src.sworded=0
					src.swordtype="none"
					src<<output("<font color=blue>UN-Equiped sword</font>..", "combatlog")
					return

			if("Kunai")
				src << output("[src]: throws a Kunai..", "combatlog")
				var/Weapon/Kunai/D = new/Weapon/Kunai
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)
				flick("throw",src)
				D.loc = src.loc
				D.dir = src.dir
				D.owner = src
				walk(D,src.dir)
				sleep(50)
				del(D)

			if("Shuriken")
				src << output("[src]: throws a ahuriken..", "combatlog")
				var/Weapon/Shuriken/D = new/Weapon/Shuriken//make hit objects for this e.t.c
				var/Weapon/Shuriken/E = new/Weapon/Shuriken
				var/Weapon/Shuriken/F = new/Weapon/Shuriken
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)
				if(src.dir==NORTH||SOUTH)
					D.loc = locate(src.x,src.y,src.z)//Tops
					E.loc = locate(src.x+1,src.y,src.z)//Tops
					F.loc = locate(src.x-1,src.y,src.z)//Tops
				else//east and west.
					D.loc = locate(src.x,src.y,src.z)//Tops
					E.loc = locate(src.x,src.y+1,src.z)//Tops
					F.loc = locate(src.x,src.y-1,src.z)//Tops
				flick("throw",src)
				D.dir = src.dir
				E.owner = src
				E.dir = src.dir
				F.owner = src
				F.dir = src.dir
				walk(D,src.dir)
				walk(E,src.dir)
				walk(F,src.dir)
				sleep(50)
				del(D)

			if("KSword")
				if(!src.sworded)
					src.overlays+='KSword.dmi'
					src.sworded=1
					src.swordtype="KSword"
					src<<output("<font color=blue>Equiped sword, press S to attack with it</font>..", "combatlog")
					return
				else
					src.overlays-='KSword.dmi'
					src.sworded=0
					src.swordtype="none"
					src<<output("<font color=blue>UN-Equiped sword</font>..", "combatlog")
					return



