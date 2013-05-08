mob
	var
		pk
		Village
		dojo
		Mistdojo
		Leafdojo
		Sanddojo
		Mistshop
		Leafshop
		Sandshop
		runon
		rank
		inwater
		inbed
		life
		canmove
		canregen

mob/NPC
	LeafTrainer
		pk=1
	MistTrainer
		pk=1
	SandTrainer
		pk=1

mob
	proc
		gexam()
		regeneration()
		Proceed()



turf
	LEAVEFOREST

	LEAVEARENA

	LEAVECHUUNEXAM

obj
	triggerable

obj
	proc
		SteppedOn(atom/movable/a)



world
	name = "Map Viewer"
	tick_lag = 1
	loop_checks = 1 //dont ever touch this <-lol -.- they were right T_T
	sleep_offline = 1 //when no players on
	map_format=TOPDOWN_MAP

client
	perspective=EDGE_PERSPECTIVE

mob/Login()
	winset(src, "default", "is-maximized = true")
	src.icon='base.dmi'
	src.icon_state="Run"
	src.loc=locate("SPAWN")
	src.sight |= (SEE_MOBS|SEE_OBJS|SEE_TURFS)  // turn on several bits at once
	pixel_step_size=10
	..()





///////////procs//////////////////////////////////////////////////////////////


//////////////////////////////////////////////EPIC RESOLUTION SETTINGS////////////////////////////////////////////////////
// client.dm
client
	var/tmp/screen_x
	var/tmp/screen_y
	var/tmp/statbars
	var/tmp/skillbars
	var/tmp/viewx
	var/tmp/viewy



	New()
		. = ..()
		src.Resolution()



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




















