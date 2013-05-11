///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
mob/var/legit
mob/var/gitx=0
mob/var/cansql=1
mob/proc/checklegit()

	var/hash = md5("[health],[chakra],[blevel],[salt]")

	var/hash2 = legit
	if(hash2 == hash)
		if(debug)world<<"The savefile is legit [hash2]==[hash]!"// This will be for when people want to upload legit saves to sql
		cansql=1

	else
		//alert("The savefile has been modified [hash2]=/=[hash]!")
		cansql=0
		gitx=1//corrupted file, dont generate new hashes for them anymore?
		spawn() src.ResolveConflict()

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
mob
	Read(var/savefile/F)
		//..()

		var/last_x // var defined
		var/last_y
		var/last_z
		F["last_x"] >> last_x
		F["last_y"] >> last_y
		F["last_z"] >> last_z

		F["legit"] >> legit
		F["gitx"] >> gitx//this is a secret var that turns on when a savefile is shown to be corrupt.
		////PLAYER VARS/////
		F["name"] >> name
		F["rpgname"] >> rpgname
		F["namefirst"] >> namefirst
		F["contents"] >> contents
		F["versionplayed"] >> versionplayed
		F["boughtskills"] >> boughtskills
		///////////team//////////////////////
		F["teamname"] >> teamname

		F["health"] >> health
		F["max_health"] >> max_health
		F["chakra"] >> chakra
		F["max_chakra"] >> max_chakra
		F["energy"] >> energy
		F["max_energy"] >> max_energy
		F["pk"] >> pk
		F["bingo"] >> bingo

		F["life"] >> life
		F["max_life"] >> max_life
		F["exp"] >> exp
		F["maxexp"] >> maxexp

		F["blevel"] >> blevel
		F["contribution"] >> contribution
		F["attribute_Points"] >> attribute_Points

		F["supplies"] >> supplies

		F["killmedalset"] >> killmedalset
		F["dummy"] >> dummy
		F["allowedswitch"] >> allowedswitch

		F["resistance"] >> resistance

		F["resistancemain"] >> resistancemain

		F["chakraforce"] >> chakraforce

		F["chakraforcemain"] >> chakraforcemain

		F["agility"] >> agility

		F["agilitymain"] >> agilitymain

		F["dexterity"] >> dexterity

		F["dexteritymain"] >> dexteritymain//var with added or reduced bonuses

		F["reflex"] >> reflex

		F["reflexmain"] >> reflexmain

		F["strength"] >> strength

		F["strengthmain"] >> strengthmain

		F["attackrate"] >> attackrate
		F["dizzyrate"] >> dizzyrate

		F["totaltime"] >> totaltime//time played
		F["timesaved"] >> timesaved//time saved
		//////////////////PLAYER HOUSES//////////////////////////////////////////////////////
		F["Savedx"] >> Savedx	  //Is used later to record the players X position
		F["Savedy"] >> Savedy	  //Is used later to record the players Y position
		F["Savedz"] >> Savedz	  //Is used later to record the players Z position
		/////////////////////TRAITS////////////////////////////////////////////////////////////

		F["kills"] >> kills
		F["deaths"] >> deaths
		F["rank"] >> rank


		F["money"] >> money

		F["Chuunreset"] >> Chuunreset

		/////////////////Village////////////////
		F["LeafS"] >> LeafS
		F["MistS"] >> MistS
		F["SandS"] >> SandS
		F["missingS"] >> missingS
		F["villagedone"] >> villagedone
		F["Village"] >> Village
		F["baseVillage"] >> baseVillage
		F["faction"] >> faction
		F["Clan"] >> Clan
		F["Clany"] >> Clany


		F["oldx"] >> oldx
		F["oldy"] >> oldy
		F["oldz"] >> oldz


		F["clicker"] >> clicker
		F["macro"] >> macro
		F["style"] >> style
		/////////////////////////OOC//////////////////

		//oocverbs
		F["mute"] >> mute
		F["tempmute"] >> tempmute
		F["talkcool"] >> talkcool
		F["talktimes"] >> talktimes
		F["talkcooling"] >> talkcooling


		//olays
		F["weapon"] >> weaponinv
		F["armor"] >> armorinv
		F["legarmor"] >> legarmorinv
		F["armarmor"] >> armarmorinv
		F["facearmor"] >> facearmorinv
		F["cloak"] >> cloakinv
		F["shoes"] >> shoesinv
		F["special"] >> specialinv
		F["hair_type"] >> hair_type
		F["hair_red"] >> hair_red
		F["hair_green"] >> hair_green
		F["hair_blue"] >> hair_blue
		F["hair_color"] >> hair_color
		//non olay

		F["eye_r"] >> eye_r
		F["eye_g"] >> eye_g
		F["eye_b"] >> eye_b


		///HYUUGA///

		F["warkills"] >> warkills
		F["lee"] >> lee


		F["cantsave"] >> cantsave

		F["npcd"] >> npcd
		F["lx"] >> lx
		F["ly"] >> ly
		F["lz"] >> lz
		F["pointsg"] >> pointsg

		F["icon_name"] >> icon_name


		F["factionll"] >> factionll
		F["kage"] >> kage
		F["Orbshow"] >> Orbshow


		/////////////////////attributes

		F["medpassive"] >> medpassive
		F["strpoints"] >> strpoints
		F["reflexpoints"] >> rfxpoints
		F["intpoints"] >> intpoints
		F["conpoints"] >> conpoints
		F["conr"] >> conr
		F["medr"] >> medr//no med passives
		F["strr"] >> strr


		F["Learned_Skills"] >> Learned_Skills
		F["Learned_Weps"] >> Learned_Weps

		F["GM"] >> GM

		checklegit()//if they are legit we check to see which save is older

		src.Sqlupdate(last_x,last_y,last_z)


mob/var/sqlversion=0
mob/proc/Sqlupdate(var/ex,var/wy,var/zd)
	set background=1

	CheckTime(src)
	cansave=1//reset this for non corrupt saves.

	if(src.sqlversion)//if connected and retrieved info
		if(timesaved>sqlversion)//if nothing really happened. carry on with the local file
			if(debug)world<<"[ex]=[last_x]:[wy]=[last_y]:[zd]=[last_z]"
			Move(locate(ex, wy, zd)) // locates you to your last map location
			src.client.Resolution()

		else//if they have a later version on the server
			if(LoadSQL(src))//replaces your edited jazz
				if(debug)world<<"[ex]=[last_x]:[wy]=[last_y]:[zd]=[last_z]"
				Move(locate(last_x, last_y, last_z)) // locates you to your last map location
				src.client.Resolution()


	else//no connection or no savefile on the server? just let them carry on with local saves if they wna play offline.
		alert(src,"Warning, we couldnt grab your savefile from the server, If you choose to play this savefile locally it will not be able to upload to the server.")
		var/confirmResolve=input("The savefile :[src.name], will be saved only to this server if you play it locally, Continue?","Offline Mode:[src.name]")in list("Yes","No")
		if(confirmResolve == "Yes")
			if(last_x)Move(locate(last_x, last_y, last_z)) // locates you to your last map location
			src.client.Resolution()
			cansql=0
			gitx=1//corrupted file, dont generate new hashes for them anymore?
			Save_Mob(src,1)//save the fact its corrupt to the local server

		if(confirmResolve == "No")
			alert(src,"This character has been put into preview mode It will not save online or offline")
			cansave=0
			src.client.Resolution()

/*
mob
	verb
		TestSearch()
			CheckTime(src)
*/