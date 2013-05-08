mob
	proc
		updateHealth()
			if(src.barsclosed||!src.client)
				return
			if(src.health*100 <= 0)
				spawn(10) src.updateHealth()
				return
			var/percent=round(src.health/src.max_health*42,1)
			if(percent>100) percent = 42
			else if(percent>42) percent=42
			if(percent<0) percent=0
			for(var/obj/hudMeters/o in src.client.screen)
				o.icon_state=num2text(percent)

			spawn(10)
				src.updateHealth()


		updateki()
			if(src.barsclosed||!src.client)
				return
			var/percent2=round(src.chakra/src.max_chakra*42,1)
			if(percent2>100) percent2 = 42
			else if(percent2>42) percent2=42

			if(percent2<0) percent2=0
			for(var/obj/kimeters/o in src.client.screen)
				o.icon_state=num2text(percent2)

			spawn(10)
				src.updateki()


		updateenergy()
			if(src.barsclosed||!src.client)
				return
			var/percent2=round(src.energy/src.max_energy*42,1)
			if(percent2>100) percent2 = 42
			else if(percent2>42) percent2=42

			if(percent2<0) percent2=0
			for(var/obj/fatiguemetres/o in src.client.screen)
				o.icon_state=num2text(percent2)

			spawn(10)
				src.updateenergy()




		updatelife()
			if(src.barsclosed||!src.client)
				return

			var/percent3=round(src.life/src.max_life*100)
			for(var/obj/lifemeters/o in src.client.screen)
				if(src.icon_name=="basewhite")
					o.icon_state="white"
					if(percent3<50)
						o.icon_state="neardeathW"
				if(src.icon_name=="baseblack")
					o.icon_state="black"
					if(percent3<50)
						o.icon_state="neardeathB"
				else
					o.icon_state="white"
					if(percent3<50)
						o.icon_state="neardeathW"

			spawn(10)
				src.updatelife()






mob
	var/tmp/barsclosed=0

	proc
		initiatebars()
			src.client.screen+=new/obj/overall

			src.client.screen+=new/obj/hudMeters/health_01

			src.client.screen+=new/obj/kimeters/ki_01

			src.client.screen+=new/obj/fatiguemetres/fat_01


			src.client.screen+=new/obj/lifemeters/life
			//src.client.screen+=new/obj/lifemeters/life_02
			//src.client.screen+=new/obj/lifemeters/life_03
			//src.client.screen+=new/obj/lifemeters/life_04

			src.barsclosed=0
			src.updateHealth()
			src.updateki()
			src.updatelife()
			src.updateenergy()


		removebars()
			for(var/obj/overall/a in src.client.screen)
				del(a)
			for(var/obj/hudMeters/H in src.client.screen)
				del(H)
			for(var/obj/kimeters/I in src.client.screen)
				del(I)
			for(var/obj/lifemeters/J in src.client.screen)
				del(J)
			for(var/obj/fatiguemetres/L in src.client.screen)
				del(L)
			src.barsclosed=1




obj
	overall
		icon='overall.dmi'
		layer=40

		New()
			..()
			src.screen_loc="1:5,[usr.client.statbars]"
obj
	hudMeters
	//////////////////////////////////////
		health_01
			icon='health.dmi'
			icon_state="0"
			layer = 100

			New()
				..()
				src.screen_loc="1:5,[usr.client.statbars]"







	kimeters
		ki_01
			icon='chakraz.dmi'
			icon_state="0"
			layer = 100

			New()
				..()
				src.screen_loc="1:5,[usr.client.statbars]"


	lifemeters
		life
			icon='mugshots.dmi'
			icon_state="empty"
			layer = 150

			New()
				..()
				src.screen_loc="1:5,[usr.client.statbars]"

/*
	lifemeters2
		life_01
			icon='life1.dmi'
			icon_state="0"
			layer = 150
			screen_loc="2,15"
		life_02
			icon='life2.dmi'
			icon_state="0"
			layer = 150
			screen_loc="2,15"
		life_03
			icon='life3.dmi'
			icon_state="0"
			layer = 150
			screen_loc="2,14"
		life_04
			icon='life4.dmi'
			icon_state="0"
			layer = 150
			screen_loc="2,14"

*/


obj
	fatiguemetres
		fat_01
			icon='fatigue.dmi'
			icon_state="0"
			layer = 100


			New()
				..()
				src.screen_loc="1:5,[usr.client.statbars]"












