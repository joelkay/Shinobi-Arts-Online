mob
	proc/Skillgaara(g)
		switch(g)

///////////////GAARA//////////////////////////////////

			if("Sand_shield")
				src << output("[src]: Sand shield", "combatlog")
				for(var/obj/SandM/A in view())
					if(A&&A.owner==src)
						A.loc=src.loc
						src.protected=1
						src.doing=1//cant do jutsus
						src.overlays+='createshield.dmi'
						sleep(12)
						src.overlays-='createshield.dmi'
						src.overlays+='Sand Shield.dmi'
						src.canmove=0
						if(src.chakra<=0)
							src.protected=0
							src.doing=0//can do jutsus
							src.canmove=1
							src.overlays-='Sand Shield.dmi'
						else
							if(src.protected==1&&src.chakra>0)
								sleep(20)//2 secs
								src.chakra-=src.max_chakra/100
								if(src.protected==1&&src.chakra>0)
									sleep(20)//2 secs
									src.chakra-=src.max_chakra/100
									if(src.protected==1&&src.chakra>0)
										sleep(20)//2 secs
										src.chakra-=src.max_chakra/100
										sleep(10)
										src.protected=0
										src.doing=0//can do jutsus
										src.canmove=1
										src.overlays-='Sand Shield.dmi'
									else
										src.protected=0
										src.doing=0//can do jutsus
										src.canmove=1
										src.overlays-='Sand Shield.dmi'
								else
									src.protected=0
									src.doing=0//can do jutsus
									src.canmove=1
									src.overlays-='Sand Shield.dmi'
							else
								src.protected=0
								src.doing=0//can do jutsus
								src.canmove=1
								src.overlays-='Sand Shield.dmi'


					else
						src<<output("No sand in your location..", "combatlog")

			if("Sand_control")
				src << output("[src]: You start to control the Sand around you..", "combatlog")
				src.overlays+='sand control.dmi'
				var/obj/SandM/X=new/obj/SandM
				X.loc=src.loc
				X.owner=src

			if("Sand_cancel")
				src.overlays-='sand control.dmi'
				for(var/obj/SandM/A in world)
					if(A.owner==src)
						del(A)




			if("Sand_shuriken")
				src << output("[src]: Sand shuriken..", "combatlog")
				for(var/obj/SandM/A in view())
					if(A&&A.owner==src)
						/////////////////////////////////////////////////
						var/obj/SShuriken/D=new/obj/SShuriken
						var/mob/M=src.targeted
						D.loc = locate(A.x,A.y-1,A.z)
						D.dir = src.dir
						D.owner = src
						/////////////////////////////////////////////////
						/////////////////////////////////////////////////
						var/obj/SShuriken/E=new/obj/SShuriken
						E.loc = locate(A.x,A.y,A.z)
						E.dir = src.dir
						E.owner = src
						/////////////////////////////////////////////////
						/////////////////////////////////////////////////
						var/obj/SShuriken/F=new/obj/SShuriken
						F.loc = locate(A.x,A.y+1,A.z)
						F.dir = src.dir
						F.owner = src
						/////////////////////////////////////////////////
						if(M)
							walk_towards(D,M,2)
							walk_towards(E,M,2)
							walk_towards(F,M,2)
							sleep(40)
							del(D)
							del(E)
							del(F)
						walk_towards(D,src.dir,2)
						walk_towards(E,src.dir,2)
						walk_towards(F,src.dir,2)
						sleep(40)
						del(D)
						del(E)
						del(F)
					else
						src<<output("No sand in your location..", "combatlog")


			if("Desert_coffin")
				src << output("[src]: Desert_Coffin..", "combatlog")
				for(var/obj/SandM/A in view())
					if(A&&A.owner==src)
						var/mob/M=src.targeted
						if(M)
							A.coffinate=1
							walk_towards(A,M,3)
							sleep(40)
							walk(A,0)
							return
						src<<output("Target someone to desert coffin..", "combatlog")
					else
						src<<"Not enough Sand"


			if("Sand_spike")
				src << output("[src]: Sand spike..", "combatlog")
				Execution(/obj/Sandspike,2,500,src)

