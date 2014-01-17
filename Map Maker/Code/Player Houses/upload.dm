
///////////SAO Admins/////////////////
var/debugmode=0//to find bugs.

var/port=2100//7886
var/addr="162.243.0.54"

//Server hosted at 192.168.1.64:6882
///////////////////////////////////////


mob
	verb
		edit()
			set hidden=1
			winshow(src,"serverinfo",1)	//Open the window.
			spawn()
				src.Createmap()
				src.Test()


mob
	verb
		cport()
			set hidden=1
			set category="Debug"
			var/portnew =input("Enter a new port e.g 5553") as num
			port=portnew
			src.Test()


	verb
		caddr()
			set hidden=1
			set category="Debug"
			var/addresnew =input("enter a new adress without e.g 86.164.127.248") as text
			addr="[addresnew]"
			src.Test()




var/tmp/connected=0
mob
	proc
		Test()
			var/p = world.Export("[addr]:[port]#ping")
			if(p&&!connected)
				connected=1
				winset(src,null,{"
				serverinfo.status.text-color = "green";
				serverinfo.status.text = "Connected";
				"})
			else
				winset(src,null,{"
				serverinfo.status.text-color = "red";
				serverinfo.status.text = "Not Connected";
				"})

			return p





mob/verb
	Upload()
		set hidden=1
		savemap()
		if(connected)
			var/savefile/F=new("map_Maps/playerhouses/[src.ckey].txt")
			if(!F)
				Apopup(src,"no file to upload")
				return

			var/p = world.Export("[addr]:[port]?action=playerhouse&key=[src.ckey]",F,1)
			if(!p)
				Apopup(src,"upload failed")
				return // if world not up

			Apopup(src,"file uploaded")


//SERVER

/*

world/Topic(Topic)
	var/list/params = params2list(Topic)
        /** Now contains:
        params["action"] = "playerhouse"
        params["key"] = "rapmaster"
    **/
	switch(params["upload"])
		if("playerhouse")
			var/key = params["key"]
			var/X = world.Import()
			if(X)
				fcopy(X,"Maps/playerhouses/[key].txt")
				return 1
			else
				return 0

	..()

*/




