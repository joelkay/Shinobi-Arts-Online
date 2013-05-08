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





mob
	proc
		popup(something)
			switch(something)
				if("move")
					src.client.screen+=new/obj/popups/move
					src<<"<font color=blue><font size=3>Use these keys to follow the chase!</font>"
					src.runon=1
					src.canmove=1//enable di-Rs
					src.mdelay=0
					src.inmove=0
					spawn(20)

						for(var/obj/popups/H in src.client.screen)
							del(H)

				if("attack")
					src.client.screen+=new/obj/popups/attack
					src<<"<font color=blue><font size=3>Use these keys to attack the sound shinobi!</font>"
					src.canmove=1//enable di-Rs
					spawn(20)

						for(var/obj/popups/H in src.client.screen)
							del(H)


				//	src.canclick=1


