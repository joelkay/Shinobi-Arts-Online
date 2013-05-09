world
	fps=30

proc/get_speed_delay(n)
	if(n != 0)
		return (world.icon_size * world.tick_lag) / n
	else
		return (world.icon_size * world.tick_lag) / 1

proc/get_glide_size(n, dir)
	if(dir & (dir - 1)) //diagonal
		return n + (n >> 1) //n / 2 is n >> 1
	else //cardinal
		return n

atom/movable
	var/movespeed = 20
	var/tmp/move_time = 0
	var/tmp/transferring = 0

	Move()
		if(!src.loc) return ..()

		if(world.time < src.move_time) return 0

		if(transferring) return 0

		src.move_time = world.time + get_speed_delay(src.movespeed)

		. = ..()

		if(.)
			src.glide_size = get_glide_size(src.movespeed)

	proc/Transfer(atom/location)
		if(!location) return

		src.transferring = 1

		spawn(get_speed_delay(src.movespeed))
			src.x = location.x
			src.y = location.y
			src.z = location.z

			spawn(world.tick_lag)
				src.transferring = 0