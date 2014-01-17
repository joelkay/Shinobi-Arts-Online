obj
	popups
		screen_loc = "10,2"
		density=1
		opacity=1
		layer=MOB_LAYER+4
		move
			icon='move.png'
		attack
			icon='attack.png'
		hud
			icon='hud.bmp'




proc
	popup(mob/M,something)

		switch(something)

			if("move")
				M.client.screen+=new/obj/popups/move
				Apopup(M,"Use these keys to follow the chase!")
				M.runon=1
				M.canmove=1//enable di-Rs
				M.mdelay=0
				M.inmove=0
				spawn(20)

					for(var/obj/popups/H in M.client.screen)
						del(H)


			if("attack")
				M.client.screen+=new/obj/popups/attack
				Apopup(M,"Use these keys to attack the sound shinobi!")
				M.canmove=1//enable di-Rs
				spawn(20)

					for(var/obj/popups/H in M.client.screen)
						del(H)

			if("hud")
				M.client.screen+=new/obj/popups/hud
				Apopup(M,"This bar represents four things. Red: Health, Blue: Chakra, Yellow: Energy and the face icon represents your life!")
				M.canmove=1//enable di-Rs
				spawn(20)

					for(var/obj/popups/H in M.client.screen)
						del(H)


			//	M.canclick=1


