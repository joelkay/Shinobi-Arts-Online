//client/preload_rsc = "https://dl.dropbox.com/u/3010721/SAO/SAO_rsc.zip" forcing users to download the rsc
//making it default to 1 so that clients are forced to download rsx
client/perspective=EDGE_PERSPECTIVE
world
	name = "Shinobi Arts Online"
	status = "version 1"
	hub = "JeanSqribe.ShinobiArtsOnline"
	hub_password = "naz4"   //password for live game authentication
	//hub_password= "password for your game"
	//tick_lag = 1
	loop_checks = 1 //dont ever touch this <-lol -.- they were right T_T
	sleep_offline = 1 //when no players on
	map_format=TOPDOWN_MAP
	//mob=/mob
	//fps=30



var/autotime=600//auto saves every 6 mnutes
var/date = "Sunday,November 07,2010"//last update

world
	Reboot()
		..()

world
	New()
		..()
		world.name = "Shinobi Arts Online"
		world.status = {"<font color="blue"><b>Hosted by:[HostMSG],Version:[version_display]</b></font>"}
		spawn()
			econom()
			autoreeb()

///HOST VARZ///

var						//-- Universal Variables
	creation = "unknown"		//-- Server Birth
	Host = "SAO Cloud"	//-- The Host			(Default = "unknown".)
	HostMSG = "SAO Cloud"	//-- The Host Key		(Default = "Unknown".)
	HostIP = "127.0.0.1"	//-- The Host's IP		(Default = 127.0.0.1.)
	tmp/list/Guys =list()			//-- Number of Players	(Default = 0.)
	tmp/People
	Open = 1			//-- Server is Open		(1 = Yes, 0 = No)			//-- Cuss Filters		(1 = On, 0 = Off)
	maxpeeps = 20		//-- Maximum Players	(Default = 20 players.)
	gonnadie = 0
var/list/SOS = list("") //-- SOS List



//FOR SERVERS////////////////////////

var/port=21000//7886
var/addr="199.175.49.236"
var/portd

//////////////////////////////////////



//////////////////////////AUTO HANDLING

proc
	autoreeb()
		set background=1
		while(1)
			sleep(180000)//24 hours then reboot
			for(var/client/c in players)
				var/mob/M=c.mob
				spawn() M.Save()
				M<<"World is having an automatic reboot.."
				M<<"Your character has been succesfully saved.."

			world.Reboot()


