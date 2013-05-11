mob
	proc
		Intro()
			winset(src,null,{"
			default.main.left = "charcreate";
			default.menu= null
			"})

			src.Initialisepreviews()



/*
				New()
		. = ..()
		winset(src, null, {"
			window_default.child_main.left      = "pane_splash";
			window_default.can-resize           = "false";
			window_default.statusbar            = "false";
			window_default.titlebar             = "false";
			window_default.macro                = null;
			window_default.menu                 = null
			"})
		src.verbs += typesof(/player_entry/verb)

if(!src.newplayer)
	skitting=1
	Small_Skit()
	if(skitting)
		return
	var/sound/F = sound('begin.mid')
	src << F //laggg

*/

mob
	proc
		Initialisepreviews()
			var/obj/A=new/obj/basepale
			var/obj/B=new/obj/basewhite
			var/obj/C=new/obj/baseblack
			A.screen_loc = "basepreview:1,1" // Make it appear on the preview map
			B.screen_loc = "basepreview:3,1" // Make it appear on the preview map
			C.screen_loc = "basepreview:5,1" // Make it appear on the preview map
			src.client.screen+=A // Add it to the screen
			src.client.screen+=B // Add it to the screen
			src.client.screen+=C // Add it to the screen

			src.client.screen+=src // Add it to the screen
			src.screen_loc = "previewmain:1,1" // Make it appear on the preview map
			src.client.eye=src//make u view urself lol

			icon_name=null
			weaponinv=null
			armorinv=null
			legarmorinv=null
			armarmorinv=null
			facearmorinv=null
			cloakinv=null
			shoesinv=null
			specialinv=null
			hair_type=null
			hair_red=null
			hair_green=null
			hair_blue=null
			hair_color=null
			upForm(usr, /upForm/Clans/None)



mob
	verb
		konohaS()
			set hidden=1
			src.Village="Leaf"
			src.baseVillage="Leaf"
			src.faction="Leaf"
			src.LeafS=1
			src.Clan=""//reset
			src.namefirst = ""//reset
			src.mapgrid=1
			winset(src,null,{"
			charcreate.pickclan.left = "leafclansgrid";
			charcreate.label16.text = "Village: Konoha";
			"})
			src.UpdateLeafC()

		sunaS()
			set hidden=1
		//	Apopup(src,"\'Suna\' is not yet ready..")
			src.mapgrid=11
			src.Village="Sand"
			src.baseVillage="Sand"
			src.faction="Sand"
			src.SandS=1
			src.Clan=""//reset
			src.namefirst = ""//reset
			winset(src,null,{"
			charcreate.pickclan.left = "sunaclansgrid";
			charcreate.label16.text = "Village: Suna";
			"})
			src.UpdateSunaC()


		kiriS()
			set hidden=1
			//Apopup(src,"\'Mist\' is not yet ready..")
			src.mapgrid=10
			src.Village="Mist"
			src.baseVillage="Mist"
			src.faction="Mist"
			src.MistS=1
			src.Clan=""//reset
			src.namefirst = ""//reset
			winset(src,null,{"
			charcreate.pickclan.left = "mistclansgrid";
			charcreate.label16.text = "Village: Mist";
			"})
			src.UpdateMistC()




obj
	Clans
		var/namef=""
		Click()
			for(var/upForm/Clans/F in usr.client.upForms)
				del(F)
			usr.Clan="[src.name]"
			usr.namefirst = "[src.namef]"
			usr.UpdateLeafC()
			usr.UpdateSunaC()
			winset(usr,null,{"
				charcreate.label24.text = "Clan: [src.name]";
				"})

		LeafClans
			Uchiha
				name="Uchiha"
				namef="Uchiha"
				icon='uchiha.png'

				Click()
					..()
					upForm(usr, /upForm/Clans/Uchiha)

			Hyuuga
				name="Hyuuga"
				namef="Hyuuga"
				icon='hyuuga.png'
				Click()
					..()
					upForm(usr, /upForm/Clans/Hyuuga)

			Nara
				name="Nara"
				namef="Nara"
				icon='nara.png'
				Click()
					..()
					upForm(usr, /upForm/Clans/Nara)

			Akimichi
				name="Akimichi"
				namef="Akimichi"
				icon='akimichi.png'
				Click()
					..()
					upForm(usr, /upForm/Clans/Akimichi)

		SunaClans
			Sand_Manipulator
				name="Gaara"
				namef=""
				icon='gaara.png'
				Click()
					..()
					upForm(usr, /upForm/Clans/Gaara)

			Deidara
				name="Deidara"
				namef=""
				icon='deidara.png'
				Click()
					..()
					upForm(usr, /upForm/Clans/Deidara)

			Puppet
				name="Puppet"
				namef=""
				icon='puppet.png'
				Click()
					..()
					upForm(usr, /upForm/Clans/Puppet)

		MistClans
			Haku
				name="Haku"
				namef=""
				icon='haku.png'
				Click()
					..()
					upForm(usr, /upForm/Clans/Haku)

			Jashin
				name="Jashin"
				namef=""
				icon='jashin.png'
				Click()
					..()
					upForm(usr, /upForm/Clans/Jashin)

			Kaguya
				name="Kaguya"
				namef=""
				icon='kaguya.png'
				Click()
					..()
					upForm(usr, /upForm/Clans/Kaguya)







mob
	verb
		done()
			set hidden=1
			//var/total=totalfocus()
			//if(round(total)<120)
			//	Apopup(src,"\'Stat Focus\' you have [120-round(total)]points unspent..","total focus =[round(total)]/120")
			//	return
			if(!src.icon)
				Apopup(src,"\'icon\' is not set..")
				return
			if(!src.hair_type)
				Apopup(src,"\'hairtype\' is not set..")
				return
			if(!src.Village)
				Apopup(src,"\'village\' is not set..")
				return
			if(!src.Clan)
				Apopup(src,"\'clan\' is not set..")
				return
			if(src.ParseName())
				Apopup(src,"\'Name\' is not set..")
				return
		//	if(src.personchoose())
			//	Apopup(src,"\'Personality\' is not set..","Clan")
			//	return



mob/var/tmp/nuub=0
mob/var/tmp/nubt=0
mob
	proc
		startout()
			var/a=src.resistancefocus
			var/b=src.chakraforcefocus
			var/c=src.agilityfocus
			var/d=src.dexterityfocus
			var/e=src.reflexfocus
			var/f=src.strengthfocus
			var/total=a+b+c+d+e+f
			src.resistancefocus=round((a/total)*100)
			src.chakraforcefocus=round((c/total)*100)
			src.agilityfocus=round((b/total)*100)
			src.dexterityfocus=round((e/total)*100)
			src.reflexfocus=round((d/total)*100)
			src.strengthfocus=round((f/total)*100)

			//src.loc=locate("MistAcademyEnter")//where they start -> tut room
			//src<<"You have succesfully completed character creation!"
			src.contents += new /Skill/Shadow_Clone
			src.contents += new /Skill/Transformation_Technique
			src.contents += new /Skill/Body_Replacement_Technique
			src.contents += new /Skill/Body_Flicker
			src.contents += new /obj/items/legarmor/Casual
			src.contents += new /obj/items/armors/Black
			//src.firstjutsu()

			src.loggedin=1
			//src.client.screen-=src // Add it to the screen
		//	src.scenesdone()//finish scenes


			inscenes=1
			if(nubt)return
			src.loggedin=1
			if(!src.nuub)//if they have seen it give em a choice
				nubt=1
				switch(alert("Do you wish to skip the introduction/tutorial?","","Yes","No"))
					if("Yes")
						winset(src,null,{"
						default.cpanel-button.command="Cpanel"
						"})//turn on the cpanel
						winset(src,null,{"
						default.main.left = "map";;
						default.belowchatchild.left = "belowchat";
						default.menu= null
						"})
						src.scenesdone()//finish scenes
						spawn()
							src.showmacros()// activate macros
							src.loadfirst()


					if("No")
						allocate()







			else//nuubs cant skip cutscenes ;)
				allocate()






mob
	proc
		allocate()
			//world<<"[src.client.mob]"
			//world<<"[src]"
			spawn()Apopup(src,"please wait. loading maps")
			src.Allocate_Maps(1)// so allocating a map with just Allocate_Maps(1)gives the default stuff
			//Allocate_Maps(2)//gives us next map e,t.c
			//check MapHandler.dm for more info
			wait
			if(!src.map)
				spawn(10)
					goto wait

			src.sight |= (SEE_MOBS|SEE_OBJS|SEE_TURFS)  // turn on several bits at once
			src.pk=1//cant kill em
			inscenes=0
			src.mainscene1()
//////////////////////////TUTORIAL BOIII///////////////////////////////////
