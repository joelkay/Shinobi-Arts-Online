var/multi_ip=0

var/list/Allowed = list("Rapmaster","Jean Sqribe","Tayuya1")//keys allowed to view saves info

mob
	var/tmp/showserverstats=0
	var/tmp/showserverstats2=0
	Stat()
		..()
		if(showserverstats)
			statpanel("Server")
			stat("-=Server Info=-")
			stat("Host:","[HostMSG]")
			stat("Updated:","[date]")
			stat("Created:","[time2text(creation,"Day, Month DD, YYYY at hh:mm:ss")]")
			stat("Uptime:","[converttime2(world.time)]")
			stat("Lag Rate:","[world.cpu]")
			stat("")
			stat("-=Server Auto Save Settings=-")
			var/a=autotime/100
			stat("Auto save:","every:[a] minutes")
			stat("")
			stat("-=Server Settings=-")
			if(Open == 1)
				stat("Server Status:","Open")
			if(Open == 0)
				stat("Server Status:","Closed")
			if(multi_ip)
				stat("Same Computer Multi-Ip:","Open")
			stat("Players:","[players.len]/[maxpeeps]")
			stat("<b>Version:","[version]")

		if(showserverstats2)//To check saves
			stat("----------------------------------------------")
			stat("----------------SAVES-------------------------")
			stat("----------------------------------------------")
			var/counter = 0
			var/filelist = flist("Savefiles/")
			var/i = 1
			for(i , i <= length(filelist), i++)
				counter++
			stat("Savefiles count",counter)
			var/counters = 0
			var/filelists = flist("Savefiles_backup/")
			var/ii = 1
			for(ii , ii <= length(filelists), ii++)
				counters++
			stat("Savefile backup count",counters)
			stat("Data Server Address","[world.address]:[world.port]")

	verb
		ShowServerInfo()
			set category = "Character Management"
			if(!showserverstats)
				src.showserverstats=1
				if(src.key in Allowed)
					src.showserverstats2=1
					return
			else
				src.showserverstats=0
				src.showserverstats2=0
				return




