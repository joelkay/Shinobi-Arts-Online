// client.dm
client
	var/tmp/screen_xs
	var/tmp/screen_ys


	New()
		. = ..()
		winset(src, null, {"
			splash.is-maximized          = false;
			default.can-resize           = "false";
			default.statusbar            = "false";
			default.titlebar             = "false";
			default.macro                = null;
			default.menu                 = null
			"})





		// We are creating a variable that will record the size of the \
		child control in the window to get the size of the player's screen.
		var/screen_size = winget(src, "splash", "size")

		// We will then unmaximize the window so the play will \
		never notice the difference.
		winset(src, "splash", "is-maximized = false")
		winset(src, "splash", "is-visible = true")
		// Then we call our procedure with the proper arguments.
		get_screen(screen_size, src)

		// Finally, we change the position of the window so it is centered. \
		This is done by adding the width of our splash screen to the width \
		of the player's window and dividing the number by 4. Then the same \
		for y except we will be adding the height of our splash screen.
		winset(src, "splash", "pos = [(src.screen_xs + 931) / (4)],[(src.screen_ys + 581) / (4)]")



// This is the procedure we will use to find \
the player's screen resolution.
proc/get_screens(screen_size, client/c)

	// This variable is used to find where the \
	divider "x" is between the width and height of the resolution.
	var/x_pos = findtext(screen_size, "x")

	// This copies from the beginning of the \
	screen_size string, to the position of the "x" divider.
	var/_x = copytext(screen_size, 1, x_pos)

	// Then set the client's screen_x variable to the \
	number version of the string we just created.
	c.screen_xs = text2num(_x)

	// Here we are doing the same thing, but for screen's y.\
	So we start at the "x" divider and copy the rest of the string.
	var/_y = copytext(screen_size, x_pos + 1, 0)
	c.screen_ys = text2num(_y)

