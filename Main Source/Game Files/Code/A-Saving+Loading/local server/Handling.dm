mob/var/loaded=0
mob
	proc
		save_char()
			if(src.inscenes) return
			src.last_x=src.x
			src.last_y=src.y
			src.last_z=src.z

			switch(currentslot)
				if(1)
					slot1char=name
					var/savefile/s=new("Savefiles/[src.key]/1/[src.slot1char].sav")
					if(fexists(s)) fdel(s)
					Write(s)
					SavePreviews(1)

				if(2)
					slot2char=name
					var/savefile/s=new("Savefiles/[src.key]/2/[src.slot2char].sav")
					if(fexists(s)) fdel(s)
					Write(s)
					SavePreviews(2)


				if(3)
					slot3char=name
					var/savefile/s=new("Savefiles/[src.key]/3/[src.slot3char].sav")
					if(fexists(s)) fdel(s)
					Write(s)
					SavePreviews(3)




		del_char(x)
			if(!x) return
			if(x==1)
				var/confirmDelete=input("Are you sure you want to delete \'[src.slot1char]\'?","Login > Delete > [src.slot1char]")in list("Yes","No")
				if(confirmDelete == "Yes")
					if(Delete(src,src.slot1char,1))//sends a query to delete the user from the db
						if(fdel("Savefiles/[src.key]/1/"))
							var/oldchar=src.slot1char
							src.slot1char=null
							var/savefile/F=new("Savefiles/[src.key]/previews/settings.sav")
							F["slot1char"]<<src.slot1char

							for(var/mob/M in src.previews)
								if(M.name==src.slot1char)
									del(M)
							winset(src,null,{"
							Login.button25.text = "Empty";
							default.menu= null
							"})
							winset(src,"previewscreen1","image=''");
							Apopup(src,"\'[oldchar]\' has been succesfully deleted..")




					else
						Apopup(src,"Error no connection to the server..")



			if(x==2)
				var/confirmDelete=input("Are you sure you want to delete \'[src.slot2char]\'?","Login > Delete > [src.slot2char]")in list("Yes","No")
				if(confirmDelete == "Yes")
					if(Delete(src,src.slot2char,2))
						if(fdel("Savefiles/[src.key]/2/"))//
							var/oldchar=src.slot2char
							src.slot2char=null
							var/savefile/F=new("Savefiles/[src.key]/previews/settings.sav")
							F["slot2char"]<<src.slot2char

							for(var/mob/M in src.previews)
								if(M.name==src.slot2char)
									del(M)
							winset(src,null,{"
							Login.button26.text = "Empty";
							default.menu= null
							"})
							winset(src,"previewscreen2","image=''");
							Apopup(src,"\'[oldchar]\' has been succesfully deleted..")



					else
						Apopup(src,"Error no connection to the server..")




			if(x==3)
				var/confirmDelete=input("Are you sure you want to delete \'[src.slot3char]\'?","Login > Delete > [src.slot3char]")in list("Yes","No")
				if(confirmDelete == "Yes")
					if(Delete(src,src.slot3char,3))
						if(fdel("Savefiles/[src.key]/3/"))
							var/oldchar=src.slot3char
							src.slot3char=null
							var/savefile/F=new("Savefiles/[src.key]/previews/settings.sav")
							F["slot3char"]<<src.slot3char

							for(var/mob/M in src.previews)
								if(M.name==src.slot3char)
									del(M)
							winset(src,null,{"
							Login.button27.text = "Empty";
							default.menu= null
							"})
							winset(src,"previewscreen3","image=''");
							Apopup(src,"\'[oldchar]\' has been succesfully deleted..")



					else
						Apopup(src,"Error no connection to the server..")









		new_char(x)
			if(!x) return
			src.delpreviews()
			src.loggedIn=1
			src.client.eye = src
			src.Intro()
			src.currentslot=x
			src.UpdateEquipment()
			src.UpdateHairT()
			src.UpdateHairC()
			//src.statfocus()





		load_char(x)
			if(loaded)return
			loaded=1
			winset(src,null,{"
			default.main.left = "map";
			default.menu= null
			"})



			switch(x)
				if(1)
					var/F=("Savefiles/[src.key]/1/[src.slot1char].sav")
					if(fexists(F))
						var/savefile/s=new("Savefiles/[src.key]/1/[src.slot1char].sav")
						Read(s)
						src.loggedIn=1
						src.currentslot=x
						src.loader()

					else
						src.SQLcreate(src.slot1char)//create the char from SQL
						src.currentslot=x
						src.loader(1)




				if(2)
					var/F=("Savefiles/[src.key]/2/[src.slot2char].sav")
					if(fexists(F))
						var/savefile/s=new("Savefiles/[src.key]/2/[src.slot2char].sav")
						Read(s)
						src.loggedIn=1
						src.currentslot=x
						src.loader()

					else
						src.SQLcreate(src.slot2char)//create the char from SQL
						src.currentslot=x
						src.loader(1)




				if(3)
					var/F=("Savefiles/[src.key]/3/[src.slot3char].sav")
					if(fexists(F))
						var/savefile/s=new("Savefiles/[src.key]/3/[src.slot3char].sav")
						Read(s)
						src.loggedIn=1
						src.currentslot=x
						src.loader()

					else
						src.SQLcreate(src.slot3char)//create the char from SQL
						src.currentslot=x
						src.loader(1)




mob
	proc
		SQLcreate(var/txt)
			if(!CharSearch(txt))return//if it doesnt exist
			else
				src.name=txt
				if(LoadSQL(src))
					if(last_x)
						Move(locate(last_x, last_y, last_z)) // locates you to your last map location
					if(debug) alert(src,"Your savefile has been retrieved from the server.")

					gitx=0
					cansql=1

				else
					Apopup(src,"Error: The server can not load your savefile.")


mob
	proc
		ResolveConflict()
			set background=1
			var/confirmResolve=input("The savefile :[src.name], has been shown to be corrupted. You can resolve this by updating it with values from the server?","Corrupt:[src.name]")in list("Yes","No")
			if(confirmResolve == "Yes")
				if(LoadSQL(src))//replaces your edited jazz
					if(last_x)Move(locate(last_x, last_y, last_z)) // locates you to your last map location
					Apopup(src,"The server has confirmed your savefile, all issues have been resolved.")

					gitx=0
					cansql=1

					if(last_x)
						spawn(20)src.Save()//update the local server with your stuff, test if the value is good

				else
					Apopup(src,"The server can not load your savefile, nothing will be changed.")
					if(last_x)Move(locate(last_x, last_y, last_z)) // locates you to your last map location

			if(confirmResolve == "No")
				Apopup(src,"Okay, nothing will be changed, remember corrupted save files may not be uploaded to the server.")
				if(last_x)Move(locate(last_x, last_y, last_z)) // locates you to your last map location