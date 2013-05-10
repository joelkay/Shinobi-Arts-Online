mob
	proc/Skillbasic(b)
		switch(b)

///////////////BASE///////////////////////////
			if("Body_Replacement_Technique")
				src << output("[src]: Body_Replacement_Technique no-Jutsu!", "combatlog")
				src.kawax=0//map change makes these 0
				src.kaway=0
				src<<output("You have set your Body_Replacement_Technique location. when you are attacked, you will return to this location this jutsu lasts 150 seconds..", "combatlog")
				src.kawax=src.x
				src.kaway=src.y
				src.kawaz=src.z
				src.kawad=1
				if(src.client)
					src.client.screen+=new/obj/Body_Replacement_Technique
				sleep(600)//60 secs?
				src.kawax=0
				src.kaway=0
				src.kawad=0
				if(src.client)
					for(var/obj/Body_Replacement_Technique/A in src.client.screen)
						del(A)
				return


			if("Body_Flicker")
				if(src.inshunsh)return
				var/mob/M=src.targeted

				if(M)
					src.Facedir(M)//help to direct them :p

				src.inshunsh=1
				src.overlays+='Shunshin.dmi'
				src.shuncharge()
				src<<output("You begin to dash at high speed", "combatlog")


			if("Transformation_Technique")
				var/t=src.icon
				o = src.overlays.Copy()
				var/mob/M=src.targeted
				if(!M)
					src<<output("You need to target someone first..", "combatlog")
					return
				src << output("[src]: Transformation_Technique no-Jutsu!", "combatlog")
				src.savedi=t
			//	src.copyname=src.name
			//	src.name=M.name
				flick('smoke.dmi',src)
				src.icon=M.icon
				src.overlays = src.overlays.Remove(src.overlays)
				src.overlays = M.overlays
				src.Transformation_Techniqued=1
				src<<output("Press L to revert to yourself", "combatlog")


			if("Shadow_Clone")
				src << output("[src]: Shadow_Clone no-Jutsu!", "combatlog")
				src.KillShadow_Clone()
				var/mob/NPC/Shadow_Clone/A = new /mob/NPC/Shadow_Clone
				A.icon=src.icon
				A.overlays = src.overlays
				A.dir = src.dir
				A.owner = src
				A.name = src.name
				A.Village = src.Village
				A.name=src.name
				A.loc = locate(src.x, src.y-1, src.z)
				flick('smoke2.dmi',A)

				for(var/mob/M in view(src))
					if(M.targeted == src)
						var/image/I = image('selected.dmi',A,"",999) // create a new target on the source. layer 999
						M<<I // make it so they can see the target
				//A.Load_Overlays()// loads it all
				//A.Affirm_Icon()// loads it all