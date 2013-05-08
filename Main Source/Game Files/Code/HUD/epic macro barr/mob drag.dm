/////////////////////////////MACRO TEST////////////////////////////
mob
	var/style=0



obj
	skillhud
		icon='skills hud.dmi'
		name=""
		icon_state="open"
		screen_loc="1:5,2"//last here
		density=1
		opacity=1
		layer=MOB_LAYER+4
		mouse_drop_zone=0
		var/clicked=0


		Click()
			if(!clicked)///////////turn them on and off
				src.icon_state="open"
				usr.client.screen+=new/obj/Macros/Macro1
				usr.client.screen+=new/obj/Macros/Macro2
				usr.client.screen+=new/obj/Macros/Macro3
				usr.client.screen+=new/obj/Macros/Macro4
				usr.client.screen+=new/obj/Macros/Macro5
				usr.client.screen+=new/obj/Macros/Macro6
				usr.client.screen+=new/obj/Macros/Macro7
				usr.client.screen+=new/obj/Macros/Macro8
				usr.client.screen+=new/obj/Macros/Macro9
				usr.client.screen+=new/obj/Macros/Macro10
				usr.client.screen+=new/obj/tip
				usr.client.screen+=new/obj/nextscroll
				usr.client.screen+=new/obj/nextscroll2
				src.clicked=1
				usr.client.Resolution()


			else
				for(var/obj/Macros/a in usr.client.screen)
					del(a)
				for(var/obj/tip/b in usr.client.screen)
					del(b)
				for(var/obj/nextscroll/c in usr.client.screen)
					del(c)
				for(var/obj/nextscroll2/d in usr.client.screen)
					del(d)
				src.icon_state="open"
				src.clicked=0
				usr.client.Resolution()





mob
	proc
		showmacros()
			set category = null
			initiatebars()
			src.client.screen+=new/obj/skillhud





obj
	tip
		icon='skills hud.dmi'
		name=""
		icon_state="tip"
		screen_loc="22:-128,2"
		density=1
		opacity=1
		layer=MOB_LAYER+4
		mouse_drop_zone=0


obj
	nextscroll
		icon='skills hud.dmi'
		name=""
		icon_state="open2"
		screen_loc="22:-127,2"
		density=1
		opacity=1
		layer=MOB_LAYER+4
		mouse_drop_zone=0

obj
	nextscroll2
		icon='skills hud.dmi'
		name=""
		icon_state="open3"
		screen_loc="22:-97,2"
		density=1
		opacity=1
		layer=MOB_LAYER+4
		mouse_drop_zone=0




mob
	var
		macro[11]//safety lol

