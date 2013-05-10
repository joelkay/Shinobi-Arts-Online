mob
	proc/Skillmedic(m)
		switch(m)

//////////////////////////MEDIC//////////////////////

			if("Medic")

				rem="Medic"//shari_copy
				nem=150//cost of Fireblast
				sharicopy(src)
				src.hsealvalue=1//
				src.seals()
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)//face M
				if(M in get_step(src,src.dir))
					if(M.life>=100)
						return
					var/healage=((src.chakraforcemain/20)*(src.medpassive/2))+rand(0,10)//med passive quikens healing
					M.life+=healage
					flick('healing.dmi',src)
					flick("healing",M)
					sleep(10)
					src << output("healed [M] for [healage] life", "combatlog")




			if("Mystic_Palm")

				rem="Mystic_Palm"//shari_copy
				nem=150//cost of Fireblast
				sharicopy(src)
				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				src << output("[src]: You are now using mystical palms, attacking people causes damage to life", "combatlog")
				src.icon="palms"
				src.Load_Overlays()
				src.Affirm_Icon()
				src.mysticpalms=1
				return

			if("Cancel_MysticPalm")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				src << output("[src]: You cancel the mystic palms", "combatlog")
				src.icon_state=""
				src.Load_Overlays()
				src.Affirm_Icon()
				src.mysticpalms=0
				return

			if("Chakra_Enforced_Punch")

				rem="Chakra_Enforced_Punch"//shari_copy
				nem=150//cost of Fireblast
				sharicopy(src)
				////////////////////////////////////////////
				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				src << output("[src]: You are now using chakra enforced punch quickly attack someone before your chakra runs out..", "combatlog")
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)//face M
				src.cep=1
				src.cepdrain()// add later
				src.overlays+='cepcharge.dmi'
				sleep(20)
				src.overlays-='cepcharge.dmi'
				return

			if("Rebirth")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				src.overlays+='rebirth.dmi'
				src << output("[src]: You gained full life and a slight health boost..", "combatlog")
				src.canregen=1
				spawn() src.regeneration()
				src.life+=100
				src.overlays-='rebirth.dmi'
				if(src.life>100)
					src.life=100
				src.health+=(src.max_health*1.5)
				return
