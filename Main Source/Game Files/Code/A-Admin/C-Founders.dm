proc/FounderStuff(mob/M)
	set background=1

	if(text2num(version)<1)
		var/Founder=isFounder(M)

		if(Founder)//if they are a founder
			if(debug)alert(M,"You are a Founder")
			return

		if(!Founder)
			spawn()
			if(setFounder(M,1))//if they arent a founder and they logged into version 0.1 -> 0.2
				alert(M,"Thanks for playing the alpha version. This key has been given Founder status. You will recieve a free gift in a later version")
	//else hand out the GOODIES