/* Screen Transitions
	Shadowdarke (shadowdarke@hotmail.com) Jan 2007

	This library provides two very simple procs to display fade effects and several demo fade icons.

	See screen_transition_demo.dm for a demonstration of usage.
*/

client
	proc
		st_fadeout(Icon, frames, Layer = 50)
		/* fade out using Icon for frames number of frames
			RETURNS: the HUD obj used to obscure the screen
		*/
			var/obj/fade = new()
			fade.text = " "
			fade.name = ""
			fade.icon = Icon
			fade.icon_state = "1"
			fade.layer = Layer
			fade.screen_loc = "SOUTHWEST to NORTHEAST"
			screen += fade
			for(var/frame = 2 to frames)
				sleep(1)
				fade.icon_state = "[frame]"
			return fade

		st_fadein(obj/fade)
		// fade back in using the existing fade obj
			if(!fade) return
			spawn()	/* return right away so that the program thread may finish and the player can move right
						away, even as the fade effect continues until it's gone. */
				var/frames = text2num(fade.icon_state)
				for(var/frame = frames-1 to 1 step -1)
					fade.icon_state = "[frame]"
					sleep(1)
				screen -= fade
				del(fade)





mob
	proc
		fade()

			var/I='dither.dmi'
			if(I)
				/* Figure out the number of frames. Ideally, your program would already know this and not need
					the next two lines. */
				var/icon/Icon = new(I)
				var/list/states = Icon.IconStates()

				// fade out and store the object used to display the effect
				var/fade = client.st_fadeout(I, states.len)

				/* You would move the player or do whatever else you wanted here. We'll teleport randomly and
					pause a couple ticks so you can see that you the screen is obscured. */
				Move(locate(rand(1,world.maxx),rand(1,world.maxy),1))
				sleep(4)

				// fade back in, using the stored obj
				client.st_fadein(fade)