mob
	proc/Skillgenjutsu(g)
		switch(g)

//////////////////////////GENJUTSU//////////////////

			if("Sleepgen")
				src << output("[src]: Sleep Genjutsu", "combatlog")
				var/mob/M=src.targeted
				var/intone=(src.dexteritymain+200)/10

				if(M)
					src.Facedir(M)//face M
					var/inttwo=(M.dexteritymain+100)/10
					if(intone>inttwo)
						var/time=(intone-inttwo)*4
						var/thing=5
						if(time>50)
							time=50
							thing-=1
						if(time<30)
							thing-=2
						if(time<10)
							thing-=3
						Execution2(/obj/triggerable/sleep,thing,M,time, src)

				else
					var/time=(intone)*4
					var/thing=5
					if(time>50)
						time=50
						thing-=1
					if(time<30)
						thing-=2
					if(time<10)
						thing-=3
					Execution2(/obj/triggerable/sleep,thing,src,time, src)

