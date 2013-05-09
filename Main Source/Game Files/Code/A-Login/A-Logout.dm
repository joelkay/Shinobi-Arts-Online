client
	Del()
		players.Remove(src)
		Loggedin(src,0)//make it so they can loginto other servers now
		if(istype(mob,/mob))
			var/mob/M=mob
			Save_Mob(M,1)//save local and then do a sql save after.
		del mob
		return ..()

mob
	Logout()
		people.Remove(src)
		if(src in DefenderGuys)
			DefenderGuys.Remove(src)

		if(src in AttackerGuys)
			AttackerGuys.Remove(src)

		for(var/Z in src.inventorystuff)
			del(Z)

		world.statusupdate()
		return ..()