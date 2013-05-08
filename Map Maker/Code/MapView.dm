var/mhtmlop = "border=0;can_close=0;can_resize=0;can_minimize=0;titlebar=0"
mob/verb
	mapview()
		set hidden=1
		var/icon/minimap = new(src.mapgrab()) // When you don't put in any arguments, it takes the entire map on the players z-level							  // Note: You can modify scale here by doing the following argument; src.mapgrab(scale=#)
		src << browse_rsc(minimap,"Icon")
		src << browse("<img src=Icon>","window=MView;[mhtmlop]")
		winshow(src,"mapview",1)	//Open the window.

	savepng()
		set hidden = 1
		var/icon/newIcon = new(src.mapgrab()) // grab the return value from the procedure
		src << ftp(newIcon) // Send the icon to the user.

mob/proc
	mapgrab(scale=20) // list/l is something similar to view(), range(), oview(), or orange(); if there is no list, then it will be assumed
							 // 	that we are checking for the entire world on the user's z-level.
							 // scale is the scale of the map. This can be anything from 1 to anything;
							 // 	However, scale should be noted that it creates a 32x32 icon multiplied by width and height, and then each by scale.
							 //		So, a scale of 1 would create a 32x32 icon, 10 would be 320x320, etc.
		var/icon/newIcon = new ('icon_blank.dmi') // create the blank icon. this icon file is necessary for the program to work.
		newIcon.Scale(world.maxx*scale,world.maxy*scale)
		for(var/turf/map in block(locate(1,1,src.z),locate(world.maxx,world.maxy,src.z)))
			var/icon/tempIcon = new (icon(map.icon,map.icon_state)) // create a temporary icon of the atom
			tempIcon.Scale(scale,scale) // Scale it accordingly
			newIcon.Blend(tempIcon,ICON_OVERLAY,((map.x*scale)-(1*scale)+1),((map.y*scale)-(1*scale)+1))
			for(var/atom/atomMap in map)
				var/icon/tempIconAtom = new (icon(atomMap.icon,atomMap.icon_state,dir=atomMap.dir)) // create a temporary icon of the atom
				tempIconAtom.Scale(scale,scale) // Scale it accordingly
				newIcon.Blend(tempIconAtom,ICON_OVERLAY,((map.x*scale)-(1*scale)+1),((map.y*scale)-(1*scale)+1))
		return newIcon

