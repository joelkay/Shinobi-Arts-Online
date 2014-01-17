mob
	proc/Skillkaguya(k)
		switch(k)

////////////////////KAGUYA///////////////////////////////

			if("Bone_Drill")
				src << output("[src]: Bone_Drill!", "combatlog")
				src << output("[src] quickly attack an opponent with A !", "combatlog")
				src.overlays+='drill.dmi'
				src.drillon=1
				sleep(70)
				src.drillon=0
				src.overlays-='drill.dmi'

			if("Bone_Bullets")
				src << output("[src]: Bone_Bullets..", "combatlog")
				var/obj/Bbullet/D=new/obj/Bbullet
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)
				D.loc = src.loc
				D.dir = src.dir
				D.owner = src
				walk(D,src.dir)
				sleep(50)
				del(D)

			if("Bone_Sword")
				src << output("[src]: pulls out a sword from his body..", "combatlog")
				src<<output("<font color=blue>The Bone Sword is in your Skills Inventory.</font>..", "combatlog")
				src.contents += new/Weapon/KSword
				sleep(360)//hwever long tht is.
				for(var/Weapon/KSword/D in src.contents)
					del(D)
				sleep(1)//refresh macros.
				src << output("[src]: The Bone Sword fades..", "combatlog")
				//src.client.screen+=new/obj/macros/wepmacro1
				//src.client.screen+=new/obj/macros/wepmacro2
			//	src.wepmacro1=0
			//	src.wepmacro1supps=0
			//	src.wepmacro1cool=0
			//	src.wepmacro1sindex=""
			//	src.wepmacro2=0
			//	src.wepmacro2supps=0
			//	src.wepmacro2cool=0
			//	src.wepmacro2sindex=""
				src.overlays-='KSword.dmi'
				src.sworded=0
				src.swordtype="none"
				src<<output("<font color=blue>UN-Equiped sword</font>..", "combatlog")
				return

			if("Bone_Armour")
				src << output("Bones erupt from [src]'s body..", "combatlog")
				src.overlays+='activate.dmi'
				src.canceled=0//can cancel.
				for(var/mob/M in get_step(src,src.dir))
					if(M)
						Blood(M.x,M.y,M.z)
						M.Dec_health(800,src,"Bone_Armour")
				sleep(20)
				src.overlays-='activate.dmi'
				src.overlays+='active.dmi'
				src.protected=1
				src.canregen=0
				sleep(360)//2 minz
				if(!src.canceled)
					src << output("[src]'s Bone Armour fades..", "combatlog")
					src.overlays-='activate.dmi'
					src.overlays-='active.dmi'
					src.overlays+='cancel.dmi'
					src.protected=0
					src.canregen=1
					spawn() src.regeneration()
					sleep(20)
					src.overlays-='cancel.dmi'
					src.canceled=1
					return


			if("Bone_ArmourCancel")
				if(!src.canceled)
					src << output("[src] Cancels Bone Armour body..", "combatlog")
					src.overlays-='activate.dmi'
					src.overlays-='active.dmi'
					src.overlays+='cancel.dmi'
					src.protected=0
					src.canregen=1
					spawn() src.regeneration()
					sleep(20)
					src.overlays-='cancel.dmi'
					src.canceled=1
					return

			if("Sawarabi")
				src << output("[src]: Sawarabi..", "combatlog")
				Execution(/obj/Sawa,5,700,src,src)

