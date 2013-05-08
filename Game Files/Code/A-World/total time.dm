mob
	var
		tmp/logintime
		totaltime
	verb
		Time_Played()
			set category = "Character Management"
			var/totalplay=world.time-usr.logintime
			totalplay+=usr.totaltime
			var/secs=round(totalplay/10)
			var/mins=round(secs/60)
			secs-=mins*60
			var/hours=round(mins/60)
			mins-=hours*60
			var/days=round(hours/24)
			hours-=days*24
			src<<"<font color=green><small>You have been playing for [days] Days, [hours] Hours, [mins] Minutes, and [secs] Seconds.."


