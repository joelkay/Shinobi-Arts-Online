
mob
	verb
		TempAdmin()
			set hidden =1
			if(winget(src,"addy","is-visible")=="true")
				winshow(src,"addy",0)

			else
				//winset(src,"outputbpx","pos=110x510")
				winshow(src,"addy",1)




mob
	proc
		align()
			winset(src,null,{"
			default.main.left ="map";
			default.combatchild.left = "chatbox";
			default.panelchild.left = "C-panel";
			cpanel-botchild.left = "Cpanel-combatbox";
			"})


//////////////////////////////////////////////THIS BELOW IS NEW//////////////////////

/*
client
	var/tmp/chaty
	proc/Placement()
		var/num2=src.screen_y//665
		var/value=num2-225//440
		var/num3=num2-665
		if(num3==0)
			value+=0
		if(num3>0)
			value-=round(num3/32)
		if(num3<0)
			value+=round(num3/32)

		//world<<"[num2],[num3],[value]"//893,228,440
		winset(src,"chatbox","pos=1,[value]")//578 height?screen_loc="1,1 to 17,8:-128"
		winshow(src,"chatbox",1)
		return



////////////////////////////////////////////////////////////UP TO HERE//////////////////////
*/


mob
	verb
		maximise()
			set hidden=1
			src.client.Resolution()




//////////////////////////////////////////////EPIC RESOLUTION SETTINGS////////////////////////////////////////////////////
// client.dm
client
	var/tmp/screen_x
	var/tmp/screen_y
	var/tmp/statbars
	var/tmp/enemybars
	var/tmp/skillbars
	var/tmp/viewx
	var/tmp/viewy



	New()
		. = ..()
		winset(src, "default", "is-maximized = true")
		spawn() src.Resolution()



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

		var/c=viewx-1// this is the last x -1
		var/z=viewx-c// this is the start? =1


		src.enemybars=viewx-6 // last x -6
		src.statbars=viewy-1 // last y -1
		src.skillbars=z// this is generally 1 i guess









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






















/*
mob
	proc
		viewsizes()

			client.viewx-





*/