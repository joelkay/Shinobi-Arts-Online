mob
	var/tmp/streak=0

obj
	killstreaks

		hundredpoints
			icon='killstreak.dmi'
			screen_loc = "11,11"
			density=1
			opacity=1
			layer=MOB_LAYER+4

		killstreaka//3 kill streak
			icon='3ks.dmi'
			screen_loc = "9,11"
			density=1
			opacity=1
			layer=MOB_LAYER+4

		killstreakb//3 kill streak
			icon='4ks.dmi'
			screen_loc = "9,11"
			density=1
			opacity=1
			layer=MOB_LAYER+4

		killstreakc//3 kill streak
			icon='5ks.dmi'
			screen_loc = "9,11"
			density=1
			opacity=1
			layer=MOB_LAYER+4


/*
mob
	verb
		killstreakz()
			src.killstreak()

*/
mob
	proc
		killstreak()
			if(!src.client)
				return
			src.kills++
			spawn() world.bingosort()
			spawn()
				src.killsset()
			src.streak++
			Bingo_Book(src)
			src.client.screen+=new/obj/killstreaks/hundredpoints
			if(src.streak==3)
				src<<"3 kill streak"
				sleep(5)
				for(var/obj/killstreaks/H in src.client.screen)
					del(H)
				src.client.screen+=new/obj/killstreaks/killstreaka
				spawn(20)
					for(var/obj/killstreaks/H in src.client.screen)
						del(H)
			if(src.streak==4)
				src<<"4 kill streak"
				sleep(5)
				for(var/obj/killstreaks/H in src.client.screen)
					del(H)
				src.client.screen+=new/obj/killstreaks/killstreakb
				spawn(20)
					for(var/obj/killstreaks/H in src.client.screen)
						del(H)
			if(src.streak==5)
				src<<"5 kill streak"
				sleep(5)
				for(var/obj/killstreaks/H in src.client.screen)
					del(H)
				src.client.screen+=new/obj/killstreaks/killstreakc
				spawn(20)
					for(var/obj/killstreaks/H in src.client.screen)
						del(H)


			spawn(30)
				for(var/obj/killstreaks/H in src.client.screen)
					del(H)


mob
	proc
		killsset()
			var/params
			params=list(":.Kills.:"=src.kills)
			world.SetScores(src.key,list2params(params))
			if(src.kills>50&&!src.killmedalset)
				world<<"<font color=blue>[src] got the medal 50Kills!</font>"
				world.SetMedal("50Kills!", src)
				src.killmedalset=1







