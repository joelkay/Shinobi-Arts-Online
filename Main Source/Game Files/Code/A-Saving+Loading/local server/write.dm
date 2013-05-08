/////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
var/salt = "8U!tGuvm!n41M#8"//edited for MAIN SOURCE
world/New()
	..()
	salt = copytext(salt,8)+ascii2text(123)+copytext(salt,1,8)
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
mob
	Write(var/savefile/F) // Write proc
        //..()
		var/hash
		if(!gitx)
			hash = md5("[health],[chakra],[blevel],[salt]")

		F["last_x"] << last_x
		F["last_y"] << last_y
		F["last_z"] << last_z

		F["key"] << "[src.key]"
		////PLAYER VARS/////
		F["name"] << name
		F["rpgname"] << rpgname
		F["namefirst"] << namefirst
		F["contents"] << contents
		F["versionplayed"] << versionplayed
		F["boughtskills"] << boughtskills
		///////////team//////////////////////
		F["teamname"] << teamname

		F["health"] << health
		F["max_health"] << max_health
		F["chakra"] << chakra
		F["max_chakra"] << max_chakra
		F["energy"] << energy
		F["max_energy"] << max_energy
		F["pk"] << pk
		F["bingo"] << bingo

		F["life"] << life
		F["max_life"] << max_life
		F["exp"] << exp
		F["maxexp"] << maxexp

		F["blevel"] << blevel
		F["contribution"] << contribution
		F["attribute_Points"] << attribute_Points

		F["supplies"] << supplies

		F["killmedalset"] << killmedalset
		F["dummy"] << dummy
		F["allowedswitch"] << allowedswitch

		F["resistance"] << resistance

		F["resistancemain"] << resistancemain

		F["chakraforce"] << chakraforce

		F["chakraforcemain"] << chakraforcemain

		F["agility"] << agility

		F["agilitymain"] << agilitymain

		F["dexterity"] << dexterity

		F["dexteritymain"] << dexteritymain//var with added or reduced bonuses

		F["reflex"] << reflex

		F["reflexmain"] << reflexmain

		F["strength"] << strength

		F["strengthmain"] << strengthmain

		F["attackrate"] << attackrate
		F["dizzyrate"] << dizzyrate

		F["totaltime"] << totaltime//time played
		F["timesaved"] << timesaved//time saved
		//////////////////PLAYER HOUSES//////////////////////////////////////////////////////
		F["Savedx"] << Savedx	  //Is used later to record the players X position
		F["Savedy"] << Savedy	  //Is used later to record the players Y position
		F["Savedz"] << Savedz	  //Is used later to record the players Z position

		/////////////////////TRAITS//////////////////////////////////////////////////////////
		F["kills"] << kills
		F["deaths"] << deaths
		F["rank"] << rank


		F["money"] << money

		F["Chuunreset"] << Chuunreset

		/////////////////Village////////////////
		F["LeafS"] << LeafS
		F["MistS"] << MistS
		F["SandS"] << SandS
		F["missingS"] << missingS
		F["villagedone"] << villagedone
		F["Village"] << Village
		F["baseVillage"] << baseVillage
		F["faction"] << faction
		F["Clan"] << Clan
		F["Clany"] << Clany


		F["oldx"] << oldx
		F["oldy"] << oldy
		F["oldz"] << oldz


		F["clicker"] << clicker
		F["macro"] << macro
		F["style"] << style

		///////////////////////////////////////////////////SO ITS NOT BAIT

		F["legit"] << hash
		F["gitx"] << gitx//this is a secret var that turns on when a savefile is shown to be corrupt.

		//////////////////////////////////////////////VERIFICATION

		/////////////////////////OOC//////////////////
		//oocverbs
		F["mute"] << mute
		F["tempmute"] << tempmute
		F["talkcool"] << talkcool
		F["talktimes"] << talktimes
		F["talkcooling"] << talkcooling


		//olays
		F["weapon"] << weaponinv
		F["armor"] << armorinv
		F["legarmor"] << legarmorinv
		F["armarmor"] << armarmorinv
		F["facearmor"] << facearmorinv
		F["cloak"] << cloakinv
		F["shoes"] << shoesinv
		F["special"] << specialinv
		F["hair_type"] << hair_type
		F["hair_red"] << hair_red
		F["hair_green"] << hair_green
		F["hair_blue"] << hair_blue
		F["hair_color"] << hair_color
		//non olay

		F["eye_r"] << eye_r
		F["eye_g"] << eye_g
		F["eye_b"] << eye_b

		///HYUUGA///

		F["warkills"] << warkills
		F["lee"] << lee


		F["cantsave"] << cantsave

		F["npcd"] << npcd
		F["lx"] << lx
		F["ly"] << ly
		F["lz"] << lz
		F["pointsg"] << pointsg

		F["icon_name"] << icon_name


		F["factionll"] << factionll
		F["kage"] << kage
		F["Orbshow"] << Orbshow


		/////////////////////attributes

		F["medpassive"] << medpassive
		F["strpoints"] << strpoints
		F["reflexpoints"] << rfxpoints
		F["intpoints"] << intpoints
		F["conpoints"] << conpoints
		F["conr"] << conr
		F["medr"] << medr//no med passives
		F["strr"] << strr


		F["Learned_Skills"] << Learned_Skills
		F["Learned_Weps"] << Learned_Weps

		F["GM"] << GM

mob/proc
	SavePreviews(num)
		switch(num)
			if(1)
				var/savefile/F=new("Savefiles/[src.key]/previews/settings.sav")
				F["slot1char"]<<name
			if(2)
				var/savefile/F=new("Savefiles/[src.key]/previews/settings.sav")
				F["slot2char"]<<name
			if(3)
				var/savefile/F=new("Savefiles/[src.key]/previews/settings.sav")
				F["slot3char"]<<name

		var/savefile/G=new("Savefiles/[src.key]/previews/[num].sav")
		G["name"]<<name
		G["icon_name"] << icon_name
		G["weapon"] << weaponinv
		G["armor"] << armorinv
		G["legarmor"] << legarmorinv
		G["armarmor"] << armarmorinv
		G["facearmor"] << facearmorinv
		G["cloak"] << cloakinv
		G["shoes"] << shoesinv
		G["special"] << specialinv
		G["hair_type"] << hair_type
		G["hair_red"] << hair_red
		G["hair_green"] << hair_green
		G["hair_blue"] << hair_blue
		G["hair_color"] << hair_color




