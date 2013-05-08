var/version=2.0//version of build

mob
	Stat()
		statpanel("Default")
		if(statpanel("Default"))
			stat("Default.dmi")
			for(var/buildable/DEFAULT/D in contents)
				stat("",D)

		statpanel("Hideout")
		if(statpanel("Hideout"))
			stat("Soundbase.dmi")
			for(var/buildable/HIDEOUT/H in contents)
				stat("",H)

		statpanel("Hideout32")
		if(statpanel("Hideout32"))
			stat("Hideout.dmi")
			for(var/buildable/HIDEOUT32/H in contents)
				stat("",H)

		statpanel("Flooring")
		if(statpanel("Flooring"))
			stat("flooring.dmi")
			for(var/buildable/FLOORING/H in contents)
				stat("",H)

		statpanel("Mountains32")
		if(statpanel("Mountains32"))
			stat("Mountains32.dmi")
			for(var/buildable/MOUNTAINS32/H in contents)
				stat("",H)

		statpanel("Trees")
		if(statpanel("Trees"))
			stat("trees.png")
			for(var/buildable/TREES/H in contents)
				stat("",H)


		statpanel("Snow")
		if(statpanel("Snow"))
			stat("snow.dmi")
			for(var/buildable/SNOW/H in contents)
				stat("",H)