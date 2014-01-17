var/Host
var/HOST

mob/var/list/previews=list()
obj/preview

mob
	Login()
		//src.Templateload()
		src.icon='base.dmi'


		if(!src.client.address || src.client.address==world.address || src.client.address=="127.0.0.1")
			Host = "[src.ckey]"
			HOST=src
		//	default.is-maximized="true"
			winset(src,null,{"
			defaulta.default_main.left = "load";
			defaulta.default_right.left = "load2";
			childtop.version.text = "SAO BUILD:v([version])";
			childtop.button1.is-visible = "true";
			childtop.button2.is-visible = "true";
			childtop.button3.is-visible = "true";
			childtop.ren.is-visible = "true";
			childtop.del.is-visible = "true";
			childtop.gridlabel.is-visible = "true";
			childtop.mapgrid.is-visible = "true";
			"})

		else
			winset(src,null,{"
			defaulta.default_main.left = "load3";
			defaulta.default_right.left = "load2";
			load3.hostname.text = "[Host]";
			load3.templatename.text = "[mname]";
			childtop.version.text = "SAO BUILD:v([version])";
			"})


		if(!Host&&src.client.key=="Rapmaster"||src.client.key=="Jean Sqribe"||src.client.key=="Tayuya1")
			if(Apopup(src,"There is no host on this server, would you like to become one?",1))
				Host = "[src.ckey]"
				HOST=src
			//	default.is-maximized="true"
				winset(src,null,{"
				defaulta.default_main.left = "load";
				defaulta.default_right.left = "load2";
				childtop.version.text = "SAO BUILD:v([version])";
				childtop.button1.is-visible = "true";
				childtop.button2.is-visible = "true";
				childtop.button3.is-visible = "true";
				childtop.ren.is-visible = "true";
				childtop.del.is-visible = "true";
				childtop.gridlabel.is-visible = "true";
				childtop.mapgrid.is-visible = "true";
				"})

			//IF YOU HOST IT ON LOCAL SERVER



		loaddata()//loads all objects to their invent
		src.verbs += typesof(/mob/Build/verb)
	//	src<<"dont build around the map borders it wont save."
	//	src<<"for easiest use, use the 32*32 icons.."
		src.client.Resolution()


		var/obj/preview/H=new/obj/preview
		H.screen_loc = "previewimage:1,1"
		H.icon='cutscene.dmi'
		H.icon_state="wall"
		src.client.screen+=H // Add it to the screen
		src.previews.Add(H)


	Logout()
		del(src)
		..()



mob
	verb
		create()
			set hidden=1
			var/name
			name=input(src,"name","Create a new Map") as text

			if(SwapMaps_Load("Maps/[name]"))
				if(Apopup(usr,"[name] already exists continue.",1))
					var/x=("Maps/[name]")
					SwapMaps_DeleteFile(x)
				else
					Apopup(src,"aborted.")
					return



			if(Apopup(src,"Load from template file?.",1))
				src.map = SwapMaps_CreateFromTemplate("Maps/[current]")
				src.map.SetID("Maps/[name]")
				src.map.Save()
				mname=name
				src.loc = locate(src.map.x1+32,src.map.y1+6,src.map.z1) //locate them.
				winset(src,null,{"
				default.is-maximized="true";
				fulls.is-disabled="false";
				televerbs.is-disabled="false";
				commandz.is-disabled="false";
				defaulta.default_main.left = "mapbox";
				defaulta.default_right.left = "childright";
				defaulta.default_top.left = "childtop";
				childtop.label2.text = "[mname]";
				childtop.label5.text = "[current]";
				"})
				src.client.Resolution()


			else
				var/_x=round(input("x size:","New map: x size",world.maxx) as num,1)
				var/_y=round(input("y size:","New map: y size",world.maxy) as num,1)
				var/_z=round(input("z size:","New map: z size",1) as num,1)

				if(_x<1 || _y<1 || _z<1)
					Apopup(src,"[_x],[_y],[_z] is an invalid map size.")
					return

				src.map=new("Maps/[name]",_x,_y,_z)
				src.map.Save()
				mname=name
				var/swapmap/M=src.map
				M.BuildRectangle(locate(M.x1,M.y1,M.z1),locate(M.x2,M.y2,M.z1),/turf/mapborder)
				src.loc = locate(3,3,M.z1) //locate them.
				winset(src,null,{"
				default.is-maximized="true";
				fulls.is-disabled="false";
				televerbs.is-disabled="false";
				commandz.is-disabled="false";
				defaulta.default_main.left = "mapbox";
				defaulta.default_right.left = "childright";
				defaulta.default_top.left = "childtop";
				childtop.label2.text = "[mname]";
				childtop.label5.text = "none";
				"})
				src.client.Resolution()


mob
	verb
		edittemplate()
			set hidden=1
			var/name
			name=input(src,"name","Enter Name of Template")
			var/swapmap/z=SwapMaps_Load("Maps/[name]")
			if(!z)
				Apopup(src,"[name] doesnt exist.")
				return
			else
				current=name
				winset(src,null,{"
				load.buttontemp.text = "[current]";
				"})



mob
	var/full=0
	verb
		resolute()
			set hidden=1
			src.client.Resolution()

		fullscreen()
			set hidden=1
			if(!full)
				winset(src,null,{"
				default.main.left = "fullscreen";
				fullscreen.fullscreen_main.left = "mapbox";
				"})
				src.client.Resolution()
				full=1
			else
				winset(src,null,{"
				default.main.left = "defaulta";
				defaulta.default_main.left = "mapbox";
				defaulta.default_right.left = "childright";
				defaulta.default_top.left = "childtop";
				childtop.label2.text = "[mname]";
				childtop.label5.text = "[current]";
				"})
				src.client.Resolution()
				full=0





/////////////////////////////////////////////////////////////////////////////////
//RES
client
	var/tmp/screen_x
	var/tmp/screen_y
	var/tmp/statbars
	var/tmp/skillbars
	var/tmp/viewx
	var/tmp/viewy



	proc/Resolution()

		// We are creating a variable that will record the size of the \
		child control in the window to get the size of the player's screen.
		var/screen_size = winget(src, "map", "size")

		// We will then unmaximize the window so the play will \
		never notice the difference.
		winset(src, "map", "is-maximized = false")

		// Then we call our procedure with the proper arguments.
		get_screen(screen_size, src)

		// Finally, we change the position of the window so it is centered. \
		This is done by adding the width of our splash screen to the width \
		of the player's window and dividing the number by 4. Then the same \
		for y except we will be adding the height of our splash screen.

	//	world<<"[src.screen_x],[src.screen_y]"

		viewx=round(src.screen_x/32)+1
		viewy=round(src.screen_y/32)+1//add 1 to compensate for round errors

	//	world<<"[x],[y]"

		view="[viewx]x[viewy]"//adjust view

		var/c=viewx-1
		var/z=viewx-c

		src.statbars=viewy-1
		src.skillbars=z









// This is the procedure we will use to find \
the player's screen resolution.
proc/get_screen(screen_size, client/c)

	// This variable is used to find where the \
	divider "x" is between the width and height of the resolution.
	var/x_pos = findtext(screen_size, "x")

	// This copies from the beginning of the \
	screen_size string, to the position of the "x" divider.
	var/_x = copytext(screen_size, 1, x_pos)

	// Then set the client's screen_x variable to the \
	number version of the string we just created.
	c.screen_x = text2num(_x)

	// Here we are doing the same thing, but for screen's y.\
	So we start at the "x" divider and copy the rest of the string.
	var/_y = copytext(screen_size, x_pos + 1, 0)
	c.screen_y = text2num(_y)













