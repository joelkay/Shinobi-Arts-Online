mob/NPC
	var/inloop=0
	proc
		Aggro() //always pass all damaging effects through here, then defensive abilities can edit the x value
			src.action="ATTACK"//first iteration
			attackloop()//attack ffs




