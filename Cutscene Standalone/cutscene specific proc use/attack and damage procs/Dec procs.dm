//////////////cutscene specific

mob
	proc
		attackzc()
			for(var/mob/M in range(1,src))
				if(M)
					M.Dec_health(90,src,"Taijutsu")// use Dec_health boi



//////////////////////////////////////////////////////////////////////////////
		Dec_health(x,mob/attker,jname) //always pass all damaging effects through here, then defensive abilities can edit the x value
			attker.firstattack=1

