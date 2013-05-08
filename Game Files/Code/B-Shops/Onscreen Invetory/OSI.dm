client
	North()
		if(mob.InventoryUp)
			for(var/obj/HUD/AU/A in usr.client.screen)
				A.Click()
		else
			if(usr.move)
				..()
			else
				return
	South()
		if(mob.InventoryUp)
			for(var/obj/HUD/AD/A in usr.client.screen)
				A.Click()
		else
			if(usr.move)
				..()
			else
				return

mob
	proc
		CreateInventory()//This is the proc that creates the OSI
			var/ox = 5 //The X position of the item
			var/oy = 13 //The Y Position of the item
			var/l
			var/count = 0
			var/number = 1 //Var that helps to list the numbers on-screen

			for(var/obj/items/a in usr.contents)
				if(a)
					l++

			for(var/obj/items/O in usr.client.screen)//Gets rid of any items on-screen
				O.layer = OBJ_LAYER
				usr.client.screen-=O

			for(var/obj/HUD/H in usr.client.screen)//Deletes any HUD on-screen
				del(H)

			usr.move = 0 //Diables movement
			usr.MenuBack()//Creates the OSI Background

			if(l > 10) //If you have more than 10 items...
				usr.OSIPos = 10 //Sets your position in the list to 10, the last item you can see on-screen currently
				var/obj/A = new/obj/HUD/AU(usr.client)//Creates the Up Arrow
				A.screen_loc = "19,23:-16"
				var/obj/B = new/obj/HUD/AD(usr.client)//Creates the Down Arrow
				B.screen_loc = "19,14:16"

			for(var/obj/items/O in usr.contents)//Checking your contents....
				if(count < 10) //If count is still under 10...
					count++
					O.layer = MOB_LAYER+20
					usr.client.screen += O//Add the item to your screen
					O.screen_loc = "15,[oy]" //Set its screen_loc
					usr.Text(usr,ox+1,oy,0,10,copytext(O.name,1,21)) //Displays its name
					oy-- //Makes it so the next item is directly under the current

			for(var/i = 13,i > 3, i--)//Simple loop that displays 1-10 on-screen
				usr.Text(usr,4,i,4,10,"[number]..")
				number++

		MenuBack()//Proc that creates the OSI Background
			var/obj/H = new/obj/HUD/Middle(usr.client)
			var/obj/O = new/obj/HUD/TopLeft(usr.client)
			var/obj/A = new/obj/HUD/TopRight(usr.client)
			var/obj/B = new/obj/HUD/BottomLeft(usr.client)
			var/obj/C = new/obj/HUD/BottomRight(usr.client)
			var/obj/D = new/obj/HUD/TopMiddle(usr.client)
			var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
			var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
			var/obj/G = new/obj/HUD/RightMiddle(usr.client)
			H.screen_loc = "14,24 to 19,14"
			O.screen_loc = "14,24"
			A.screen_loc = "19,24"
			B.screen_loc = "14,14"
			C.screen_loc = "19,14"
			D.screen_loc = "14,24 to 19,24"
			E.screen_loc = "141,4 to 19,14"
			F.screen_loc = "14,14 to 14,24"
			G.screen_loc = "19,14 to 19,24"
			usr.Text(usr,4,14,4,10,"--Inventory--")

