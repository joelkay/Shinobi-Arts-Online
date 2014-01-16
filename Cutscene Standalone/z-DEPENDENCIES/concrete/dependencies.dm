atom
	var/owner

mob
	var/inscenes=0
	var/runon
	var/canmove
	var/Village
	var/mdelay
	var/inmove


mob
	proc
		Save()
			world<<"Saves here"

		showmacros()
			world<<"Loads macros here"

		loadfirst()
			world<<"Completes loading here"


client
	Move()
		if(!mob.canmove)
			return
		else
			..()


mob
	verb
		Attack()
			set hidden=1
			attackzc()



	Bump(atom/movable/a)
		if(istype(a,/obj/bump))//delete them for next scene
			scene4begin()


