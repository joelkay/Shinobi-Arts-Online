mob
	proc
		bupdateHealth()
			if(src.barsclosedd)
				return
			if(src.health*100 <= 0)
				spawn(10) src.bupdateHealth()
				return
			var/percent=round(src.health/src.max_health*100,10)
			if(percent>200) percent = 100
			else if(percent>100) percent=100
			if(percent<0) percent=0
			for(var/obj/minihudMeters/health/o in src.underlays)
				o.icon_state=num2text(percent)



		bupdateki()
			if(src.barsclosedd)
				return
			var/percent2=round(src.chakra/src.max_chakra*100,10)
			if(percent2>200) percent2 = 100
			else if(percent2>100) percent2=100

			if(percent2<0) percent2=0
			for(var/obj/minihudMeters/chakra/o in src.underlays)
				o.icon_state=num2text(percent2)





		bupdatelife()
			if(src.barsclosedd)
				return
			var/percent3=round(src.life/src.max_life*100,10)
			if(percent3>100) percent3=100

			if(percent3<0) percent3=0
			for(var/obj/minihudMeters/life/o in src.underlays)
				o.icon_state=num2text(percent3)






mob
	var/tmp/barsclosedd=0

	proc
		initiateunderbars()
			var/obj/P=new/obj/minihudMeters/health
			var/obj/Q=new/obj/minihudMeters/chakra
			var/obj/R=new/obj/minihudMeters/life
			src.underlays+=P
			src.underlays+=Q
			src.underlays+=R
			src.bupdateHealth()
			src.bupdateki()
			src.bupdatelife()

			spawn(150)
				src.removeunderbars()


		removeunderbars()
			src.underlays=null
			if(src.client)
				src.barsclosedd=1



obj
	minihudMeters
	//////////////////////////////////////
		health
			icon='hp1.dmi'
			icon_state="0"
			layer = 100


		chakra
			icon='chakra1.dmi'
			icon_state="0"
			layer = 100

		life
			icon='lifez.dmi'
			icon_state="0"
			layer = 150

