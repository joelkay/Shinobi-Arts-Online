mob
	proc
		shadowdrain()
			if(src.shadow)
				src.canregen=0
				while(src.chakra>0&&src.shadow)
					sleep(10)//2 secs
					src.chakra-=src.max_chakra/30

				if(src.chakra<=0)
					src.doing=0//can do jutsus
					src.canregen=1
					spawn() src.regeneration()
					src.shadow=0
					src.shadowout=0
					src.controlled=null
					src.client.eye=src
					src.canmove=1
					src<<"Run out of chakra for shadow imitation"
					src.Skills("Shadow_possesion_Cancel")
					return
			else
				src.canregen=1
				spawn() src.regeneration()
				src.shadow=0
				src.doing=0//can do jutsus
				return




mob
	proc
		naracheck()
			if(!src.Clan=="Nara")return
			if(src.shadow)
				for(var/obj/shadow/D in world)
					if(D.owner==src)
						del(D)
						src.shadow=0
				for(var/obj/shadowtrail/E in world)
					if(E.owner==src)
						del(E)
				//for(var/obj/shadowtrail2/F in world)
				//	if(F.owner==src)
				//		del(F)
				//		src.shadow=0
				for(var/mob/M in world)
					if(M.trapper==src)
						M.canmove=1
						M.trapped=0
						M.doing=0//can do jutsus
						M.canregen=1
						spawn() M.regeneration()
						M.trapper=null
						M.underlays=null
				src.canmove=1
				src.canregen=1
				spawn() src.regeneration()
				src.doing=0
				src.shadowout=0
				src.shadow=0
