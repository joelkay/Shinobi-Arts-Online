mob
	var
		AOEkills=0
		taijutsukills=0
		sandkills=0
		summonkills=0
		swordkills=0

	proc/jutsuadd(name)
		switch(name)
			if("AOE")
				src.AOEkills++
			if("Taijutsu")
				src.taijutsukills++
			if("Sand")
				src.sandkills++
			if("Summon")
				src.summonkills++
			if("Sword")
				src.swordkills++
			else
				src.contentscheck(name)

	proc/contentscheck(name)
		for(var/Skill/S in src.contents)
			if(S.sindex==name)// account for the _
				S.kills++

