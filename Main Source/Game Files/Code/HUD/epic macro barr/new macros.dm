obj
/////////////////////
	Macros
		mouse_drag_pointer ='drag.dmi'
		var/copied=""
		var/number=0


		proc
			Refresh()
				src.overlays=null
				src.overlays += image('skillhudnum.dmi',icon_state="[src.number]",layer=MOB_LAYER+5)
				src.copied=""


		proc/skill()
			for(var/Skill/S in usr.contents)
				if(S.type==src.copied)
					S.clicker()//perform its click.

		Click()
			src.skill()



		MouseDrop(obj/over_object,src_location,over_location,src_control,over_control,params)
			if(istype(over_object,/obj/Macros))
				for(var/obj/Macros/A in usr.client.screen)
					if(A==over_object)
						A.overlays=src.overlays
						A.overlays -= image('skillhudnum.dmi',icon_state="[src.number]",layer=MOB_LAYER+5)
						A.overlays += image('skillhudnum.dmi',icon_state="[A.number]",layer=MOB_LAYER+5)
						A.name="[src.name]"
						usr.macro["[src.number]"]=src.copied

						src.Refresh()


			else
				src.Refresh()//getting rid of it




		Macro1
			icon='skills hud.dmi'
			icon_state=""
			screen_loc="3:-10,2"
			density=1
			opacity=1
			layer=MOB_LAYER+4
			mouse_drop_zone=1
			number=1//first macro


			New()
				..()
				src.overlays += image('skillhudnum.dmi',icon_state="1",layer=MOB_LAYER+5)
				if(usr.macro["1"])
					for(var/Skill/s in usr.contents)
						if(s.type==usr.macro["1"])
							src.overlays+=image('skills.dmi',icon_state = s.icon_state)
							copied=s.type







		Macro2
			icon='skills hud.dmi'
			icon_state=""
			screen_loc="5:-25,2"
			density=1
			opacity=1
			layer=MOB_LAYER+4
			mouse_drop_zone=1
			number=2//second macro



			New()
				..()
				src.overlays += image('skillhudnum.dmi',icon_state="2",layer=MOB_LAYER+5)
				if(usr.macro["2"])
					for(var/Skill/s in usr.contents)
						if(s.type==usr.macro["2"])
							src.overlays+=image('skills.dmi',icon_state = s.icon_state)
							copied=s.type




		Macro3
			icon='skills hud.dmi'
			icon_state=""
			screen_loc="7:-40,2"
			density=1
			opacity=1
			layer=MOB_LAYER+4
			mouse_drop_zone=1
			number=3//third macro



			New()
				..()
				src.overlays += image('skillhudnum.dmi',icon_state="3",layer=MOB_LAYER+5)
				if(usr.macro["3"])
					for(var/Skill/s in usr.contents)
						if(s.type==usr.macro["3"])
							src.overlays+=image('skills.dmi',icon_state = s.icon_state)
							copied=s.type




		Macro4
			icon='skills hud.dmi'
			icon_state=""
			screen_loc="9:-55,2"
			density=1
			opacity=1
			layer=MOB_LAYER+4
			mouse_drop_zone=1
			number=4//fourth macro



			New()
				..()
				src.overlays += image('skillhudnum.dmi',icon_state="4",layer=MOB_LAYER+5)
				if(usr.macro["4"])
					for(var/Skill/s in usr.contents)
						if(s.type==usr.macro["4"])
							src.overlays+=image('skills.dmi',icon_state = s.icon_state)
							copied=s.type



		Macro5
			icon='skills hud.dmi'
			icon_state=""
			screen_loc="11:-70,2"
			density=1
			opacity=1
			layer=MOB_LAYER+4
			mouse_drop_zone=1
			number=5//fifth macro



			New()
				..()
				src.overlays += image('skillhudnum.dmi',icon_state="5",layer=MOB_LAYER+5)
				if(usr.macro["5"])
					for(var/Skill/s in usr.contents)
						if(s.type==usr.macro["5"])
							src.overlays+=image('skills.dmi',icon_state = s.icon_state)
							copied=s.type




		Macro6
			icon='skills hud.dmi'
			icon_state=""
			screen_loc="13:-85,2"
			density=1
			opacity=1
			layer=MOB_LAYER+4
			mouse_drop_zone=1
			number=6//sixth macro



			New()
				..()
				src.overlays += image('skillhudnum.dmi',icon_state="6",layer=MOB_LAYER+5)
				if(usr.macro["6"])

					for(var/Skill/s in usr.contents)
						if(s.type==usr.macro["6"])
							src.overlays+=image('skills.dmi',icon_state = s.icon_state)
							copied=s.type




		Macro7
			icon='skills hud.dmi'
			icon_state=""
			screen_loc="15:-100,2"
			density=1
			opacity=1
			layer=MOB_LAYER+4
			mouse_drop_zone=1
			number=7//seventh macro



			New()
				..()
				src.overlays += image('skillhudnum.dmi',icon_state="7",layer=MOB_LAYER+5)
				if(usr.macro["7"])
					for(var/Skill/s in usr.contents)
						if(s.type==usr.macro["7"])
							src.overlays+=image('skills.dmi',icon_state = s.icon_state)
							copied=s.type



		Macro8
			icon='skills hud.dmi'
			icon_state=""
			screen_loc="17:-115,2"
			density=1
			opacity=1
			layer=MOB_LAYER+4
			mouse_drop_zone=1
			number=8//eigth macro



			New()
				..()
				src.overlays += image('skillhudnum.dmi',icon_state="8",layer=MOB_LAYER+5)
				if(usr.macro["8"])
					for(var/Skill/s in usr.contents)
						if(s.type==usr.macro["8"])
							src.overlays+=image('skills.dmi',icon_state = s.icon_state)
							copied=s.type


		Macro9
			icon='skills hud.dmi'
			icon_state=""
			screen_loc="19:-130,2"
			density=1
			opacity=1
			layer=MOB_LAYER+4
			mouse_drop_zone=1
			number=9//ninth macro


			New()
				..()
				src.overlays += image('skillhudnum.dmi',icon_state="9",layer=MOB_LAYER+5)
				if(usr.macro["9"])
					for(var/Skill/s in usr.contents)
						if(s.type==usr.macro["9"])
							src.overlays+=image('skills.dmi',icon_state = s.icon_state)
							copied=s.type





		Macro10
			icon='skills hud.dmi'
			icon_state=""
			screen_loc="21:-145,2"
			density=1
			opacity=1
			layer=MOB_LAYER+4
			mouse_drop_zone=1
			number=10//tenth macro



			New()
				..()
				src.overlays += image('skillhudnum.dmi',icon_state="0",layer=MOB_LAYER+5,pixel_y=-4)
				if(usr.macro["10"])
					for(var/Skill/s in usr.contents)
						if(s.type==usr.macro["10"])
							src.overlays+=image('skills.dmi',icon_state = s.icon_state)
							copied=s.type



