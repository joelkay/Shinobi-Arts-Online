obj
	HUD
		icon = 'HUD.dmi'
		layer = MOB_LAYER+10
		name = ""
		New(client/C)
			C.screen += src
			..()
		BottomRight
			icon_state = "BR"
		BottomLeft
			icon_state = "BL"
		TopRight
			icon_state = "TR"
		TopLeft
			icon_state = "TL"
		TopMiddle
			icon_state = "TM"
		BottomMiddle
			icon_state = "BM"
		LeftMiddle
			icon_state = "LM"
		RightMiddle
			icon_state = "RM"
		Middle
			icon_state = "M"
		Text
			icon = 'txt.dmi'

		AU   //Arrow Up
			icon_state = "AU"
			Click()
				var/list/I = list()//Just a list
				var/number//Var that helps to list the numbers on the OSI
				var/oy = 13 //The Y Position of the item

				if(usr.OSIPos == 10||usr.contents.len <= 10)//If you have under 10, or 10, items, stop!
					return

				usr.OSIPos--
				number = (usr.OSIPos+1)-10//Setting the top number

				for(var/obj/items/O in usr.client.screen)//Checking for obj/items in your screen
					usr.client.screen -= O //Taking those items off your screen
					O.layer = OBJ_LAYER //Setting their layer back to default

				for(var/obj/HUD/Text/T in usr.client.screen)//Checking for Text on-screen...
					del(T) //Deleting text

				for(var/A = number, A < number+10, A++)//This loop adds items to the I list depending on their order in your contents
					for(var/obj/items/O in usr.contents)//Checking for any objects in your contents...
					//change	//if(usr.contents[A] == O) //If you don't understand list indexs, please look it up in Help
						I.Add(O)//Adding that item

				for(var/i = 13,i > 3, i--)//Loop that sets up the numbers on-screen
					usr.Text(usr,4,i,4,10,"[number]..")
					number++

				usr.Text(usr,4,14,4,10,"--Inventory--")

				for(var/obj/O in I)//Loop that places every object in list I on-screen, and displays their name next to them
					usr.client.screen += O
					O.layer = MOB_LAYER+20
					O.screen_loc = "15,[oy]"
					usr.Text(usr,6,oy,0,10,copytext(O.name,1,21))
					oy--

		AD //Arrow Down
			icon_state = "AD"
			Click()
				var/list/I = list()
				var/number
				var/oy = 13
				var/l
				for(var/obj/items/a in usr.contents)
					if(a)
						l++
				if(l <= 10||usr.OSIPos >= l)
					return
				usr.OSIPos++
				number = (usr.OSIPos+1)-10
				for(var/obj/items/F in usr.client.screen)
					usr.client.screen -= F
				for(var/obj/HUD/Text/T in usr.client.screen)
					del(T)
				for(var/A = number, A < number+10, A++)
					I.Add(usr.contents[A])
				for(var/i = 13,i > 3, i--)
					usr.Text(usr,4,i,4,10,"[number]..")
					number++

				usr.Text(usr,4,14,4,10,"--Inventory--")

				for(var/obj/O in I)
					usr.client.screen += O
					O.layer = MOB_LAYER+20
					O.screen_loc = "15,[oy]"
					usr.Text(usr,6,oy,0,10,copytext(O.name,1,21))
					oy--