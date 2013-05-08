mob
	proc
		scenesdone()//delete old maps
			src<<"You have succesfully completed character creation!"
			src.client.eye=src
			if(src.Village=="Leaf")
				src.loc=locate("LeafAcademyEnter")//where they start -> tut room
			if(src.Village=="Sand")
				src.loc=locate("SandAcademyEnter")//where they start -> tut room
			if(src.Village=="Mist")
				src.loc=locate("MistAcademyEnter")//where they start -> tut room
			completedscenes=1
			b=0//can play all again
			winset(src,null,{"
			default.cpanel-button.command="Cpanel";
			default.xlog.text = "Logout";
			default.xlog.command = "ExiT";
			default.xlog.background-color = "green";
			default.menu= null
			"})
			spawn(1)
				src.Save()
			spawn()
				src.showmacros()// activate macros
				src.loadfirst()
			inscenes=0
			//src.finish()

	proc
		finish()
			if(vis.cant_see(src.name))
				vis.is_not_a(src.name)
			for(var/Map/D in mapsets)
				if(D==src.mapset)
					D.inuse=0
					D.ready=0
					spawn() D.standby()
			src.mapset=""








