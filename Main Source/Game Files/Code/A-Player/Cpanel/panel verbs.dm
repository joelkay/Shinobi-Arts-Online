mob/verb
	panel(msg as text)
		set hidden=1
		if(!msg)return
		switch(msg)
			if("save")
				src.Save()
				Apopup(src,"Character Saved!") // tells you that you saved

			if("who") // button
				src.Who()
				winset(usr,null,{"
				cpanel-mainchild.left = "Cpanel-pane";
				"})

			if("skills") // button
				src.UpdateSkills()
				winset(usr,null,{"
				cpanel-mainchild.left = "Cpanel-skillsgrid";
				"})

			if("quests") // button
				src.questgrid()
				winset(usr,null,{"
				cpanel-mainchild.left = "Cpanel-questgrid";
				"})

			if("map")
				src.checkmap()
				winset(usr,null,{"
				cpanel-mainchild.left = "Cpanel-checkmap";
				"})

			if("chatoptions") // button
				winset(usr,null,{"
				cpanel-mainchild.left = "Cpanel-chatoptions";
				"})


			if("inventory") // button
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
				src.testhouse()

			if("updates")
				src.Menu()
				winset(usr,null,{"
				cpanel-mainchild.left = "Updates";
				"})

			else
				Apopup(src,"unrecognised command :[msg], click the ? at the top left for a list of commands.")


