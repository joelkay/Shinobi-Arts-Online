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
			default.menu= null
			"})
			src.finish()//map is ready for deletion
			spawn()
				src.showmacros()// activate macros
				src.loadfirst()
			inscenes=0
			spawn(10)
				src<<"Saving your character for the first time."
				src.Save()



	proc
		finish()
			set background=1
			//if(vis.cant_see(src.name))
			//	vis.is_not_a(src.name)
			if(mapsets.len)
				for(var/Map/D in mapsets)	//first check if a map is available
					if(D.name==src.mapset)
						D.handler.Remove(src)
						D.inuse=0
						D.ready=0
						spawn() D.standby()

			src.mapset=""
			src.location = null







