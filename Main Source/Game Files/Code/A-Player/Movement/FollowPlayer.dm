mob/var/follow=0
mob
	verb
		FollowPlayer(mob/M in range(10,src))
			set category = "Character Management"
			if(M==src)return
			if(!M.client)
				src<<"Cant follow npcs"
				return
			src<<"You Start Following [M.name], you can not use skills in this mode. Press Stop Following to stop following"
			M.doing=1
			M.follow=1
			walk_towards(src,M,2)

		StopFollowing()
			set category = "Character Management"
			src<<"You Stop Following."
			walk(src,0)
			if(src.follow)
				src.doing=0
				src.follow=0