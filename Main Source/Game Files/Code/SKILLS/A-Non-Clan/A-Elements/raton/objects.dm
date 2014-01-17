obj
	triggerable
		Nagashi
			icon = 'nagashi.dmi'
			icon_state = "2"
			density = 0
			layer = MOB_LAYER - 1

			New()
				..()
				spawn(50)//mpve lasts 6 secs
					del(src)

			SteppedOn(atom/movable/a)
				..()
				if(ismob(a))
					var/mob/M=a
					var/mob/G=src.owner
					if(M&&G)
						var/dmg=(G.reflexmain+G.chakraforcemain)*2
						if(M==G)
							return
						AoE_Damage(G,M,3,dmg)