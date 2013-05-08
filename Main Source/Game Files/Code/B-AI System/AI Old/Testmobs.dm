proc
	TestMobs(mob/A)
		for(var/client/C in view(20,A))
			if(C) return 1
		return 0// no one around