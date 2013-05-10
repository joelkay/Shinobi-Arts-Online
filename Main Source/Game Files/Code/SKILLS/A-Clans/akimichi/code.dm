mob
	proc/Skillakimichi(a)
		switch(a)

///////////AKIMICHI////////////////////////////////////

			if("Spinach_pill")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
			//	src.overlays+='akipilla.dmi'
				src << output("[src]: You gained a strength and health boost be carefull it lasts 50 seconds..", "combatlog")
				src.strengthplus+=30
			//	src.health+=(src.max_health*2)
				sleep(1000)
				src<<output("You lost life as the side effects of the pill..", "combatlog")
			//	src.overlays-='akipilla.dmi'
				src.Dec_life(30,src,"Spinach_pill")
				src.strengthplus-=30
				if(src.strengthplus<0)
					src.strengthplus=0
				return

			if("Curry_pill")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
			//	src.overlays+='akipillb.dmi'
				src << output("[src]: You gained a high strength and health boost be carefull it lasts 50 seconds..", "combatlog")
				src.strengthplus+=60
			//	src.health+=(src.max_health*3.5)
				sleep(1000)
				src<<output("You lost life as the side effects of the pill..", "combatlog")
			//	src.overlays-='akipillb.dmi'
				src.Dec_life(60,src,"Curry_pill")
				src.strengthplus-=60
				if(src.strengthplus<0)
					src.strengthplus=0
				return

			if("Chilli_pill")
				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				//src.overlays+=new/obj/butterflywings
				//spawn(50)
				//	src.overlays-=new/obj/butterflywings
				src << output("[src]: You gained a significant strength and health boost be carefull it lasts 50 seconds..", "combatlog")
				src.strengthplus+=250
			//	src.health+=(src.max_health*8)
				sleep(1000)
				src<<output("You lost life as the side effects of the pill..", "combatlog")
				src.overlays-='akipillc.dmi'
				src.Dec_life(250,src,"Chilli_pill")
				src.strengthplus-=250
				src.health=250
				if(src.strengthplus<0)
					src.strengthplus=0
				return

			if("Sizeup")
				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				src << output("[src]: Sizeup..", "combatlog")
				src<<output("Skill not yet fixed..", "combatlog")

				var/icon/d= new(src:icon, src:icon_state)
				d.Scale(128,128)
				src.icon=d
				for(var/O in src.overlays)
					var/icon/A = new(O:icon, O:icon_state)
					A.Scale(128,128)
					overlays.Add(A)


			if("Meattank")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				src << output("[src]: Meattank..", "combatlog")
				var/obj/meattank/A=new/obj/meattank
				src.inmeat=1
				src.icon=A
				src.overlays=null
				sleep(70)
				src.icon=""
				src.inmeat=0
				src.Load_Overlays()
				src.Affirm_Icon()