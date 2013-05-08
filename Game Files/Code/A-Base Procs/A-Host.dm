world
	New()
		..()
		if(world.address==my_serverip||world.port==my_port)//dont change the local server
			world.log << text("The local server has been initiated")

		else
			my_server="178.175.140.206"
			world.log << text("The server adress has been changed to the remote value")


mob/proc/InitiateHost()
	if(!src.client.address || src.client.address==world.address || src.client.address=="127.0.0.1")
		Host = "[src.ckey]"
		HostMSG = "[src.key]"
		src<<"<b>Initiating host verbs..</b>."
		//src<<"<b>If you dont set the port, players may not be able to connect to save server..</b>"
		sleep(3)
		//if(!mainserver)
			//if(!portd)
				//portd = input(usr,"Which port is this server hosted on?","Which port?") as num
		src.verbs += typesof(/mob/Host/verb)
		return


mob/Host/verb
	MySQL_Server()
		set category = "Host"
		set name = "MySQL_Server"
		if(my_server == "localhost")
			my_server="178.175.140.206"
			Apopup(src,"The server adress has been changed to: Remote Server!")

		else
			Apopup(src,"The server adress has already been configured : Remote Server!")


	Shutdown_Server()
		set category = "Host"
		set name = "Shutdown Server"
		set background = 1
		if(gonnadie == 1)
			return 0
		switch(alert(usr,"Are you sure you want to shut down the server?","Shut Down","Yes","No"))
			if("Yes")
				gonnadie = 1
				world<<"<font color=#FFFFC0>[src.name] will be be shutting down the server in 1 minute!."
				sleep(300)
				world<<"<font color=#FFFFC0>The server will be shutting down in 30 seconds!."
				sleep(200)
				world<<"<font color=#FFFFC0>The server will be shutting down in 10 seconds!."
				sleep(50)
				world<<"<font color=#FFFFC0>The server will be shutting down in 5 seconds!."
				sleep(50)
				world<<"<font color=#FFFFC0>The server is now shutting down!."
				del(world)
	Reboot()
		set name="Reboot"
		set desc="Reboots the world."
		set category= "Host"
		set background = 1
		if(gonnadie == 1)
			return 0
		if(alert("Are you sure you want to reboot?","Reboot World.","Yes","No") == "Yes")
			if(alert("Do you want to issue a warning?","Reboot World","Yes","No") == "Yes")
				gonnadie = 1
				world<<"<font color=#FFFFC0>[src.name] will be be rebooting the server in 1 minute!."
				sleep(300)
				world<<"<font color=#FFFFC0>The server will be rebooting in 30 seconds!."
				sleep(200)
				world<<"<font color=#FFFFC0>The server will be rebooting in 10 seconds!."
				sleep(50)
				world<<"<font color=#FFFFC0>The server will be rebooting in 5 seconds!."
				sleep(50)
				world<<"<font color=#FFFFC0>The server is now rebooting!."
			world.Reboot()

	Set_Limits()
		set category="Host"
		set name = "Configure Server"
		set desc = "Allows you to change the server's settings."
		var/list/options = list("Change World Name","Change Host Name","Set Player Limit","Open/Lock Server","Configure Auto-Save Time","Turn on Same Compulter Multi-Ip")//,"Change Server Password")
		switch(input("What limits would you like to configure?","Configure Server") as null|anything in options)
			if("Change World Name")
				var/name = input("What would you like to set the world's name to?","Configure Server","[world.name]") as null|text
				if(!name)
					return 0
				else
					world.name = name

			if("Change Host Name")
				var/name = input("What would you like to set the host's name to? Note that this does not change who is hosting.","Configure Server","[HostMSG]") as null|text
				if(!name)
					return 0
				else
					HostMSG = name

			if("Set Player Limit")
				var/n = input(src,"What would you like to set the maximum number of connections to?","Configure Server",maxpeeps) as null|num
				if(n == null)
					return 0
				if(n >= 999999)
					n = 999999
				if(People > n)
					alert(src,"There are too many players connected at the moment to adjust this setting.","Configure Server")
					return 0
				maxpeeps = n
				world<<"<font color=#FFFFC0>The maximum number of connections has been set to [maxpeeps] people. currently [players.len] people are logged in.."
			if("Open/Lock Server")
				switch(alert("Would you like to open or lock the server?","Configure Server","Open","Lock","Cancel"))
					if("Open")
						Open=1
						world<<"<font color=#FFFFC0>The server is now accepting new connections.."
					if("Lock")
						Open=0
						world<<"<font color=#FFFFC0>The server is no longer accepting new connections.."
					if("Cancel")
						return 0
			if("Configure Auto-Save Time")
				switch(alert("You are about to change auto save time for this server?","Continue","Yes","No"))
					if("Yes")
						var/time = input("What would you like to set the auto-save time to? Note time may not be less than 2 and more than 9.","Configure Save Time","[HostMSG]") as null|num
						if(time<2)
							src<<"[time] is less than 3 :(."
							return 0
						if(time>9)
							src<<"[time] is greater than 9 :(."
							return 0
						else
							autotime=time*100
							src<<"World save time has been changed to every [time] minutes."
					if("No")
						return 0


			if("Turn on Same Compulter Multi-Ip")
				if(!multi_ip)
					multi_ip=1
					world<<"<font color=#FFFFC0>The server is now accepting same computer multi connections.."
				else
					multi_ip=0
					world<<"<font color=#FFFFC0>The server is no longer accepting same computer multi connections.."





//LAGDELAY
//NPCDELAY


proc/converttime2(time)	//-- World Time (By Evidence)
	time = round(world.time/10, 1)
	var/hours = round(time / 3600)
	time %= 3600
	var/minutes = round(time / 60)
	time %= 60
	return "[hours<10? "0":null][hours]:[minutes<10? "0":null][minutes]:[time<10? "0":null][time]"

