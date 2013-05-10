mob
	proc/Skillpuppet(p)
		switch(p)

/////////////////Puppet///////////////////////////////

			if("puppet1")
				src.delpups()
				var/mob/puppet1/P = new/mob/puppet1
				flick('smoke2.dmi',P)
				P.loc = locate(src.x, src.y, src.z)
				P.owner = src
				P.health = src.health/2
				P.strength = src.strengthmain
				P.dexterity = src.dexteritymain
				src << output("<font color = blue>Press I to controll puppet 1. pressing I again will return ccontrol to yourself. Also pressing L will delete puppets.</FONT>", "combatlog")

			if("puppet2")
				src.delpups2()
				var/mob/puppet2/P = new/mob/puppet2
				flick('smoke2.dmi',P)
				P.loc = locate(src.x, src.y, src.z)
				P.owner = src
				P.health = src.health/2
				P.strength = src.strengthmain
				P.dexterity = src.dexteritymain
				src << output("<font color = blue>Press O to controll puppet 2. pressing O again will return ccontrol to yourself. Also pressing L will delete puppets.</FONT>", "combatlog")


			if("puppet3")
				src.delpups3()
				var/mob/puppet3/P = new/mob/puppet3
				flick('smoke2.dmi',P)
				P.loc = locate(src.x, src.y, src.z)
				P.owner = src
				P.health = src.health/2
				P.strength = src.strengthmain
				P.dexterity = src.dexteritymain
				src << output("<font color = blue>Press P to controll puppet 3. pressing P again will return ccontrol to yourself. Also pressing L will delete puppets.</FONT>", "combatlog")




			if("Puppet_Knives")
				if(src.puppet1)
					for(var/mob/puppet1/P in world)
						if(P.owner==src)
							var/Weapon/Kunai/L = new/Weapon/Kunai
							L.loc = P.loc
							L.dir = P.dir
							L.owner=src
							sleep(3)
							if(src.targeted)
								var/D=src.targeted
								walk_towards(L,D,2)
							else
								walk(L,P.dir,2)
							sleep(50)
							del(L)
							return
				if(src.puppet2)
					for(var/mob/puppet2/P in world)
						if(P.owner==src)
							var/Weapon/Kunai/L = new/Weapon/Kunai
							L.loc = P.loc
							L.dir = P.dir
							L.owner=src
							sleep(3)
							if(src.targeted)
								var/D=src.targeted
								walk_towards(L,D,2)
							else
								walk(L,P.dir,2)
							sleep(50)
							del(L)
							return
				if(src.puppet3)
					for(var/mob/puppet3/P in world)
						if(P.owner==src)
							var/Weapon/Kunai/L = new/Weapon/Kunai
							L.loc = P.loc
							L.dir = P.dir
							L.owner=src
							sleep(3)
							if(src.targeted)
								var/D=src.targeted
								walk_towards(L,D,2)
							else
								walk(L,P.dir,2)
							sleep(50)
							del(L)
							return


				else
					src << output("You must be in controll of a puppet to use this jutsu..", "combatlog")
					return

			if("Puppet_Transformation_Technique")
				if(src.puppet1)
					for(var/mob/puppet1/P in view(src))
						if(P.owner==src)
							if(src.targeted)
								var/t=P.icon
								o = P.overlays.Copy()
								var/mob/M=src.targeted
								src << output("[src]: Puppet_Transformation_Technique no-Jutsu!", "combatlog")
								P.savedi=t
								flick('smoke.dmi',P)
								P.icon=M.icon
								P.overlays = M.overlays
							else
								src<<output("Puppet will Transformation_Technique into you..", "combatlog")
								P.icon=src.icon
								P.overlays = src.overlays
								return
				if(src.puppet2)
					for(var/mob/puppet2/P in view(src))
						if(P.owner==src)
							if(src.targeted)
								var/t=P.icon
								o = P.overlays.Copy()
								var/mob/M=src.targeted
								src << output("[src]: Puppet_Transformation_Technique no-Jutsu!", "combatlog")
								P.savedi=t
								flick('smoke.dmi',P)
								P.icon=M.icon
								P.overlays = M.overlays
							else
								src<<output("Puppet will Transformation_Technique into you..", "combatlog")
								P.icon=src.icon
								P.overlays = src.overlays
								return

				if(src.puppet3)
					for(var/mob/puppet3/P in view(src))
						if(P.owner==src)
							if(src.targeted)
								var/t=P.icon
								o = P.overlays.Copy()
								var/mob/M=src.targeted
								src << output("[src]: Puppet_Transformation_Technique no-Jutsu!", "combatlog")
								P.savedi=t
								flick('smoke.dmi',P)
								P.icon=M.icon
								P.overlays = M.overlays
							else
								src<<output("Puppet will Transformation_Technique into you..", "combatlog")
								P.icon=src.icon
								P.overlays = src.overlays
								return

				else
					src << output("You must be in controll of a puppet to use this jutsu..", "combatlog")
					return


			if("Puppet_Shield")
				if(src.puppet2)
					for(var/mob/puppet2/P in view(src))
						if(P.owner==src)
							P.icon_state="shield"
							P.protected=1
							if(src in range(2,P))
								src.protected=1
								spawn(60)// 6 seconds
									P.protected=0
									P.icon_state=""
									src.protected=0
				else
					src<<output("You must be in controll of puppet 2..", "combatlog")

			if("Puppet_Crush")
				if(src.puppet3)
					for(var/mob/puppet3/P in view(src))
						if(P.owner==src)
							P.crushing=1
							src<<output("You have 4 seconds to trap an opponent..", "combatlog")
							sleep(40)// 6 seconds
							P.crushing=0
				else
					src<<output("You must be in controll of puppet 3..", "combatlog")




			if("Poison_Bomb")
				if(src.puppet1)
					for(var/mob/puppet1/P in view(src))
						if(P.owner==src)
							if(src.targeted)
								var/mob/M=src.targeted
								var/obj/PoisonB/L = new/obj/PoisonB
								L.loc = P.loc
								L.dir = P.dir
								L.owner=src
								walk_towards(L,M,2)

				if(src.puppet2)
					for(var/mob/puppet2/P in view(src))
						if(P.owner==src)
							if(src.targeted)
								var/mob/M=src.targeted
								var/obj/PoisonB/L = new/obj/PoisonB
								L.loc = P.loc
								L.dir = P.dir
								L.owner=src
								walk_towards(L,M,2)

				if(src.puppet3)
					for(var/mob/puppet3/P in view(src))
						if(P.owner==src)
							if(src.targeted)
								var/mob/M=src.targeted
								var/obj/PoisonB/L = new/obj/PoisonB
								L.loc = P.loc
								L.dir = P.dir
								L.owner=src
								walk_towards(L,M,2)
				else
					src << output("You must be in controll of a puppet to use this jutsu..", "combatlog")
					return












