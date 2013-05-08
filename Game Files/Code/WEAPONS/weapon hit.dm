mob
	var/tmp/canhit=1
	verb
		Swordatk()
			set hidden = 1
			if(usr.life<=0||usr.koed)
				return
			if(src.koed)
				return
			if(src.sworded)
				if(src.swordtype=="none")
					return
				if(src.swordtype=="normal")
					var/mob/D=src.targeted
					if(D)
						src.Facedir(D)
					for(var/mob/M in get_step(src,src.dir))
						if(!M)
							flick("sword",src)
							return
						if(!M.pk&&M.client)//npcs have 0pk so...
							flick("sword",src)
							return
						if(M && src.canhit)
							src.canhit=0
							flick("sword",src)
							Blood(M.x,M.y,M.z)
							var/damage=(src.reflexmain+1000)/2//+50 as an offset.
							var/wounds=(src.reflexmain/100)*1.12
							sleep(20)
							flick("hurt",M)
							M.Dec_life(wounds,src,"Sword")
							M.Dec_health(damage,src,"Sword")// use Dec_health boi
							sleep(5)
							src.canhit=1
						else
							flick("sword",src)
							return

				if(src.swordtype=="KSword")
					var/mob/D=src.targeted
					if(D)
						src.Facedir(D)
					for(var/mob/M in get_step(src,src.dir))
						if(!M)
							flick("sword",src)
							return
						if(!M.pk&&M.client)//npcs have 0pk so...
							flick("sword",src)
							return
						if(M && src.canhit)
							src.canhit=0
							flick("sword",src)
							Blood(M.x,M.y,M.z)
							var/damage=(src.reflexmain+2000)/1.9//+50 as an offset.
							var/wounds=(src.reflexmain/95)/1.11
							sleep(20)
							flick("hurt",M)
							M.Dec_life(wounds,src,"Bone_Sword")
							M.Dec_health(damage,src,"Bone_Sword")// use Dec_health boi
							sleep(5)
							src.canhit=1
						else
							flick("sword",src)
							return