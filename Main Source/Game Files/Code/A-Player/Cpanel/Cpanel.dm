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
			src.CpanelHelp()
			winset(src,null,{"
			cpanel-mainchild.left = "Cpanel-pane";
			"})

	proc
		Cpanelq()
			if(winget(src,"C-panel","is-visible")=="true")
				winshow(src,"C-panel",0)



mob/verb
	who()
		set hidden=1
		winset(src,null,{"
		cpanel-mainchild.left = "Cpanel-pane";
		"})
		src<<browse(src.Who(),"window=Cpanel-browse")



	quests()
		set hidden=1
		src.questgrid()
		winset(src,null,{"
		cpanel-mainchild.left = "Cpanel-questgrid";
		"})


	map()
		set hidden=1
		src.checkmap()
		winset(src,null,{"
		cpanel-mainchild.left = "Cpanel-checkmap";
		"})

	chatoptions()
		set hidden=1
		winset(src,null,{"
		cpanel-mainchild.left = "Cpanel-chatoptions";
		"})

	jutsulist()
		set hidden=1
		src.JutsuCheck()
		winset(src,null,{"
		stree-child1.left = "Jutsu-pane";
		"})


	inventory()
		set hidden=1
		src.UpdateEquipment()
		winset(src,null,{"
		cpanel-mainchild.left = "Cpanel-inventory";
		"})

	skills()
		set hidden=1
		src.UpdateSkills()
		winset(src,null,{"
		cpanel-mainchild.left = "Cpanel-skillsgrid";
		"})

	verbz()
		set hidden=1
		winset(src,null,{"
		cpanel-mainchild.left = "addy";
		"})

	verbz2()
		set hidden=1
		winset(src,null,{"
		cpanel-mainchild.left = "Cpanel-verbs";
		"})




