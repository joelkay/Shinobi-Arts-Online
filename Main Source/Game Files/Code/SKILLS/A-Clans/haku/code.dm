mob
	proc/Skillhaku(h)
		switch(h)



/////////////HAKU////////////////////////////////////
			if("ice_needles")
				var/list/tiles=list()
				for(var/obj/WATER/F in range(10,src))
					tiles.Add(F)
				if(tiles.len>0)
					var/turf/F=pick(tiles)
					F.overlays+='giveice.dmi'
					var/mob/M=src.targeted
					sleep(10)
					if(F) F.overlays-='giveice.dmi'
					if(M in range(10,src))
						src.Facedir(M)//face M
						var/obj/iceneedle/A=new/obj/iceneedle
						A.loc=F.loc
						A.dir=src.dir
						A.owner=src
						walk_towards(A,M,2)
						sleep(40)
						del(A)
						return

					var/obj/iceneedle/A=new/obj/iceneedle
					A.loc=F.loc
					A.dir=src.dir
					A.owner=src
					walk(A,src.dir,2)
					sleep(40)
					del(A)
					return
				else
					src<<output("You must be near a water source to use this jutsu..", "combatlog")
					ReturnPrice("ice_needles")//proc to make it so you can use the skill again
					return


			if("ice_mirrors")
				var/list/tiles=list()
				for(var/obj/WATER/F in range(10,src))
					tiles.Add(F)
				if(tiles.len>0)
					var/turf/F=pick(tiles)
					F.overlays+='giveice.dmi'
					var/mob/M=src.targeted
					sleep(10)
					if(F) F.overlays-='giveice.dmi'
					if(M in range(15,src))
						src.Facedir(M)//face M
						var/obj/mirrorbump/A=new/obj/mirrorbump
						A.loc=F.loc
						A.dir=src.dir
						A.owner=src
						if(M)walk_towards(A,M,2)
						return

				else
					src<<output("Target someone to use ice mirrors..", "combatlog")
					ReturnPrice("ice_mirrors")//proc to make it so you can use the skill again



			if("ice_freeze")
				var/list/tiles=list()
				for(var/obj/WATER/F in range(5,src))
					tiles.Add(F)
				if(tiles.len>0)
					var/turf/F=pick(tiles)
					F.overlays+='giveice.dmi'
					var/mob/M=src.targeted
					if(M in range(1,src))
						M.canmove=0
						M.doing=1
						M.overlays+='freeze.dmi'
						sleep(10)
						if(F) F.overlays-='giveice.dmi'
						M<<output("your trapped in [src]'s ice freeze..", "combatlog")
						sleep(100)
						M.canmove=1
						M.doing=0
						M.overlays-='freeze.dmi'
						return
					else
						F.overlays-='giveice.dmi'
						src<<output("Target someone to use this jutsu..", "combatlog")
						return

				else
					src<<output("you must be near a water source..", "combatlog")
					ReturnPrice("ice_freeze")//proc to make it so you can use the skill again

