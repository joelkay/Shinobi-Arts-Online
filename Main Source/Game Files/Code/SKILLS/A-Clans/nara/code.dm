mob
	proc/Skillnara(n)
		switch(n)
//////////////////////NARA//////////////////

			if("Shadow_possesion")
				var/mob/M=src.targeted
				if(!M)
					src << output("[src]: Target someone first...", "combatlog")
					ReturnPrice("Shadow_possesion")
					return

				if(M in range(50,src))
					src << output("[src]: Shadow_possesion No jutsu", "combatlog")
					src.canmove=0
					src << output("[src]: Shadow_possesion No jutsu..", "combatlog")
					//var/obj/O = new /obj/shadowhit
					//src.underlays+=O
					var/obj/shadow/A=new/obj/shadow
					A.loc=src.loc
					A.dir=src.dir
					A.owner=src
					walk_towards(A,M,1)//speed of 1 tick per second

				else
					src << output("[src]: Target not in range...", "combatlog")
					ReturnPrice("Shadow_possesion")
					return



			if("Shadow_possesion_Cancel")
				src << output("[src]: Shadow_possesion CanceL", "combatlog")
				src.canmove=1
				src.canregen=1
				spawn() src.regeneration()
				src.doing=0
				src.shadowout=0
				src.shadow=0
				src.underlays=null

				for(var/obj/shadow/D in world)
					if(D.owner==src)
						del(D)
				for(var/obj/shadowtrail/E in world)
					if(E.owner==src)
						del(E)



			//	for(var/obj/shadowtrail2/F in world)
				//	if(F.owner==src)
				//		del(F)


				for(var/mob/M in world)
					if(M.trapper==src)
						M.canmove=1
						M.trapped=0
						M.doing=0//can do jutsus
						M.canregen=1
						spawn() M.regeneration()
						M.trapper=null
						M.underlays=null
						var/bind2 = image('shadow.dmi',icon_state = "needlecapture")
						M.overlays-=bind2
						var/bind = image('shadow.dmi',icon_state = "needle")
						M.overlays-=bind

				src.shadowdrain()



			if("Shadow_NeckBind")
				var/mob/M=src.targeted
				if(!M||!M.trapper)return
				if(M.trapper==src&&M in view(src.loc))
					src << output("[src]: Shadown NeckBind", "combatlog")
					var/damage=550+((src.chakraforcemain/3)*5)
					if(damage<300)//incase it sucks
						damage=300
					var/bind = image('shadow.dmi',icon_state = "neckbind")
					M.overlays+=bind
					M.Dec_health(damage,src,"Shadow_NeckBind")// use Dec_health boi
					sleep(12)
					M.overlays-=bind


			if("Shadow_Needles")
				var/mob/M=src.targeted
				if(M.trapper==src&&M in view(src.loc))
					src << output("[src]: Shadown Needles", "combatlog")
					var/damage=25+((src.chakraforcemain/5)*35)
					if(damage<30)//incase it sucks
						damage=30
					var/bind = image('shadow.dmi',icon_state = "needle")
					M.overlays+=bind
					M.Dec_health(damage,src,"Shadow_Needles")// use Dec_health boi
					M.canmove=0
					src.canmove=1
					M.overlays-=bind
					var/bind2 = image('shadow.dmi',icon_state = "needlecapture")
					M.overlays+=bind2
					spawn(80)
						M.overlays-=bind
						M.overlays-=bind2
						M.canmove=1
						src.canmove=1
						src.Skills("Nara","Shadow_possesion_Cancel")
						return

