mob
	var
		radaron=1

//edit tree and water when i make em global.

client
	proc
		Redraw()
			for(var/obj/Blip/o in src.screen)
				del o	//Delete all previous blips
			var/mob/M = src.mob
			var/list/notallowed = list(/turf/)//     Look at this bit abit more nyugaah    ) //list all types here that you DONT want to appear on the radar
			for(var/atom/t in view(40,M)) //var/atom/movable/t	//for every atom in your view...
				var/n = 0
				for(var/v in notallowed)
					if(istype(t,v)) //If its not allowed...
						n = 1 //set n to 1
						break
				var/is = "" //icon_state of the blip
				var/d = 0 //direction of the blip, useless in most situations
				var/l = 5000 //layer of the blip. In case you want player to appear above everything or something

				if(n) continue // If n is not 0, then dont make a blip for this object.
				if(t in M) continue // If t is an object in your contents then dont make a blip for that object.

				if(!is&&t==M) // If t is you...
					is = "you" // Make icon_state "you"
					l = 5025 // Make this blip above everything else.

				if(istype(t,/mob/)&&t!=M&&t==M.targeted) // If t is you...
					is = "enemy" // Make icon_state "you"
					l = 5025 // Make this blip above everything else.

				if(istype(t,/mob/)&&t!=M&&t!=M.targeted)
					is = "blip"
					l = 5024

//				if(istype(t,/obj/Water)) // If t is water...
//					is = "water" // Make the icon_state "water"

//				if(istype(t,/obj/Tree)) // If t is a tree
//					is = "tree" // Make the icon_state "tree"

				if(is) // If an icon_state was given...
					var/obj/Blip/o = new // Make a new blip
					o.icon_state = is // Make the icon_state is.
					o.dir = d // Make the direction d.
					o.layer = l // Make the l ayer the l.
					o.pixel_x = ((t.x-M.x)-src.pixel_x)*4 // Make the blip in the right position on the radar (may need to edit this for different size radars)
					o.pixel_y = ((t.y-M.y)-src.pixel_y)*4
					o.screen_loc = "radar:2:[o.pixel_x],2:[o.pixel_y]" // Make it appear on the radar map
					src.screen+=o // Add it to the radar



obj
	Blip
		icon = 'Radar Blips.dmi'
		icon_state = "blip"



proc/createRadarImage(client/c,image)
	var/obj/newImage = new()
	newImage.icon = image
	newImage.screen_loc = "radar:1,1"
	c.screen+=newImage
	/* for older byond versions (<641)

	var/icon/newI=image
	var/list/states=icon_states(newI)-"" //removes the blank state

	for(var/v in states)
		var/xx
		var/yy
		var/obj/newImage=new()
		newImage.icon=newI
		newImage.icon_state="[v]"
		if(findtext(v,",")) xx=text2num(copytext(v,1,findtext(v,",")))
		if(findtext(v,",")) yy=text2num(copytext(v,findtext(v,",")+1))
		newImage.name="[image]"
		newImage.screen_loc = "radar:[xx],[yy]"
		c.screen+=newImage

	*/

client
	New()
		..()
		createRadarImage(src,'Radar2.dmi')


proc
	Show_Radar(mob/M)
		//if(winget(M,"radar","is-visible")=="true")
		if(!M.client)return
		if(debug)world<<"Radar turned off"
		if(!M.byakuganon)
			winshow(M,"radarbox",0)
			M.radaron=0
		else
			if(debug)world<<"Radar turned on pos:[M.client.enemybars],1"
			winshow(M,"radarbox",1)
			M.radaron=1

mob
	Stat()
		..()
		if(!src.radaron)
			return
		if(client) client.Redraw()

