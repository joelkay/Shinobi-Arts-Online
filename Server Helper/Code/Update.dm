///HOST VARZ///
var/version="{Alpha} 0.4"
var/autotime=600//auto saves every 6 mnutes
var/date = "Sunday,November 07,2010"//last update
var/cpu=0
var/uptime=0
var/maptime=0
var						//-- Universal Variables
	creation = "unknown"		//-- Server Birth
	Host = "unknown"	//-- The Host			(Default = "unknown".)
	HostMSG = "Unknown"	//-- The Host Key		(Default = "Unknown".)
	HostIP = "127.0.0.1"	//-- The Host's IP		(Default = 127.0.0.1.)
	tmp/People
	Open = 1			//-- Server is Open		(1 = Yes, 0 = No)			//-- Cuss Filters		(1 = On, 0 = Off)
	maxpeeps = 20		//-- Maximum Players	(Default = 20 players.)
	gonnadie = 0

var/list/Players=list()
var/multi_ip=0
var/showserverstats2=0//unneeded




proc
	Update()
		var/p = world.Export("[addr]:[port]#ping",null,1)
		if(!p) return // if world not up
		var/a = world.Export("[addr]:[port]#version",null,1)
		version=a
		var/b = world.Export("[addr]:[port]#maptime",null,1)
		maptime=b
		var/d = world.Export("[addr]:[port]#creation",null,1)
		creation=d
		var/e = world.Export("[addr]:[port]#Host",null,1)
		Host=e
		var/f = world.Export("[addr]:[port]#HostMSG",null,1)
		HostMSG=f
		var/g = world.Export("[addr]:[port]#HostIP",null,1)
		HostIP=g
		var/h = world.Export("[addr]:[port]#People",null,1)
		People=h
		var/i = world.Export("[addr]:[port]#maxpeeps",null,1)
		maxpeeps=i
		var/j = world.Export("[addr]:[port]#uptime",null,1)
		uptime=j
		var/k = world.Export("[addr]:[port]#cpu",null,1)
		cpu=k
		var/l = world.Export("[addr]:[port]#multi_ip",null,1)
		multi_ip=l



	AutoUpdate()
		set background=1
		while(1)
			sleep(10)
			Update()



mob
	Stat()
		statpanel("Main Server")
		stat("-=Server Info=-")
		stat("Host:","[HostMSG]")
		stat("Updated:","[date]")
		stat("Created:","[time2text(creation,"Day, Month DD, YYYY at hh:mm:ss")]")
		stat("Uptime:","[uptime]")
		stat("Lag Rate:","[cpu]")
		stat("")
		stat("-=Server Auto Save Settings=-")
		stat("Map delete:","every:[maptime] minutes")
		stat("")
		stat("-=Server Settings=-")
		if(Open == 1)
			stat("Server Status:","Open")
		if(Open == 0)
			stat("Server Status:","Closed")
		if(multi_ip)
			stat("Same Computer Multi-Ip:","Open")
		stat("Players:","[People]/[maxpeeps]")
		stat("<b>Version:","[version]")



		if(showserverstats2)//To check saves
			stat("----------------------------------------------")
			stat("----------------SAVES-------------------------")
			stat("----------------------------------------------")
			var/counter = 0
			var/filelist = flist("SAO_HOST_FILES/Playersnew/")
			var/i = 1
			for(i , i <= length(filelist), i++)
				counter++
			stat("Savefiles count",counter)
			var/counters = 0
			var/filelists = flist("SAO_HOST_FILES/Playersnew_backup/")
			var/ii = 1
			for(ii , ii <= length(filelists), ii++)
				counters++
			stat("Savefile backup count",counters)
			stat("Data Server Address","[addr]:[port]")







