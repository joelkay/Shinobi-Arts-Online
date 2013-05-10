mob
	proc/Skillmedic(m)
		switch(m)

//////////////////////////MEDIC//////////////////////

			if("Medic")
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
				src << output("[src]: You are now using mystical palms, attacking people causes damage to life", "combatlog")
				//src.icon="palms"
				src.mysticpalms=1


			if("Cancel_MysticPalm")
				src << output("[src]: You cancel the mystic palms", "combatlog")
				src.icon_state=""
				src.mysticpalms=0


			if("Chakra_Enforced_Punch")
				src << output("[src]: You are now using chakra enforced punch quickly attack someone before your chakra runs out..", "combatlog")
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)//face M
				src.cep=1
				src.cepdrain()// add later
				src.overlays+='cepcharge.dmi'
				spawn(20)
					src.overlays-='cepcharge.dmi'


			if("Rebirth")
				src.overlays+='rebirth.dmi'
				src << output("[src]: You gained full life and a slight health boost..", "combatlog")
				src.canregen=1
				spawn() src.regeneration()
				src.life+=100
				src.overlays-='rebirth.dmi'
				if(src.life>100)
					src.life=100
				src.health+=(src.max_health*1.5)

