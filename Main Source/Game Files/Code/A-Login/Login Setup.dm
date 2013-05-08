mob
	var/slot1char
	var/slot2char
	var/slot3char
	var/fromdelete=0

mob/proc
	setup()
		set background=1
		var/savefile/F=new("Savefiles/[src.key]/previews/settings.sav")
		F["slot1char"] >> slot1char
		F["slot2char"] >> slot2char
		F["slot3char"] >> slot3char
		setupdownload(slot1char,slot2char,slot3char)//get sql updated settings


	charpreview(num)
		var/savefile/F=new("Savefiles/[src.key]/previews/[num].sav")
		F["name"]>> name
		F["icon_name"] >> icon_name
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

mob
	var/tmp/slotmode="create"
	var/tmp/currentslot
	verb
		Createchars()
			set hidden=1
			winset(src,null,{"
			Login.label18.text = "Pick an empty slot";
			Login.button7.background-color = #008000;
			Login.button21.background-color = #363636;
			Login.button22.background-color = #363636;
			default.menu= null
			"})
			src.slotmode="create"
			setup()
			if(!fromdelete)previews()


		Loadchars()
			set hidden=1
			winset(src,null,{"
			Login.label18.text = "Load a character";
			Login.button7.background-color = #363636;
			Login.button21.background-color = #004080;
			Login.button22.background-color = #363636;
			default.menu= null
			"})
			src.slotmode="load"
			setup()
			if(!fromdelete)previews()



		Deletechars()
			set hidden=1
			winset(src,null,{"
			Login.label18.text = "Delete a character";
			Login.button7.background-color = #363636;
			Login.button21.background-color = #363636;
			Login.button22.background-color = #910000;
			default.menu= null
			"})
			src.slotmode="delete"
			setup()
			if(!fromdelete)previews()



		Slot1()
			set hidden=1
			//CREATE
			if(src.slotmode=="create"&&!src.slot1char)
				src.new_char(1)
			if(src.slotmode=="load"&&src.slot1char)
				src.load_char(1)
			if(src.slotmode=="delete"&&src.slot1char)
				src.del_char(1)

		Slot2()
			set hidden=1
			//CREATE
			if(src.slotmode=="create"&&!src.slot2char)
				src.new_char(2)
			if(src.slotmode=="load"&&src.slot2char)
				src.load_char(2)
			if(src.slotmode=="delete"&&src.slot2char)
				src.del_char(2)


		Slot3()
			set hidden=1
			//CREATE
			if(src.slotmode=="create"&&!src.slot3char)
				src.new_char(3)
			if(src.slotmode=="load"&&src.slot3char)
				src.load_char(3)
			if(src.slotmode=="delete"&&src.slot3char)
				src.del_char(3)




mob
	var/tmp/previewsdone=0
	var/tmp/PreviewA
	var/tmp/PreviewB
	var/tmp/PreviewC
	var/tmp/list/previews=new/list
	proc
		previews()
			src.previewsdone=1

			setup()//checks for chars

			if(slot1char)
				spawn()
					winset(src,null,{"
					Login.button25.text = "Loading....";
					default.menu= null
					"})
					var/mob/A = src.PreviewA
					if(A)
						var/iconName = "1[ckey(A.name)]_flattened.dmi"
						// Copy the file to the rsc manually
						var/icon/a = fcopy_rsc(getFlatIcon(A))
						// Send the icon to src's local cache
						src<<browse_rsc(a, iconName)
						// Update the label to show it
						winset(src,"previewscreen1","image='\ref[a]'");

						winset(src,null,{"
						Login.button25.text = "[A.name]";
						default.menu= null
						"})
						src.previews+=A

			if(slot2char)
				spawn()
					winset(src,null,{"
					Login.button26.text = "Loading....";
					default.menu= null
					"})
					var/mob/B = src.PreviewB
					if(B)
						var/iconName = "2[ckey(B.name)]_flattened.dmi"
						// Copy the file to the rsc manually
						var/icon/b = fcopy_rsc(getFlatIcon(B))
						// Send the icon to src's local cache
						src<<browse_rsc(b, iconName)
						// Update the label to show it
						winset(src,"previewscreen2","image='\ref[b]'");

						winset(src,null,{"
						Login.button26.text = "[B.name]";
						default.menu= null
						"})
						src.previews+=B


			if(slot3char)
				spawn()
					winset(src,null,{"
					Login.button27.text = "Loading....";
					default.menu= null
					"})
					var/mob/C = src.PreviewC
					if(C)
						var/iconName = "3[ckey(C.name)]_flattened.dmi"
						// Copy the file to the rsc manually
						var/icon/c = fcopy_rsc(getFlatIcon(C))
						// Send the icon to src's local cache
						src<<browse_rsc(c, iconName)
						// Update the label to show it
						winset(src,"previewscreen3","image='\ref[c]'");

						winset(src,null,{"
						Login.button27.text = "[C.name]";
						default.menu= null
						"})
						src.previews+=C



			if(!src.slot1char)
				winset(src,null,{"
				Login.button25.text = "Empty";
				default.menu= null
				"})
			if(!src.slot2char)
				winset(src,null,{"
				Login.button26.text = "Empty";
				default.menu= null
				"})
			if(!src.slot3char)
				winset(src,null,{"
				Login.button27.text = "Empty";
				default.menu= null
				"})
			if(!src.slot1char&&!src.slot2char&&!src.slot3char)
				if(src.nuub)return//stop spam
				src.nuub=1
				world<<"[src] has logged in for the first time!!!!." // tells world you logged in
				return//do it once




mob
	proc
		delpreviews()
			src.previewsdone=0
			for(var/mob/M in src.previews)
				del(M)

