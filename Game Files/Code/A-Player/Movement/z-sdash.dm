mob/proc/Dash(k,xdir) //if push then the knockback will stun the opponent
	if(!src.koed)
	//	src.canmove=0//cant ruin the damn smoothness
	//	if(!src.icon_state)
	//		src.icon_state="hurt"
		src.animate_movement=2
		var/i=k
		var/reflected = 0

		while(i>0 &&src)
			var/pass=1
			var/turf/T=get_step(src,xdir)
			for(var/atom/o in get_step(src,xdir))
				if(o)
					if(istype(o,/mob))
						Bump(o)
						spawn(10) src.canmove=1
						return

					if(o.density==1)
						pass=0
			if(!T)
				pass=0
			else
				if(T.density==1)
					pass=0
			if(xdir==NORTH)
				if(pass)
					src.y++
					var/obj/A=new src.dashtrail(T);
					A.dir=src.dir
					//T << "[A]"
					src.dashtrails.Add(A)

				else if(!reflected)
					i /= 2
					i = round(i,1)
					xdir = pick(SOUTHEAST, SOUTHWEST)
					reflected = 1
					continue
			if(xdir==SOUTH)
				if(pass)
					src.y--
					var/obj/A=new src.dashtrail(T);
					A.dir=src.dir
					//T << "[A]"
					src.dashtrails.Add(A)


				else if(!reflected)
					i /= 2
					i = round(i,1)
					xdir = pick(NORTHEAST, NORTHWEST)
					reflected = 1
					continue
			if(xdir==EAST)
				if(pass)
					src.x++
					var/obj/A=new src.dashtrail(T);
					A.dir=src.dir
					//T << "[A]"
					src.dashtrails.Add(A)

				else if(!reflected)
					i /= 2
					i = round(i,1)
					xdir = pick(NORTHWEST, SOUTHWEST)
					reflected = 1
					continue
			if(xdir==WEST)
				if(pass)
					src.x--
					var/obj/A=new src.dashtrail(T);
					A.dir=src.dir
					//T << "[A]"
					src.dashtrails.Add(A)

				else if(!reflected)
					i /= 2
					i = round(i,1)
					xdir = pick(NORTHEAST, SOUTHEAST)
					reflected = 1
					continue
			if(xdir==NORTHWEST)
				if(pass)
					src.y++
					src.x--
					var/obj/A=new src.dashtrail(T);
					A.dir=src.dir
					//T << "[A]"
					src.dashtrails.Add(A)

				else if(!reflected)
					i /= 2
					i = round(i,1)
					xdir = pick(EAST, SOUTH)
					reflected = 1
					continue
			if(xdir==NORTHEAST)
				if(pass)
					src.y++
					src.x++
					var/obj/A=new src.dashtrail(T);
					A.dir=src.dir
					//T << "[A]"
					src.dashtrails.Add(A)

				else if(!reflected)
					i /= 2
					i = round(i,1)
					xdir = pick(WEST, SOUTH)
					reflected = 1
					continue
			if(xdir==SOUTHEAST)
				if(pass)
					src.x++
					src.y--
					var/obj/A=new src.dashtrail(T);
					A.dir=src.dir
					//T << "[A]"
					src.dashtrails.Add(A)

				else if(!reflected)
					i /= 2
					i = round(i,1)
					xdir = pick(WEST, NORTH)
					reflected = 1
					continue
			if(xdir==SOUTHWEST)
				if(pass)
					src.x--
					src.y--
					var/obj/A=new src.dashtrail(T);
					A.dir=src.dir
					//T << "[A]"
					src.dashtrails.Add(A)

				else if(!reflected)
					i /= 2
					i = round(i,1)
					xdir = pick(EAST, NORTH)
					reflected = 1
					continue
			sleep(0)//max speed nigga
			i--

		if(src)
			src.animate_movement=1
			src.canmove=1//dere u go
		//	if(src.icon_state=="hurt")
		//		src.icon_state=""