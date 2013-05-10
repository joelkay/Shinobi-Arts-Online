mob
	proc/Skillgates(g)
		switch(g)

//////////////////GATES///////////////////////////////////////////////////////////////

			if("Gate1")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				if(!src.cangate)
					return
				view() << output("[src] activates the first gate", "combatlog")
				src.cangate2=1//
				src.overlays+='gate1.dmi'
				src.reflexplus+=10
				src.strengthplus+=10
				src.health+=2000//2k + health
				src.gateson=1
				sleep(500)
				src.gateson=0
				src.diffgate=0
				if(src.diffgate)
					return
				if(src.lee)
					src.Dec_life(0,src,"Gate1")
				else
					src.Dec_life(5,src,"Gate1")
				src.Death(src)
				src << output("[src] is fatigued by the gate", "combatlog")
				src.icon_state=""
				src.overlays-='gate1.dmi'
				src.reflexplus-=10
				if(src.reflexplus<0)
					src.reflexplus=0
				src.strengthplus-=10
				if(src.strengthplus<0)
					src.strengthplus=0

				sleep(400)
				src.cangate=1

			if("Gate2")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				if(!src.cangate2)
					return
				view() << output("[src] activates the second gate", "combatlog")
				src.cangate3=1
				src.overlays+='gate2.dmi'
				sleep(30)
				src.diffgate=1
				src.reflexplus+=20
				src.strengthplus+=20
				src.health+=2500//2.5k + health
				src.diffgate2=0
				src.gateson=1
				sleep(500)
				src.gateson=0
				if(src.diffgate2)
					return
				if(src.lee)
					src.Dec_life(5,src,"Gate2")
				else
					src.Dec_life(10,src,"Gate2")
				src.Death(src)
				src << output("[src] is fatigued by the gate", "combatlog")
				src.icon_state=""
				src.overlays-='gate1.dmi'
				src.reflexplus-=30//1 & 2
				if(src.reflexplus<0)
					src.reflexplus=0
				src.strengthplus-=30
				if(src.strengthplus<0)
					src.strengthplus=0
				sleep(400)
				src.cangate2=1

			if("Gate3")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				if(!src.cangate3)
					return
				view() << output("[src] activates the third gate", "combatlog")
				src.cangate4=1
				src.overlays+='gate3.dmi'
				sleep(30)
				src.overlays-='gate3.dmi'
				src.diffgate2=1
				src.reflexplus+=30
				src.strengthplus+=30
				src.health+=3000//3k + health
				src.diffgate3=0
				src.gateson=1
				sleep(500)
				src.gateson=0
				if(src.diffgate3)
					return
				if(src.lee)
					src.Dec_life(10,src,"Gate3")
				else
					src.Dec_life(20,src,"Gate3")
				src.Death(src)
				src << output("[src] is fatigued by the gate", "combatlog")
				src.icon_state=""
				src.overlays-='gate1.dmi'
				src.reflexplus-=60
				if(src.reflexplus<0)
					src.reflexplus=0
				src.strengthplus-=60
				if(src.strengthplus<0)
					src.strengthplus=0

				sleep(400)
				src.cangate3=1

			if("Gate4")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				if(!src.cangate4)
					return
				view() << output("[src] activates the fourth gate", "combatlog")
				src.cangate5=1
				src.overlays+='gate4.dmi'
				src.icon='gatez.dmi'
				src.overlays-='gate4.dmi'
				src.diffgate3=1
				src.reflexplus+=40
				src.strengthplus+=40
				src.health+=3000//3k + health
				src.diffgate4=0
				src.teleattack=1
				src.gateson=1
				sleep(500)
				src.teleattack=0
				src.gateson=0
				if(src.diffgate4)
					return
				if(src.lee)
					src.Dec_life(15,src,"Gate4")
				else
					src.Dec_life(30,src,"Gate4")
				src.Death(src)
				src << output("[src] is fatigued by the gate", "combatlog")
				src.icon_state=""
				src.Affirm_Icon()
				src.overlays-='gate1.dmi'
				src.reflexplus-=100
				if(src.reflexplus<0)
					src.reflexplus=0
				src.strengthplus-=100
				if(src.strengthplus<0)
					src.strengthplus=0

				sleep(400)
				src.cangate4=1

			if("Gate5")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				if(!src.cangate5)
					return
				view() << output("[src] activates the last gate", "combatlog")
				src.overlays+='gate5.dmi'
				sleep(15)
				src.overlays-='gate5.dmi'
				src.diffgate4=1
				src.reflexplus+=50
				src.strengthplus+=50
				src.teleattack=1
				src.gateson=1
				src.health+=5000//5k + health
				sleep(500)
				src.teleattack=0
				if(src.lee)
					src.Dec_life(20,src,"Gate5")
				else
					src.Dec_life(40,src,"Gate5")
				src.Death(src)
				src << output("[src] is fatigued by the gate", "combatlog")
				src.icon_state=""
				src.Affirm_Icon()
				src.overlays-='gate5.dmi'
				src.overlays-='gate2.dmi'
				src.reflexplus-=150
				if(src.reflexplus<0)
					src.reflexplus=0
				src.strengthplus-=150
				if(src.strengthplus<0)
					src.strengthplus=0
				sleep(400)
				src.cangate5=1

			if("GateCancel")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				view() << output("[src] cancels out the gates", "combatlog")
				src.icon_state=""
				src.overlays-='gate1.dmi'
				src.overlays-='gate2.dmi'
				src.overlays-='gate3.dmi'
				src.overlays-='gate4.dmi'
				src.overlays-='gate5.dmi'
				src.icon_state=""
				src.Affirm_Icon()
				src.cangate=1
				src.cangate2=0
				src.cangate3=0
				src.cangate4=0
				src.cangate5=0
				src.overlays-='gate1.dmi'
				src.gateson=0



			if("Lotus")

				rem="Lotus"//shari_copy
				nem=200//cost of Chamber_of_Nothingness
				sharicopy(src)
				//////////////////////////////////////////////////////////
				src.seals()
				src << output("[src] loosens his bandages and prepares for a high flying taijutsu move", "combatlog")
				src.overlays+='goalioncombo.dmi'
				sleep(20)//2 secs to get
				src.overlays-='goalioncombo.dmi'
				src.icon_state=""
				for(var/mob/M in get_step(src,src.dir))
					if(M)
						src.Facedir(M)
						var/damage = round(src.strengthmain*rand(2,4))
						M.combloc=locate(M.x,M.y,M.z)//save this spot
						src.canmove=0
						src.doing=1
						M.doing=1
						M.canmove=0
						src.dir=SOUTH
						M.dir=SOUTH
						M.loc = locate(src.x,src.y-1,src.z)//below src
						//M.incombo=1
						src.loc=M.loc
						M.loc = locate(src.x,src.y+1,src.z)//tiles to go up
						src.loc=M.loc
						src.icon_state="lioncombatker"
						M.icon_state="lioncombdefender"
						M.loc = locate(src.x,src.y+1,src.z)//tiles to go up
						src.loc=locate(M.x,M.y-1,M.z)//tiles to go up
						spawn(19)
							M.loc = locate(src.x,src.y+2,src.z)//tiles to go up
							src.loc=M.loc
						spawn(42)
							M.loc=M.combloc//take them back
							src.loc = locate(M.x,M.y+1,M.z)
						spawn(46)//wait for animation
							M.icon_state=""
							src.icon_state=""//refresh states
							src.canmove=1
							M.canmove=1
							src.doing=0
							M.doing=0
							sleep(10)
							M.Dec_health(damage,src,"Lotus")


