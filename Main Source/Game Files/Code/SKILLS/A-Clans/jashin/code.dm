mob
	proc/Skilljashin(j)
		switch(j)

////////////////////////Jashin//////////////////////////////////////

			if("Bloodbind")
				src << output("[src]: Bloodbind..", "combatlog")
				for(var/mob/M in get_step(src,src.dir))
					if(M)
						Blood(M.x,M.y,M.z)
						M<<output("[src] took your blood..", "combatlog")
						src<<output("took [M]'s blood..", "combatlog")
						src.binded=M
						return
					else
						src<<output("Couldnt get blood..", "combatlog")


			if("Bloodbind_Cancel")
				src << output("[src]: You Cancel bloodbind..", "combatlog")
				src.binded=""
				return



			if("Jashin_circle")
				src << output("[src]: Jashin circle: When you enter this circle, any damage you do to yourself is done the enemy in bloodbind", "combatlog")
				if(src.binded)
					src << output("[src]: Jashin circle: you curently have [src.binded] in bloodbind", "combatlog")
					for(var/obj/triggerable/bloodcircle/T in world)
						if(T.owner==src)
							del(T)
					var/obj/triggerable/bloodcircle/T = new/obj/triggerable/bloodcircle(locate(src.x,src.y,src.z))
					T.owner=src
					src.incircle=0
					src.icon='jashin.dmi'
					sleep(600)
					del(T)
					src.Affirm_Icon()
					src.incircle=0
					src.binded=""
					src<<output("The contract ends..", "combatlog")
				else
					src<<output("You have no one in bloodbind..", "combatlog")


			if("Self_Harm")
				if(src.incircle&&src.binded)
					var/mob/D=src.binded
					src << output("[src]:Self-Harm ", "combatlog")
					flick("self harm",src)
					Blood(src.x,src.y,src.z)
					Blood(D.x,D.y,D.z)
					D.Dec_health(50,src,"Self_Harm")
					src.Dec_life(10,src,"Self_Harm")
					D.Dec_life(10,src,"Self_Harm")
					D<<output("you took 10 life from [src]'s blood bind..", "combatlog")
					src<<output("gave 10 life damage to [D] with blood bind..", "combatlog")
					return
				else
					src<<output("You have no one in bloodbind or are not in your circle..", "combatlog")


			if("Self_Heal")
				if(!src.binded)
					if(src.life>=100)
						src<<output("Your at full life..", "combatlog")
						return
					src << output("[src]:Self-Heal ", "combatlog")
					flick("heal",src)
					src.life+=5
					src.canregen=1
					spawn() src.regeneration()
					return
				src<<output("Cant heal yourself while you have someone in bind..", "combatlog")


			if("Immortal")
				if(src.canimmortal)
					if(src.inmortal)
						return
					src << output("[src]:Immortal ", "combatlog")
					src.canimmortal=0
					src.inmortal=1
					src.life+=250
					sleep(2500)
					src.Dec_life(250,src,"Immortal")
					src.Affirm_Icon()
					src.canimmortal=1
					src.inmortal=0
					src<<output("Your immortality wears off..", "combatlog")
				else
					src<<output("Can only go immortal every 2500 seconds..", "combatlog")




