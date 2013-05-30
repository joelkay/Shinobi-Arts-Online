mob
	proc/Skillhyuuga(h)
		switch(h)

///////////////////////HYUUGA//////////////////

			if("Byakugan")
				src << output("[src]: Byakugan", "combatlog")
				src.strengthplus+=10
				src.client.screen+=new/obj/Byakuugan
				//src.overlays+='byakuganthing.dmi'
				src.byakuganon=1
				src.requirements.Add("byakugan")
				//spawn()src.eyes() disabling for now
				spawn()Show_Radar(src)
				spawn(500)
					src.byakuganon=0
					src.requirements.Remove("byakugan")
					for(var/obj/Byakuugan/A in src.client.screen)
						del(A)
					spawn()Show_Radar(src)
					src.jyuuken=0
					src.strengthplus-=10
					if(src.strengthplus<0)
						src.strengthplus=0

			if("Kaiten")
				src << output("[src]: Kaiten", "combatlog")
				src.protected=1
				src.doing=1//cant do jutsus
				src.overlays+=new/obj/kaitenblob
				src.canmove=0
				src.hyuugablob=1
				spawn()
					src.kaitenZ()
				if(src.chakra<=0)
					src.protected=0
					src.doing=0//can do jutsus
					src.overlays-=new/obj/kaitenblob
					src.canmove=1
				else

					var/time=2
					while(time&&src.chakra>0)
						sleep(10)//3 secs
						src.chakra-=src.max_chakra/100
						time--

					if(src.protected)
						src.protected=0
						src.doing=0//can do jutsus
						src.overlays-=new/obj/kaitenblob
						src.canmove=1
						src.hyuugablob=0


			if("Jyuuken")
				if(!src.jyuuken)
					src << output("[src]: You are now using jyuuken, you have higher strength and now your punches cause damage to life", "combatlog")
					src.jyuuken=1

				else
					src << output("[src]: You are now using normal fists..", "combatlog")
					src.jyuuken=0



			if("sixtyfour_palms")
				var/mob/S=src.targeted
				if(!S)
					src<<output("You need to target someone first..", "combatlog")
					ReturnPrice("sixtyfour_palms")
					return
				src << output("[src]: Hakkeshou: 64 palms", "combatlog")
				var/obj/trigram/x=new/obj/trigram
				x.loc=src.loc
				x.owner=src
				if(S in view(2,src.loc))
					src.canmove=0
					S.canmove=0
					S.doing=1
					src.doing=1
					src.Facedir(S)
					S.Facedir(src)
					src.icon_state="ready"
					sleep(8)
					src.icon_state="64"
					//S.overlays+='palmshit.dmi'
					S.chakra=0
					S.canregen=0
					S << output("[src] hit you with 64 palms blocking your chakra points. This lasts for 30 seconds", "combatlog")
					sleep(21)
					S.icon_state="push back"
					//S.overlays-='palmshit.dmi'
					S.canmove=1
					src.Facedir(S)
					S.Facedir(src)
					S.PushEnemy(5,src.dir)
					spawn(5)
						for(var/obj/trigram/z in world)
							if(z.owner==src)
								del(z)
						src.canmove=1
						src.icon_state=""
						S.icon_state=""
						src.doing=0
						S.doing=0
						sleep(300)
						S.doing=0
						S.canregen=1
						spawn() S.regeneration()

				else
					for(var/obj/trigram/z in world)
						if(z.owner==src)
							del(z)

