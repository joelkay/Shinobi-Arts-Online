/*
client/New()
	sleep(18)
		src<<"<B><FONT SIZE = 2><FONT COLOR = Red>Guarded by Rapmaster's Lag Guard (v6.0)"
	..()
*/ //hahahahahahaahah no


world
	New()
		..()
		Lag_Guard()

//GM Command for custom CPU level
mob/Host
	verb
		LG_Set()
			set name = "Set LG"
			set category = "Host"
			var/LGSet = input("What CPU usage do you want Lag Guard to go into effect? (1-100)") as num|null
			if(LGSet > 100)
				LGSet = 100
			if(LGSet < 1)
				LGSet = 1
			lagset = 1
			clag = LGSet
			NPCDELAY = LGSet/10+3
			src<<"Option set.."



var/tmp/def = 40
var/tmp/lagset = 0
var/tmp/clag = 0
var/tmp/tick_mem

world
	proc
		Lag_Guard()
			set background = 1
			while(1)
				sleep(10)
				if(!lagset)
					if(world.cpu >= def)
						world.tick_lag ++
						world.tick_lag = round(world.tick_lag)
						tick_mem = world.tick_lag
						spawn() check()

					else
						if(world.tick_lag<=2)return
						world.tick_lag --
						world.tick_lag = round(world.tick_lag)
						tick_mem = world.tick_lag
						spawn() check()

				else
					if(world.cpu >= clag)
						world.tick_lag ++
						world.tick_lag = round(world.tick_lag)
						spawn() check()

					else
						if(world.tick_lag<=2)return
						world.tick_lag --
						world.tick_lag = round(world.tick_lag)
						tick_mem = world.tick_lag
						spawn() check()





world
	proc
		check()
			if(world.cpu >= 95)
				spawn() effect()
			if(world.tick_lag >= 30)
				spawn() effect()

		effect()
			set background = 1
			world<<"<b><i><font face=arial><font color=red><font size=4>AUTO-REBOOT INITIATED.."
			sleep(25)
			world<<"<b><i><font face=arial><font color=red><font size=4>SERVER REBOOTING IN 3 SECONDS!!"
			sleep(10)
			world<<"<b><i><font face=arial><font color=red><font size=4>SERVER REBOOTING IN 2 SECONDS!!"
			sleep(10)
			world<<"<b><i><font face=arial><font color=red><font size=4>SERVER REBOOTING IN 1 SECOND!!"
			sleep(10)
			world<<"<b><i><font face=arial><font color=red><font size=4>SERVER REBOOTING!"
			for(var/client/c in players)
				var/mob/M=c.mob
				M<<"<B><font color = green>Info:</B></FONT> <FONT COLOR = RED>Auto-Save initated.."
				M.Save()
				M<<"<B><font color = green>Info:</B></FONT> <FONT COLOR = RED>Auto-Save complete.."

			sleep(15)
			world.Reboot()






