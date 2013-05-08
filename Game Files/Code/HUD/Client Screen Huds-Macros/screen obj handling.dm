
obj
	xmeter1 // hud mana meter
		name = "XP"
		icon = 'xpglobe.dmi'
		screen_loc = "1,15"
		density=1
		opacity=1
		layer=MOB_LAYER+4
		Click() // haha. just like above, but on the exp meter
			usr<<"Experience:[usr.exp]/[usr.maxexp],Gain rate:[usr.learningcurve]"
			usr<<"You have [usr.attribute_Points] attribute points to be used.."


	Byakuugan
		name = "Byakuugan"
		icon = 'eyes.dmi'
		icon_state="Byakugan"
		screen_loc = "18:5,3"
		density=1
		opacity=1
		layer=MOB_LAYER+4

	Sharingana
		name = "Sharingana"
		icon = 'eyes.dmi'
		icon_state="Sharingana"
		screen_loc = "18:5,3"
		density=1
		opacity=1
		layer=MOB_LAYER+4

	Sharinganb
		name = "Sharinganb"
		icon = 'eyes.dmi'
		icon_state="Sharinganb"
		screen_loc = "18:5,3"
		density=1
		opacity=1
		layer=MOB_LAYER+4

	Sharinganc
		name = "Sharinganc"
		icon = 'eyes.dmi'
		icon_state="Sharinganc"
		screen_loc = "18:5,3"
		density=1
		opacity=1
		layer=MOB_LAYER+4

	Body_Replacement_Technique
		name = "Body_Replacement_Technique"
		icon = 'eyes.dmi'
		icon_state="Body_Replacement_Technique"
		screen_loc = "18:5,3"
		density=1
		opacity=1
		layer=MOB_LAYER+4

mob
	proc
		inactivity()
			set background = 1
			spawn(10)//every sec.
				if(src.client)
					if(src.client.inactivity>1000)// modify 6000 to how long you want it.
						src<<"Flagged for inactivity!.."
						//src.close()//remove from game.
					else
						src.inactivity()