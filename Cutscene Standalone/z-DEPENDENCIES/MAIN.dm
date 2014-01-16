var/mobs = 0
mob/New()
    ..()
    world << "mob.new = [src]"
    mobs++
mob/Del()
    mobs--
    world << "mob.del = [src]"
    ..()
mob/Stat()
    stat("mobs:", mobs)




mob
	var/scenepage=0
	icon='base.dmi'
	Login()
		src.verbs += typesof(/mob/Owner/verb)
		..()


	verb
		Begin()
			set hidden=1
			if(scenepage)return
			scenepage=1
			if(!src.map)
				spawn() src.Allocate_Maps(1)

			wait
			if(!src.map)
				spawn(10)
					goto wait

			src.client.Resolution()
			inscenes=0
			src.sight |= (SEE_MOBS|SEE_OBJS|SEE_TURFS)  // turn on several bits at once
			src.mainscene1()


		Begin2()
			set hidden=1
			if(scenepage)return
			scenepage=1
			if(!src.map)
				spawn() src.Allocate_Maps(1)

			wait
			if(!src.map)
				spawn(10)
					goto wait

			src.client.Resolution()
			inscenes=0
			src.sight |= (SEE_MOBS|SEE_OBJS|SEE_TURFS)  // turn on several bits at once
			src.scene4begin()


		Begin3()
			set hidden=1
			if(scenepage)return
			scenepage=1
			if(!src.map)
				spawn() src.Allocate_Maps(1)

			wait
			if(!src.map)
				spawn(10)
					goto wait

			src.client.Resolution()
			inscenes=0
			src.sight |= (SEE_MOBS|SEE_OBJS|SEE_TURFS)  // turn on several bits at once
			scene5begin()




	proc
		align()
			world<<"The Cpanel gets aligned at this stage"


	verb
		Resolute()
			src.client.Resolution()


	verb
		RemoveView()
			if(vis.cant_see(src.name))
				vis.is_not_a(src.name)

		ShowView()
			if(vis.can_see(src.name))
				vis.is_a(src.name)


	verb
		GetLocation()
			set category ="Location"
			src<<"<b><font color =green>swap loc: </b> src.loc = locate(src.map.x1+[x-1],src.map.y1+[y-1],src.map.z1)"




