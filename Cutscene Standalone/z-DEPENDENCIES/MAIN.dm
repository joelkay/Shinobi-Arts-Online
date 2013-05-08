mob
	icon='base.dmi'
	Login()
		src.verbs += typesof(/mob/Owner/verb)
		..()


	verb
		Begin()
			spawn() src.Allocate_Maps()
			wait
			if(!src.map)
				alert("Please wait loading maps")
				spawn(10)
					goto wait
			src.client.Resolution()
			inscenes=0
			src.sight |= (SEE_MOBS|SEE_OBJS|SEE_TURFS)  // turn on several bits at once
			src.mainscene1()




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