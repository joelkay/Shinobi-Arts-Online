obj
	Katonball
		//cx = 8
		//cy = 8
		icon='hosenkaV2.dmi'
		icon_state = ""
		layer = MOB_LAYER+1
		density=1

		New()
			..()
			spawn(40)//mpve lasts 6 secs
				del(src)

		Bump(atom/movable/a)
			if(isobj(a))
				src.loc=a.loc

			if(ismob(a))
				var/mob/B=a
				var/mob/G=src.owner

				if(a==G)//swap mob
					src.loc=G.loc

				else
					var/dmg=200
					//flick('Katonballhit.dmi',src)
					B << output("[src.owner]'s Katon Ball hit you for [dmg]!", "combatlog")
					B.Dec_health(dmg,G,"Katonball")// use Dec_health boi
					del(src)
			else
				del(src)





	KatonD // :)
		icon='projectiles.dmi'
		icon_state = "Katondragon" //read New() above for more info. also check the projectiles.dmi
		layer = MOB_LAYER - 1
		var/list/dtrails=new
		density=1

		New(loc,d,o) //loc = location, d = direction, o = owner
			..()
			owner = o
		//	if((src.dir == NORTH) || (src.dir == SOUTH))
			src.pixel_x = 16
			walk(src,d,1) //utilize the walk() proc's third argument please...
			spawn(60) //6 seconds later...
				del (src) //delete itself


		Move()
			..()
			var/turf/old_loc
			switch(src.dir)
				if(NORTH)
					old_loc = get_step(src,SOUTH)
				if(WEST)
					old_loc = get_step(src,EAST)
				if(SOUTH)
					old_loc = get_step(src,NORTH)
				if(EAST)
					old_loc = get_step(src,WEST)
			if(owner in old_loc)
				return
			spawn()
				var/obj/O = new(old_loc)
				O.dir = src.dir
			//	if((src.dir == NORTH) || (src.dir == SOUTH))
				O.pixel_x = 16
				O.icon = 'projectiles.dmi'
				O.icon_state="Katondragon_trail"
				src.dtrails += O



		Del()
			for(var/obj/o in src.dtrails)
				del(o)
			..()

		Bump(atom/movable/a)
			if(ismob(a))
				var/mob/A=a
				var/dmg=(owner:chakraforcemain*6)
				A.Dec_health(dmg,src.owner,"Mystic_Fire_Dragon")
				A << output("[src.owner]'s Katon Dragon hit you for [dmg]!", "combatlog")
				del(src)
			else
				del(src)





	triggerable/fire
		var/dmg=1500
		icon='ktest.dmi'
		SteppedOn(atom/movable/a)//entered
			..()
			if(ismob(a))
				var/mob/A=a
				var/mob/G=src.owner
				A.canmove=0
				A.Dec_health(dmg,G,"grand_Fireball")// use Dec_health boi
				while(src)
					A.stunned=5
					A.Dec_health(dmg,G,"grand_Fireball")// use Dec_health boi
					sleep(10)


	KatonG
		icon='katon goukakyuu.dmi'
		icon_state="hold"
		layer = MOB_LAYER + 1
		density=1

		New()
			..()
			if(src.dir==NORTH)
				src.y+=3
				src.pixel_x=68
				src.pixel_y=74
				spawn() northobjs()
			if(src.dir==SOUTH)
				src.y-=3
				src.pixel_x=-68
				src.pixel_y=-74
				spawn() southobjs()
			if(src.dir==EAST)
				src.x+=3
				src.pixel_x=68
				src.pixel_y=74
				spawn() eastobjs()
			if(src.dir==WEST)
				src.x-=3
				src.pixel_x=-68
				src.pixel_y=-74
				spawn() westobjs()
			spawn(40)//mpve lasts 6 secs
				src.Del()

		Del()
			var/mob/G=src.owner
			if(G)
				G.canmove=1//make him bettar
				G.inmove=0//make him bettar
				G.doing=0
			..()


		proc
			northobjs()
				var/obj/triggerable/fire/a=new/obj/triggerable/fire
				a.loc=locate(src.x,src.y,src.z)
				a.owner=src

				var/obj/triggerable/fire/a2=new/obj/triggerable/fire
				a2.loc=locate(src.x,src.y+1,src.z)
				a2.owner=src

				var/obj/triggerable/fire/a3=new/obj/triggerable/fire
				a3.loc=locate(src.x,src.y+2,src.z)
				a3.owner=src

				var/obj/triggerable/fire/a4=new/obj/triggerable/fire
				a4.loc=locate(src.x,src.y+3,src.z)
				a4.owner=src

				var/obj/triggerable/fire/a5=new/obj/triggerable/fire
				a5.loc=locate(src.x,src.y+4,src.z)
				a5.owner=src

				var/obj/triggerable/fire/a6=new/obj/triggerable/fire
				a6.loc=locate(src.x,src.y+5,src.z)
				a6.owner=src


			southobjs()
			westobjs()
			eastobjs()











