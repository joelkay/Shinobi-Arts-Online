world/Topic(Topic)//MAIN
	..()
	if(Topic == "ping") return 1
	if(Topic == "version") return text2num(version)
	if(Topic == "autotime") return autotime
	if(Topic == "creation") return creation
	if(Topic == "Host") return Host
	if(Topic == "HostMSG") return HostMSG
	if(Topic == "HostIP") return HostIP
	if(Topic == "People") return players.len
	if(Topic == "maxpeeps") return maxpeeps
	if(Topic == "uptime") return converttime2(world.time)
	if(Topic == "cpu") return world.cpu
	if(Topic == "multi_ip") return multi_ip
	if(Topic == "Update")return


	if(Topic == "log")
		var/savefile/D=file("SAO.log")
		if(fexists(D))
			return world.Export(D)


	if(findtext(Topic,"shout:") == 1)
		world <<  copytext(Topic,7)

	if(findtext(Topic,"action") == 1)
		var/list/params = params2list(Topic)
	     /** Now contains:
	        params["action"] = "playerhouse"
	        params["key"] = "rapmaster"
	    	**/
		switch(params["action"])
			if("playerhouse")
				var/key = params["key"]
				var/savefile/X = new(world.Import())
				if(X)
					fcopy(X,"map_Maps/playerhouses/[key].txt")
					return 1

				else
					return 0




client/Topic(href)//Client Topic
	if(href == "Credits")

		usr << browse(Credits,"window=Updates;[htmlop]")//Browsing The Credits Window

/*	if(href == "Updates")
		usr << browse(Updates,"window=Updates;[htmlop]")//Browsing The Credits Window
*/
	if(href == "Close")
		usr << browse(Close,"window=Updates;[htmlop]")//Closes The Window

	if(href == "Back")
		usr << browse(Main,"window=Updates;[htmlop]")//Browsing The Main Window

	else
		..()
