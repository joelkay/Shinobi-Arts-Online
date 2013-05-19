mob/verb
	panel(msg as text)
		set hidden=1
		if(!msg)return
		switch(msg)
			if("save")
				src.Save()
				Apopup(src,"Character Saved!") // tells you that you saved

			if("who")
				winset(src,null,{"
				cpanel-mainchild.left = "Cpanel-pane";
				"})
				src<<browse(src.Who(),"window=Cpanel-browse")

			if("skills")
				src.UpdateSkills()
				winset(usr,null,{"
				cpanel-mainchild.left = "Cpanel-skillsgrid";
				"})

			if("quests")
				src.questgrid()
				winset(usr,null,{"
				cpanel-mainchild.left = "Cpanel-questgrid";
				"})

			if("map")
				src.checkmap()
				winset(usr,null,{"
				cpanel-mainchild.left = "Cpanel-checkmap";
				"})

			if("chatoptions")
				winset(usr,null,{"
				cpanel-mainchild.left = "Cpanel-chatoptions";
				"})


			if("inventory")
				src.UpdateEquipment()
				winset(usr,null,{"
				cpanel-mainchild.left = "Cpanel-inventory";
				"})

			if("bountylist")
				src.UpdateEquipment()
				winset(usr,null,{"
				cpanel-mainchild.left = "Cpanel-bingo";
				"})

			if("quit")
				src.Cpanelq()

			if("skilltree")
				src.SkillTree()

			if("verblist")
				src.UpdateEquipment()
				winset(usr,null,{"
				cpanel-mainchild.left = "addy";
				"})

			if("testhouse")
				//src.testhouse()
				src<<"Test House is going through some udates"

			if("updates")
				src.Menu()
				winset(usr,null,{"
				cpanel-mainchild.left = "Updates";
				"})

			else
				Apopup(src,"unrecognised command :[msg], click the ? at the top left for a list of commands.")


