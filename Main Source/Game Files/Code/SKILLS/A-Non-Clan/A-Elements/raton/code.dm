mob
	proc/Skillraton(b)
		switch(b)

////////////////////////RATON//////////
			if("Chidori_Blade")

				rem="Chidori_Blade"//shari_copy
				nem=500//cost of Fireblast
				dem=200
				sharicopy(src)
				////////////////////////////////////////////
				src.hsealvalue=40//slep 4 seconds
				src.seals()
				src << output("[src]: Raton-Sword Assasination Technique", "combatlog")
				src.icon_state=""
				src.overlays+='flickraton.dmi'
				spawn(4)
					src.overlays-='flickraton.dmi'
					src.overlays+='ratonswordoverlay.dmi'
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)//face M
				new/obj/RatonS(src.loc,src.dir,src)
				src.canmove=0

				spawn(12)
					src.canmove=1
					src.overlays-='ratonswordoverlay.dmi'

			if("Chidori")//lol advanced shizle

				rem="Chidori"//shari_copy
				nem=500//cost of chidori
				dem=200
				////////////////////////////////////////////
				src.hsealvalue=5//slep 4 seconds
				src.seals()
				if(src.rasenganon||src.drillon)
					src << output("[src]: You can't stack skills!", "combatlog")
					return
				src << output("[src]: Chidori", "combatlog")
				src << output("<i>You begin to charge chidori!", "combatlog")
				src.overlays+='chidori.dmi'
				src.icon_state="chidoricreate"
				src.canmove=0
				src.chargingchidori=1
				var/charged=50
				if(src.Clan=="Uchiha")
					charged=25//takes less time
				CHARGING
				if(charged>=100)
					src.overlays-='chidori.dmi'
					src.canmove=1
					src.overlays+='chidorihold.dmi'
					src.chargingchidori=0
					src.finishedchargingchidori=1//I would of inserted chidori icon change here but i can do that later
					src.chidorion=1
					src.movespeed=0
					src.doing=0
					src << output("<font oolor=blue>You are now done charging chidori. Press Q to charge in a direction....", "combatlog")
					return
				else
					charged+=src.chargerate
					src << output("<font oolor=blue>Charging [charged]% completed!", "combatlog")
					sleep(10)
					goto CHARGING



			if("Raikiri")//lol advanced shizle

				rem="Raikiri"//shari_copy
				nem=500//cost of raikiri
				dem=300
				sharicopy(src)
				////////////////////////////////////////////
				src.hsealvalue=50//slep 4 seconds
				if(src.Clan=="Uchiha")
					src.hsealvalue=src.chidorivalue//slep 4 seconds
				src.seals()
				src.overlays -= 'raikiri.dmi'
				var/mob/M=src.targeted
				if(M in view())//make sure nigga is in range
					src.Facedir(M)
				src << output("[src]: raikiri", "combatlog")
				src.overlays+='raikiri.dmi'
				src << output("[src] hit [M] quickly before it runs out..", "combatlog")//change l8r
				src.chidorion=1
				src.reflexplus+=20//stronger than chidori.
				sleep(60)
				src.reflexplus-=20
				src.chidorion=0
				src.overlays -= 'raikiri.dmi'
				src.icon_state=""
				src.overlays-='raikiri.dmi'


			if("Chidori_Nagashi")//lol advanced shizle
				rem="Chidori_Nagashi"//shari_copy
				nem=300//cost of nagashi
				dem=80
				sharicopy(src)
				////////////////////////////////////////////
				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				src << output("[src]: Chidori_Nagashi", "combatlog")
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)//face M
				if(src.inwater)
					src.canmove=0
					src.icon_state="jutsu exicute"
					Execution(/obj/triggerable/Nagashi,3,800,src)
					spawn(30)
						src.icon_state=""
						src.canmove=1
				else
					src.canmove=0
					src.icon_state="jutsu exicute"
					Execution(/obj/triggerable/Nagashi,1,500,src)
					spawn(30)
						src.icon_state=""
						src.canmove=1