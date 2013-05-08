mob/var/inpanel=0
mob
	verb
		Cpanel()
			set hidden=1
			if(!src.loggedin)return
			if(winget(src,"C-panel","is-visible")=="true")
				winshow(src,"C-panel",0)
				inpanel=0


			else
				winshow(src,"C-panel",1)
				winset(src,"C-panel","pos=NORTHWEST")
				inpanel=1
				/*
				winset(src,null,{"
				default.chatboxlink.left = "chatbox";
				"})
				*/

		cpanelhelp()
			set hidden=1
			usr.CpanelHelp()
			winset(usr,null,{"
			cpanel-mainchild.left = "Cpanel-pane";
			"})

	proc
		Cpanelq()
			if(winget(src,"C-panel","is-visible")=="true")
				winshow(src,"C-panel",0)



mob/verb
	who()
		set hidden=1
		winset(usr,null,{"
		cpanel-mainchild.left = "Cpanel-pane";
		"})
		usr<<browse(src.Who(),"window=Cpanel-browse")



	quests()
		set hidden=1
		src.questgrid()
		winset(usr,null,{"
		cpanel-mainchild.left = "Cpanel-questgrid";
		"})


	map()
		set hidden=1
		src.checkmap()
		winset(usr,null,{"
		cpanel-mainchild.left = "Cpanel-checkmap";
		"})

	chatoptions()
		set hidden=1
		winset(usr,null,{"
		cpanel-mainchild.left = "Cpanel-chatoptions";
		"})

	jutsulist()
		set hidden=1
		src.JutsuCheck()
		winset(usr,null,{"
		stree-child1.left = "Jutsu-pane";
		"})


	inventory()
		set hidden=1
		usr.UpdateEquipment()
		winset(usr,null,{"
		cpanel-mainchild.left = "Cpanel-inventory";
		"})

	skills()
		set hidden=1
		usr.UpdateSkills()
		winset(usr,null,{"
		cpanel-mainchild.left = "Cpanel-skillsgrid";
		"})

	verbz()
		set hidden=1
		winset(usr,null,{"
		cpanel-mainchild.left = "addy";
		"})

		/*
		winset(usr,null,{"
		cpanel-mainchild.left = "addyCpanel-verbs";
		"})
		*/



