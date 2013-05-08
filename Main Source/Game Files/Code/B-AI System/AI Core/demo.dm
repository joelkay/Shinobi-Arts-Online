mob/var/level      =6
mob/icon='icons.dmi'
mob/density=1
client/perspective=EDGE_PERSPECTIVE
world/mob=/player
world/turf=/turf/grass

player
	name="player"
	icon_state="human"
	parent_type=/mob
	level=1
	verb
		modify_intelligence(monster/m in oview(), n as num)
			m.intelligence=n
			src << "[m]'s intelligence = [n]"

		delete(monster/m in oview())
			del m

		change_level(mob/m in oview(),n as num)
			m.level=n
			src << "[m] is now level [level]"

		spawn_monster()
			var/monster/x=input(src, "spawn what?") in typesof(/monster) - /monster
			new x(loc)
			src << "made [x]"

		invis_toggle()
			invisibility=!invisibility

atom/movable/proc/Bumped(atom/ref)

atom/movable/Bump(atom/movable/o)
	o.Bumped(src)

mob/proc/Attacked(mob/m)

mob/proc/Attack(mob/m)		//these are all just declarations, the real procs need to be
	m.Attacked(src)			//defined under /monster and /player

mob/proc/Death()

monster

	Death()
		world << "[src] died"
		flags &= ~REQUESTEDHELP
		flags &= ~FLEEING
		loc=locate(0,0,0)
		spawn(300)
			loc=locate(rand(1,world.maxx),rand(1,world.maxy),1)
			HP=MAXHP

	DblClick()
		usr << "[src]: [target]"

	Bumped(mob/ref)
		ref.Attack(src)
		ref << "you attacked [src]"
		HP--
		if(HP<=0)Death()

	Attack(mob/m)
		..()
		m << "you've been attacked!"

	Attacked(mob/m)
		if(isclient(m) && !(flags & FRIENDLY))
			if(!target && (flags & RETALIATE))
				target=m
		else if(!target && (flags & RETALIATE))
			target=m
		for(var/monster/o in oview(7,src))
			if(o.flags & SEEVIOLENCE)
				o.target=m

turf/grass{icon='icons.dmi';icon_state="grass"}
proc/Log(info,file)
	file << info