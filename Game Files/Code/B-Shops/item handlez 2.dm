if(src.shoesinv)
		var/obj/items/shoesprev// swap the icons around
		for(var/obj/items/X in ilist)
			if(X.icon2==shoesinv)
				shoesprev=X

		if(shoesprev)
			shoesprev.screen_loc = "shoesp:1,1" // Make it appear on the preview map
			src.client.screen+=shoesprev // Add it to the screen