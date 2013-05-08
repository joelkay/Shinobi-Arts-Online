mob
	proc
		updateHealth2()
			var/mob/M=src.targeted
			if(!M)
				closebars()
				return

			if(src.barsclosed)
				return

			if(M.health*100 <= 0)
				spawn(10) M.updateHealth()
				return
			var/percent=round(M.health/M.max_health*42,1)
			if(percent>100) percent = 42
			else if(percent>42) percent=42
			if(percent<0) percent=0

			for(var/obj/hudMeters2/o in src.client.screen)
				o.icon_state=num2text(percent)

			spawn(10)
				src.updateHealth2()


		updateki2()
			var/mob/M=src.targeted
			if(!M)
				closebars()
				return

			if(src.barsclosed)
				return

			var/percent2=round(M.chakra/M.max_chakra*42,1)
			if(percent2>100) percent2 = 42
			else if(percent2>42) percent2=42

			if(percent2<0) percent2=0

			for(var/obj/kimeters2/o in src.client.screen)
				o.icon_state=num2text(percent2)

			spawn(10)
				src.updateki2()


		updateenergy2()
			var/mob/M=src.targeted
			if(!M)
				closebars()
				return

			if(src.barsclosed)
				return

			var/percent2=round(M.energy/M.max_energy*42,1)
			if(percent2>100) percent2 = 42
			else if(percent2>42) percent2=42

			if(percent2<0) percent2=0

			for(var/obj/fatiguemetres2/o in src.client.screen)
				o.icon_state=num2text(percent2)

			spawn(10)
				src.updateenergy2()




		updatelife2()
			var/mob/M=src.targeted
			if(!M)
				closebars()
				return

			if(src.barsclosed)
				return

			var/percent3=round(M.life/M.max_life*100)

			for(var/obj/lifemeters2/o in src.client.screen)
				if(M.icon_name=="basewhite")
					o.icon_state="white"
					if(percent3<50)
						o.icon_state="neardeathW"

				if(M.icon_name=="baseblack")
					o.icon_state="black"
					if(percent3<50)
						o.icon_state="neardeathB"

				else
					o.icon_state="white"
					if(percent3<50)
						o.icon_state="neardeathW"

			spawn(10)
				src.updatelife2()






mob
	proc
		enemybars()//call this in target proc
			src.client.screen+=new/obj/overall2

			src.client.screen+=new/obj/hudMeters2/health_01

			src.client.screen+=new/obj/kimeters2/ki_01

			src.client.screen+=new/obj/fatiguemetres2/fat_01


			src.client.screen+=new/obj/lifemeters2/life

			src.updateHealth2()
			src.updateki2()
			src.updatelife2()
			src.updateenergy2()


		closebars()
			for(var/obj/overall2/a in src.client.screen)
				del(a)
			for(var/obj/hudMeters2/H in src.client.screen)
				del(H)
			for(var/obj/kimeters2/I in src.client.screen)
				del(I)
			for(var/obj/lifemeters2/J in src.client.screen)
				del(J)
			for(var/obj/fatiguemetres2/L in src.client.screen)
				del(L)





obj
	overall2
		icon='overall.dmi'
		layer=40

		New()
			..()
			src.screen_loc="[usr.client.enemybars]:5,[usr.client.statbars]"//6 pixel wide thing
obj
	hudMeters2
	//////////////////////////////////////
		health_01
			icon='health.dmi'
			icon_state="0"
			layer = 100

			New()
				..()
				src.screen_loc="[usr.client.enemybars]:5,[usr.client.statbars]"


	kimeters2
		ki_01
			icon='chakraz.dmi'
			icon_state="0"
			layer = 100

			New()
				..()
				src.screen_loc="[usr.client.enemybars]:5,[usr.client.statbars]"


	lifemeters2
		life
			icon='mugshots.dmi'
			icon_state="empty"
			layer = 150

			New()
				..()
				src.screen_loc="[usr.client.enemybars]:5,[usr.client.statbars]"

obj
	fatiguemetres2
		fat_01
			icon='fatigue.dmi'
			icon_state="0"
			layer = 100


			New()
				..()
				src.screen_loc="[usr.client.enemybars]:5,[usr.client.statbars]"












