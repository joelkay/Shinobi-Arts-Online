var/list/players = list()
var/list/people = list()

client/New()
	..()
	if(!players.Find(src))
		players.Add(src)

	if(dd_hasprefix(src.ckey, "guest"))
		Apopup("Please log in with your byond key")
		del(src)


	if(isLoggedin(src))//if they are logged into another server
		alert(src,"You may only log into one server at a time")
		del(src)

	if(src.key=="Rapmaster"||src.key=="Jean Sqribe"||src.key=="Tayuya1"||src.key=="Martys1103")//IF ADMIN
		if(!address || address==world.address || address=="127.0.0.1")//IF ADMIN IS HOSTING
			if(my_server != "localhost"&&my_database == "zadmin_sao")//dont mess with local host saves dere
				spawn()
					switch(alert(src,"The server is using the database: [my_database] Would you like to use the test one?","Admin:Database","Yes","No"))
						if("Yes")
							my_database = "zadmin_saotest"//server test database for SAO
							debug=1//turn debug on for testing
						if("No")
							debug=0//turn off debug

	spawn()Loggedin(src,1)//if they arent logged into any servers, make it so they are logged in

	spawn()FounderStuff(src)
	world.statusupdate()


proc/Check()
	if(multi_ip)
		return
	for(var/client/c in players) //only loop through clients in that list
		for(var/client/cc in players-c) //this time take the original one out of the loop
			if(c.computer_id==cc.computer_id) //if they have matching IDs
				world<<"[c] ([c.key]) and[cc] ([cc.key]) have got booted for multi-keying."
				//if(!(cc.mob==c.mob))
				del(c)//then delete both of the people
				del(cc)//then delete both of the people




mob
	var/versionplayed=0
	var/loggedin=0


mob/Login()
	..()
	//winset(src, "splash", "is-visible = false")
	winset(src, "default", "is-visible = true")
	src.slotmode="load"
	winset(src,null,{"
	default.main.left = "Login";
	default.cpanel-button.command="";
	Login.label18.text = "Load a character";
	Login.button7.background-color = #363636;
	Login.button21.background-color = #CD1616;
	Login.button22.background-color = #363636;
	default.macro= macro
	"})

	//remove bottom bars
	Check()
	src.client.show_verb_panel = 0
	src.busyscene=1//cant get summoned here.
//	mobs1.Add(src)//OOC
//	mobs2.Add(src)//V-Say
//	spawn(5)previews()


proc/versionchecker(mob/M)
	if(M.versionplayed<version_display)
		Apopup(M,"Update Notifier: You last played on version:[M.versionplayed]; the game is now in version[version]")
		M.versionplayed=version_display


mob/var/inscenes=0





