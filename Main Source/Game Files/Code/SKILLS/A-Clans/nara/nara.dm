///////NARA///////////////
mob/var/trapped=0
mob/var/trapper
mob/var/shadow=0
obj
	shadowhit
		icon='shadow.dmi'
		icon_state="trap"
		layer=MOB_LAYER-1

	shadowtrail
		icon='shadowtrail.dmi'
		layer=MOB_LAYER-1

		//New(newloc, obj/shadow/M)
		//	owner = M
		//	dir = (M.dir != turn(M.olddir,180)) ? (M.dir | M.olddir) : M.dir



obj
	shadow
		density=1
		icon='shadow.dmi'
		icon_state="tip"
		layer=OBJ_LAYER
		pixel_y=-10
		var/canmove=1
		var/list/trails=new

		New()
			..()
			spawn(60)//mpve lasts 6 secs
				del(src)

		Bump(atom/movable/a)
			if(ismob(a))
				var/mob/A=a
				var/mob/B=src.owner

				if(A==B)
					del(src)

				if(A==src)
					del(src)

				else
					walk(src,0)//stop it
					//src.loc=A.loc
					var/obj/shadowhit/D=new(src)
					D.loc=A.loc
					src.trails += D
					A.canmove = 0
					B.shadow=1

					A.doing=1//cant do jutsus
					B.doing=1

					B.canmove = 0

					B.canregen=0
					A.canregen=0

					A.trapped=1
					A.trapper=B//the user hopefully.
					B.targeted=A

					spawn() B.shadowdrain()//drain chakra
			else
				del(src)



		Move()
			var/turf/old_loc = src.loc
			var/d = ..()
			spawn()
				if(d)
					var/obj/O = new(old_loc)
					O.dir = src.dir
					var/obj/m=new/obj/shadowtrail(O)
					m.dir=O.dir
					m.icon_state="patch"
					var/obj/n=new/obj/shadowtrail(O)
					n.dir=O.dir
					n.icon_state="patch"
					if(O.dir==NORTHEAST)
						src.pixel_y=16
						src.pixel_x=16
						O.pixel_y=16
						O.pixel_x=16
						m.pixel_y=-16
						m.pixel_x=-16
						n.pixel_y=16
						n.pixel_x=16
					if(O.dir==SOUTHEAST)
						src.pixel_y=-16
						src.pixel_x=16
						O.pixel_y=-16
						O.pixel_x=16
						m.pixel_y=16
						m.pixel_x=-16
						n.pixel_y=-16
						n.pixel_x=16
					if(O.dir==NORTHWEST)
						src.pixel_y=16
						src.pixel_x=-16
						O.pixel_y=16
						O.pixel_x=-16
						m.pixel_y=-16
						m.pixel_x=16
						n.pixel_y=16
						n.pixel_x=-16
					if(O.dir==SOUTHWEST)
						src.pixel_y=-16
						src.pixel_x=-16
						O.pixel_y=-16
						O.pixel_x=-16
						m.pixel_y=16
						m.pixel_x=16
						n.pixel_y=-16
						n.pixel_x=-16
					if(O.dir==NORTH)
						src.pixel_y=16
						src.pixel_x=0
						O.pixel_y=16
						m.pixel_y=-16
						n.pixel_y=16

					if(O.dir==SOUTH)
						src.pixel_y=-16
						src.pixel_x=0
						O.pixel_y=-16
						m.pixel_y=16
						n.pixel_y=-16
					if(O.dir==EAST)
						src.pixel_x=16
						src.pixel_y=0
						O.pixel_x=16
						m.pixel_x=-16
						n.pixel_x=16
					if(O.dir==WEST)
						src.pixel_x=-16
						src.pixel_y=0
						O.pixel_x=-16
						m.pixel_x=16
						n.pixel_x=-16
					O.pixel_y-=10
					src.pixel_y-=10
					O.underlays+=m
					spawn(1)O.underlays+=n
					O.icon = 'shadowtrail.dmi'
					src.trails += O
			return d


		Del()
			for(var/obj/o in src.trails)
				o.loc = null
			..()









/*

		Move(newloc, newdir)
			var/oldloc = loc
			. = ..()
			if(.)
				var/obj/shadowtrail/O = new(oldloc, src)
				olddir = newdir
				O.owner = src.owner



*/



/*

		Move()
			if(!src.canmove)
				del src  //  Why keep it when there's no point?
			var
				oldloc = src.loc
				olddir = src.dir
			.=..()  //  After this, the src.loc is NOT the same as oldloc (if the Move() is successful)!
			if(!(.)) del src  //  If it cannot move, get rid of it
			var/obj/shadowtrail/N = new(oldloc)  //  Makes a new trail at the old location
			N.owner = src.owner
			N.dir = olddir
			if(src.dir != olddir)  //  If the direction changed.
				N.dir |= src.dir   //  Bit operation. If the old dir was NORTH, new dir is EAST, this does NORTH|EAST = NORTHEAST
*/


/*

mob
	verb
		ControlShadow()
			set hidden=1
			if(src.shadow)
				src<<"Shadow manipulation has ended.."
				src.Skills("Shadow_possesion_Cancel")
				src.controlled=null
				src.client.eye=src
				src.shadow=0
				src.doing=0
				return

			for(var/obj/shadow/P in oview())
				if(P.owner == src)
					src<<"You begin to manipulate the shadow..."
					src.controlled=P
					src.client.eye=P
					src.shadow=1
					src.doing=1

*/
