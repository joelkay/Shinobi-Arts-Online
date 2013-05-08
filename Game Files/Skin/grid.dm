var/griditems



mob/proc/UpdateSkills()
	var/items = 0
	for(var/Skill/O in src.contents)
		//if(equipment && O.slot && equipment[O.slot]==O)
		//continue   // don't show equipped items
		if(!src.loggedin)return
		winset(src, "Cpanel-skillsgrid.skills", "current-cell=[++items]")
		src << output(O, "Cpanel-skillsgrid.skills")
	winset(src, "Cpanel-skillsgrid.skills", "cells=[items]")  // cut off any remaining cells


mob
	var/list/inventorystuff=list()

mob/proc/UpdateEquipment()
	var/items = 0
	for(var/obj/items/X in src.contents)
		winset(src, "Cpanel-inventory.inventory", "current-cell=[++items]")
		src << output(X, "Cpanel-inventory.inventory")
	winset(src, "Cpanel-inventory.inventory", "cells=[items]")
	//preview-info
	winset(src,null,{"
	Cpanel-inventory.reflexlabel1.text="Reflex: [reflex]";
	Cpanel-inventory.reflexlabel2.text="+:[(reflexplus+reflexboost)]";
	Cpanel-inventory.reflexlabel3.text="-:[reflexminus]";

	Cpanel-inventory.dexteritylabel1.text="Dexterity: [dexterity]";
	Cpanel-inventory.dexteritylabel2.text="+:[(dexterityplus+dexterityboost)]";
	Cpanel-inventory.dexteritylabel3.text="-:[dexterityminus]";

	Cpanel-inventory.strengthlabel1.text="Strength: [strength]";
	Cpanel-inventory.strengthlabel2.text="+:[(strengthplus+strengthboost)]";
	Cpanel-inventory.strengthlabel3.text="-:[strengthminus]";

	Cpanel-inventory.agilitylabel1.text="Agility: [agility]";
	Cpanel-inventory.agilitylabel2.text="+:[(agilityplus+agilityboost)]";
	Cpanel-inventory.agilitylabel3.text="-:[agilityminus]";

	Cpanel-inventory.chakraflabel1.text="Chakra f: [chakraforce]";
	Cpanel-inventory.chakraflabel2.text="+:[(chakraforceplus+chakraforceboost)]";
	Cpanel-inventory.chakraflabel3.text="-:[chakraforceminus]";

	"})
	spawn() UpdateCells()

obj
	preview
		layer=MOB_LAYER+1
		//icon='black shirt.dmi'


mob/proc/UpdateCells()
	set background=1
	for(var/Z in src.inventorystuff)
		del(Z)


	//preview-head

	if(src.facearmorinv)
		var/obj/items/facearmorprev=new/obj/items// swap the icons around
		for(var/obj/items/X in ilist)
			if(X.icon2==facearmorinv)
				facearmorprev.icon=X.icon
				facearmorprev.icon_state=X.icon_state

		if(facearmorprev)
			facearmorprev.screen_loc = "headp:1,1" // Make it appear on the preview map
			src.client.screen+=facearmorprev // Add it to the screen
		src.inventorystuff.Add(facearmorprev)//for deleting after

	//preview-armor
	if(src.armorinv)
		var/obj/items/armorprev=new/obj/items// swap the icons around
		for(var/obj/items/X in ilist)
			if(X.icon2==armorinv)
				armorprev.icon=X.icon
				armorprev.icon_state=X.icon_state

		if(armorprev)
			armorprev.screen_loc = "armorp:1,1" // Make it appear on the preview map
			src.client.screen+=armorprev // Add it to the screen
		src.inventorystuff.Add(armorprev)//for deleting after

	//preview-legs
	if(src.legarmorinv)
		var/obj/items/legarmorprev=new/obj/items// swap the icons around
		for(var/obj/items/X in ilist)
			if(X.icon2==legarmorinv)
				legarmorprev.icon=X.icon
				legarmorprev.icon_state=X.icon_state

		if(legarmorprev)
			legarmorprev.screen_loc = "legarmorp:1,1" // Make it appear on the preview map
			src.client.screen+=legarmorprev // Add it to the screen
		src.inventorystuff.Add(legarmorprev)//for deleting after

	//preview-arms
	if(src.armarmorinv)
		var/obj/items/armarmorprev=new/obj/items// swap the icons around
		for(var/obj/items/X in ilist)
			if(X.icon2==armarmorinv)
				armarmorprev.icon=X.icon
				armarmorprev.icon_state=X.icon_state

		if(armarmorprev)
			armarmorprev.screen_loc = "armarmorp:1,1" // Make it appear on the preview map
			src.client.screen+=armarmorprev // Add it to the screen
		src.inventorystuff.Add(armarmorprev)//for deleting after

	//preview-shoulder
	if(src.cloakinv)
		var/obj/items/cloakprev=new/obj/items// swap the icons around
		for(var/obj/items/X in ilist)
			if(X.icon2==cloakinv)
				cloakprev.icon=X.icon
				cloakprev.icon_state=X.icon_state

		if(cloakprev)
			cloakprev.screen_loc = "shoulderp:1,1" // Make it appear on the preview map
			src.client.screen+=cloakprev // Add it to the screen
		src.inventorystuff.Add(cloakprev)//for deleting after

	//preview-feet
	if(src.shoesinv)
		var/obj/items/shoesprev=new/obj/items// swap the icons around
		for(var/obj/items/X in ilist)
			if(X.icon2==shoesinv)
				shoesprev.icon=X.icon
				shoesprev.icon_state=X.icon_state

		if(shoesprev)
			shoesprev.screen_loc = "feetp:1,1" // Make it appear on the preview map
			src.client.screen+=shoesprev // Add it to the screen
		src.inventorystuff.Add(shoesprev)//for deleting after

	//preview-body
	var/mob/M=new/mob
	M.icon=src.icon
	M.overlays=src.overlays
	M.screen_loc = "previewinventory:1,1" // Make it appear on the preview map
	src.client.screen+=M // Add it to the screen
	src.inventorystuff.Add(M)//for deleting after



mob/verb/openU()
	set hidden=1
	if(winget(src,"supdate","is-visible")=="true")
		winshow(src,"supdate",0)
		winshow(src,"supdate1",0)
		winshow(src,"supdate2",0)
		winshow(src,"supdate3",0)

	else
		//winset(src,"outputbpx","pos=110x510")
		winshow(src,"supdate",1)
		winshow(src,"supdate1",1)
		winshow(src,"supdate2",1)
		winshow(src,"supdate3",1)


mob
	proc

		UpdateHairC()
			var/items = 0
			for(var/obj/haircolor/A in griditems)
				winset(src, "haircolor", "current-cell=[++items]")
				src << output(A, "haircolor")
			winset(src, "haircolor", "current-cell=[items]")



		UpdateHairT()
			var/items = 0
			for(var/obj/hairtypes/B in griditems)
				winset(src, "hairtypes", "current-cell=[++items]")
				src << output(B, "hairtypes")
			winset(src, "hairtypes", "current-cell=[items]")





mob/proc/UpdateLeafC()
	var/items = 0
	for(var/obj/Clans/LeafClans/q in griditems)
		winset(src, "leafclansgrid.leafclans", "current-cell=[++items]")
		src << output(q, "leafclansgrid.leafclans")
	winset(src, "leafclansgrid.leafclans", "current-cell=[items]")


mob/proc/UpdateSunaC()
	var/items = 0
	for(var/obj/Clans/SunaClans/e in griditems)
		winset(src, "sunaclansgrid.sunaclans", "current-cell=[++items]")
		src << output(e, "sunaclansgrid.sunaclans")
	winset(src, "sunaclansgrid.sunaclans", "current-cell=[items]")

mob/proc/UpdateMistC()
	var/items = 0
	for(var/obj/Clans/MistClans/e in griditems)
		winset(src, "mistclansgrid.mistclans", "current-cell=[++items]")
		src << output(e, "mistclansgrid.mistclans")
	winset(src, "mistclansgrid.mistclans", "current-cell=[items]")



mob
	verb
		minimise()
			set hidden=1
			winset(src, "default", "is-minimized = true")


world
	New()
		griditems+=newlist(/obj/hairtypes/hair1,/obj/hairtypes/hair2,/obj/hairtypes/hair3,/obj/hairtypes/hair4)

		griditems+=newlist(/obj/haircolor/haircolor1,/obj/haircolor/haircolor2,/obj/haircolor/haircolor3,/obj/haircolor/haircolor4,
		/obj/haircolor/haircolor5,/obj/haircolor/haircolor6,/obj/haircolor/haircolor7,/obj/haircolor/haircolor8,/obj/haircolor/haircolor9,
		/obj/haircolor/haircolor10,/obj/haircolor/haircolor11,/obj/haircolor/haircolor12,/obj/haircolor/haircolor13,/obj/haircolor/haircolor14,
		/obj/haircolor/haircolor15,/obj/haircolor/haircolor16,/obj/haircolor/haircolor17,/obj/haircolor/haircolor18,/obj/haircolor/haircolor19,
		/obj/haircolor/haircolor20,/obj/haircolor/haircolor21,/obj/haircolor/haircolor_rgb)

		griditems+=newlist(/obj/Clans/LeafClans/Hyuuga,/obj/Clans/LeafClans/Uchiha,/obj/Clans/LeafClans/Nara,/obj/Clans/LeafClans/Akimichi)

		griditems+=newlist(/obj/Clans/SunaClans/Sand_Manipulator,/obj/Clans/SunaClans/Deidara,/obj/Clans/SunaClans/Puppet)

		griditems+=newlist(/obj/Clans/MistClans/Haku,/obj/Clans/MistClans/Kaguya,/obj/Clans/MistClans/Jashin)


		..()
