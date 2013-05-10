mob
	var
		Sharinganon=0
		sharidel=0//for deleting old sharingans in skill list
		Skill/copied
		Skill/cache


proc
	sharicopy(mob/M,Skill/S)
		if(!M.Sharinganon)
			return
		M<<output("<font color=red>'Sharingan-copy' - press Z to remember [S.name], you have 5 seconds to do this", "combatlog")
		M.cache=S.duplicate()//duplicate it so they dont share cds with the owner
		spawn(50)
			M.cache=null//empty the cache


mob
	verb
		sharicoped()
			set hidden = 1
			if(!src.Sharinganon)
				return

			if(!cache)
				return

			/*
			for(var/Skill/S in contents)
				if(S.sindex==cache.sindex)
					src<<output("<font color=red>'Sharingancopy':You already own [cache.name]", "combatlog")
					return

			*///I will activate this later, but since everyone has all skills they can have fun with it off xD


			copied=cache


			src.overlays+='shariCopy.dmi'

			src<<output("<font color=red>'Sharingancopy'-Remembered [copied.name]", "combatlog")

			if(copied)
				for(var/Skill/S in contents)
					if(S.sindex=="Sharingancopy")
						S.icon=copied.icon
						S.icon_state=copied.icon_state
						S.chakracost=copied.chakracost
						S.cooldown=copied.cooldown
						S.maxcooldown=copied.maxcooldown
						S.overlays+=image('shariCopy.dmi')

						for(var/obj/Macros/M in src.client.screen)
							if(M.copied==S.type)
								M.overlays+=image('skills.dmi',icon_state = copied.icon_state)
								M.overlays+=image('shariCopy.dmi')


			src.overlays-='shariCopy.dmi'




mob
	proc
		removesharingan()
			src.chidorivalue=0
			src.copied=null
			for(var/obj/Sharingana/A in src.client.screen)
				del(A)
			for(var/obj/Sharinganb/B in src.client.screen)
				del(B)
			for(var/obj/Sharinganc/C in src.client.screen)
				del(C)

			src.reflexplus=0
			src.resistanceplus=0
			src.Sharinganon=0

			for(var/Skill/S in contents)
				if(S.sindex=="Sharingancopy")
					S.icon='skills.dmi'
					S.icon_state="Sharingancopy"
					S.chakracost=50
					S.cooldown=60
					S.maxcooldown=60
					S.overlays=null

					for(var/obj/Macros/M in src.client.screen)
						if(M.copied==S.type)
							M.overlays=null//clear them
							M.overlays+=image('skills.dmi',icon_state = S.icon_state)//restore to default

