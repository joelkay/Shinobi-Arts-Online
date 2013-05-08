mob
	verb
		number1()
			set hidden =1
			if(!usr.pk)
				usr<<"You are in a non pk zone"
				return
			if(usr.macroed1)
				if(usr.macro1sindex=="Sharingancopy")
					usr.Sharingancopy()
				else
					if(!usr.cooldown[usr.macro1sindex] && usr.chakra>usr.macroonechak)
						usr.chakra-=usr.macroonechak

						spawn()usr.Skills(usr.macro1sindex)

						usr.cooldown[usr.macro1sindex]=1
						//for(var/obj///src.name/d in usr.contents)
							//d.overlays+='dull.dmi'
						//src.overlays+='dull.dmi'
						sleep(usr.macrolcool*10)
						//src.overlays-='dull.dmi'
						//for(var/obj///src.name/r in usr.contents)
							//r.overlays+='dull.dmi'
						usr.cooldown[usr.macro1sindex]=0
					else
						if(usr.cooldown[usr.macro1sindex])
							usr<<"You have to wait [usr.macrolcool] seconds to use this skill again"
							sleep(usr.macrolcool*10)
							//for(var/obj///src.name/e in usr.contents)
								//e.overlays-='dull.dmi'
							//src.overlays-='dull.dmi'
							usr.cooldown[usr.macro1sindex]=0
						else if(usr.chakra<usr.macroonechak)
							usr<<"Not enough chakra [usr.chakra]/[usr.macroonechak]"
			else
				usr<<"Set This Macro"



		number2()
			set hidden =1
			if(!usr.pk)
				usr<<"You are in a non pk zone"
				return
			if(usr.macroed2)
				if(usr.macro2sindex=="Sharingancopy")
					usr.Sharingancopy()
				else
					if(!usr.cooldown[usr.macro2sindex] && usr.chakra>usr.macro2chak)
						usr.chakra-=usr.macro2chak

						spawn()usr.Skills(usr.macro2sindex)

						usr.cooldown[usr.macro2sindex]=1
						//src.overlays+='dull.dmi'
						sleep(usr.macro2cool*10)
						//src.overlays-='dull.dmi'
						usr.cooldown[usr.macro2sindex]=0
					else
						if(usr.cooldown[usr.macro2sindex])
							usr<<"You have to wait [usr.macro2cool] seconds to use this skill again"
							sleep(usr.macro2cool*10)
							//src.overlays-='dull.dmi'
							usr.cooldown[usr.macro2sindex]=0
						else if(usr.chakra<usr.macro2chak)
							usr<<"Not enough chakra [usr.chakra]/[usr.macro2chak]"
			else
				usr<<"Set This Macro"


		number3()
			set hidden =1
			if(!usr.pk)
				usr<<"You are in a non pk zone"
				return
			if(usr.macroed3)
				if(usr.macro3sindex=="Sharingancopy")
					usr.Sharingancopy()
				else
					if(!usr.cooldown[usr.macro3sindex] && usr.chakra>usr.macro3chak)
						usr.chakra-=usr.macro3chak

						spawn()usr.Skills(usr.macro3sindex)

						usr.cooldown[usr.macro3sindex]=1
						//src.overlays+='dull.dmi'
						sleep(usr.macro3cool*10)
						//src.overlays-='dull.dmi'
						usr.cooldown[usr.macro3sindex]=0
					else
						if(usr.cooldown[usr.macro3sindex])
							usr<<"You have to wait [usr.macro3cool] seconds to use this skill again"
							sleep(usr.macro3cool*10)
							//src.overlays-='dull.dmi'
							usr.cooldown[usr.macro3sindex]=0
						else if(usr.chakra<usr.macro3chak)
							usr<<"Not enough chakra [usr.chakra]/[usr.macro3chak]"
			else
				usr<<"Set This Macro"


		number4()
			set hidden=1
			if(!usr.pk)
				usr<<"You are in a non pk zone"
				return
			if(usr.macroed4)
				if(usr.macro4sindex=="Sharingancopy")
					usr.Sharingancopy()
				else
					if(!usr.cooldown[usr.macro4sindex] && usr.chakra>usr.macro4chak)
						usr.chakra-=usr.macro4chak

						spawn()usr.Skills(usr.macro4sindex)

						usr.cooldown[usr.macro4sindex]=1
						//src.overlays+='dull.dmi'
						sleep(usr.macro4cool*10)
						//src.overlays-='dull.dmi'
						usr.cooldown[usr.macro4sindex]=0
					else
						if(usr.cooldown[usr.macro4sindex])
							usr<<"You have to wait [usr.macro4cool] seconds to use this skill again"
							sleep(usr.macro4cool*10)
							//src.overlays-='dull.dmi'
							usr.cooldown[usr.macro4sindex]=0
						else if(usr.chakra<usr.macro4chak)
							usr<<"Not enough chakra [usr.chakra]/[usr.macro4chak]"
			else
				usr<<"Set This Macro"


		number5()
			set hidden=1
			if(!usr.pk)
				usr<<"You are in a non pk zone"
				return
			if(usr.macroed5)
				if(usr.macro5sindex=="Sharingancopy")
					usr.Sharingancopy()
				else
					if(!usr.cooldown[usr.macro5sindex] && usr.chakra>usr.macro5chak)
						usr.chakra-=usr.macro5chak

						spawn()usr.Skills(usr.macro5sindex)

						usr.cooldown[usr.macro5sindex]=1
						//src.overlays+='dull.dmi'
						sleep(usr.macro5cool*10)
						//src.overlays-='dull.dmi'
						usr.cooldown[usr.macro5sindex]=0
					else
						if(usr.cooldown[usr.macro5sindex])
							usr<<"You have to wait [usr.macro5cool] seconds to use this skill again"
							sleep(usr.macro5cool*10)
							//src.overlays-='dull.dmi'
							usr.cooldown[usr.macro5sindex]=0
						else if(usr.chakra<usr.macro5chak)
							usr<<"Not enough chakra [usr.chakra]/[usr.macro5chak]"
			else
				usr<<"Set This Macro"



		number6()
			set hidden=1
			if(!usr.pk)
				usr<<"You are in a non pk zone"
				return
			if(usr.macroed6)
				if(usr.macro6sindex=="Sharingancopy")
					usr.Sharingancopy()
				else
					if(!usr.cooldown[usr.macro6sindex] && usr.chakra>usr.macro6chak)
						usr.chakra-=usr.macro6chak

						spawn()usr.Skills(usr.macro6sindex)

						usr.cooldown[usr.macro6sindex]=1
						//src.overlays+='dull.dmi'
						sleep(usr.macro6cool*10)
						//src.overlays-='dull.dmi'
						usr.cooldown[usr.macro6sindex]=0
					else
						if(usr.cooldown[usr.macro6sindex])
							usr<<"You have to wait [usr.macro6cool] seconds to use this skill again"
							sleep(usr.macro6cool*10)
							//src.overlays-='dull.dmi'
							usr.cooldown[usr.macro6sindex]=0
						else if(usr.chakra<usr.macro6chak)
							usr<<"Not enough chakra [usr.chakra]/[usr.macro6chak]"
			else
				usr<<"Set This Macro"

		number7()
			set hidden=1
			if(!usr.pk)
				usr<<"You are in a non pk zone"
				return
			if(usr.macroed7)
				if(usr.macro7sindex=="Sharingancopy")
					usr.Sharingancopy()
				else
					if(!usr.cooldown[usr.macro7sindex] && usr.chakra>usr.macro7chak)
						usr.chakra-=usr.macro7chak

						spawn()usr.Skills(usr.macro7sindex)

						usr.cooldown[usr.macro7sindex]=1
						//src.overlays+='dull.dmi'
						sleep(usr.macro7cool*10)
						//src.overlays-='dull.dmi'
						usr.cooldown[usr.macro7sindex]=0
					else
						if(usr.cooldown[usr.macro7sindex])
							usr<<"You have to wait [usr.macro7cool] seconds to use this skill again"
							sleep(usr.macro7cool*10)
							//src.overlays-='dull.dmi'
							usr.cooldown[usr.macro7sindex]=0
						else if(usr.chakra<usr.macro7chak)
							usr<<"Not enough chakra [usr.chakra]/[usr.macro7chak]"
			else
				usr<<"Set This Macro"

		number8()
			set hidden=1
			if(!usr.pk)
				usr<<"You are in a non pk zone"
				return
			if(usr.macroed8)
				if(usr.macro8sindex=="Sharingancopy")
					usr.Sharingancopy()
				else
					if(!usr.cooldown[usr.macro8sindex] && usr.chakra>usr.macro8chak)
						usr.chakra-=usr.macro8chak

						spawn()usr.Skills(usr.macro8sindex)

						usr.cooldown[usr.macro8sindex]=1
						//src.overlays+='dull.dmi'
						sleep(usr.macro8cool*10)
						//src.overlays-='dull.dmi'
						usr.cooldown[usr.macro8sindex]=0
					else
						if(usr.cooldown[usr.macro8sindex])
							usr<<"You have to wait [usr.macro8cool] seconds to use this skill again"
							sleep(usr.macro8cool*10)
							//src.overlays-='dull.dmi'
							usr.cooldown[usr.macro8sindex]=0
						else if(usr.chakra<usr.macro8chak)
							usr<<"Not enough chakra [usr.chakra]/[usr.macro8chak]"
			else
				usr<<"Set This Macro"


		number9()
			set hidden=1
			if(!usr.pk)
				usr<<"You are in a non pk zone"
				return
			if(usr.macroed9)
				if(usr.macro9sindex=="Sharingancopy")
					usr.Sharingancopy()
				else
					if(!usr.cooldown[usr.macro9sindex] && usr.chakra>usr.macro9chak)
						usr.chakra-=usr.macro9chak

						spawn()usr.Skills(usr.macro9sindex)

						usr.cooldown[usr.macro9sindex]=1
						//src.overlays+='dull.dmi'
						sleep(usr.macro9cool*10)
						//src.overlays-='dull.dmi'
						usr.cooldown[usr.macro9sindex]=0
					else
						if(usr.cooldown[usr.macro9sindex])
							usr<<"You have to wait [usr.macro9cool] seconds to use this skill again"
							sleep(usr.macro9cool*10)
							//src.overlays-='dull.dmi'
							usr.cooldown[usr.macro9sindex]=0
						else if(usr.chakra<usr.macro9chak)
							usr<<"Not enough chakra [usr.chakra]/[usr.macro9chak]"
			else
				usr<<"Set This Macro"


		number0()
			set hidden =1
			if(!usr.pk)
				usr<<"You are in a non pk zone"
				return
			if(usr.macroed10)
				if(usr.macro10sindex=="Sharingancopy")
					usr.Sharingancopy()
				else
					if(!usr.cooldown[usr.macro10sindex] && usr.chakra>usr.macro10chak)
						usr.chakra-=usr.macro10chak

						spawn()usr.Skills(usr.macro10sindex)

						usr.cooldown[usr.macro10sindex]=1
						//src.overlays+='dull.dmi'
						sleep(usr.macro10cool*10)
						//src.overlays-='dull.dmi'
						usr.cooldown[usr.macro10sindex]=0
					else
						if(usr.cooldown[usr.macro10sindex])
							usr<<"You have to wait [usr.macro10cool] seconds to use this skill again"
							sleep(usr.macro10cool*10)
							//src.overlays-='dull.dmi'
							usr.cooldown[usr.macro10sindex]=0
						else if(usr.chakra<usr.macro10chak)
							usr<<"Not enough chakra [usr.chakra]/[usr.macro10chak]"
			else
				usr<<"Set This Macro"



		numbermin()
			set hidden=1
			if(!usr.pk)
				usr<<"You are in a non pk zone"
				return
			if(usr.macroed11)
				if(usr.macro11sindex=="Sharingancopy")
					usr.Sharingancopy()
				else
					if(!usr.cooldown[usr.macro11sindex] && usr.chakra>usr.macro11chak)
						usr.chakra-=usr.macro11chak

						spawn()usr.Skills(usr.macro11sindex)

						usr.cooldown[usr.macro11sindex]=1
						//src.overlays+='dull.dmi'
						sleep(usr.macro11cool*10)
						//src.overlays-='dull.dmi'
						usr.cooldown[usr.macro11sindex]=0
					else
						if(usr.cooldown[usr.macro11sindex])
							usr<<"You have to wait [usr.macro11cool] seconds to use this skill again"
							sleep(usr.macro11cool*10)
							//src.overlays-='dull.dmi'
							usr.cooldown[usr.macro11sindex]=0
						else if(usr.chakra<usr.macro11chak)
							usr<<"Not enough chakra [usr.chakra]/[usr.macro11chak]"
			else
				usr<<"Set This Macro"



		numperplus()
			set hidden=1
			if(!usr.pk)
				usr<<"You are in a non pk zone"
				return
			if(usr.macroed12)
				if(usr.macro12sindex=="Sharingancopy")
					usr.Sharingancopy()
				else
					if(!usr.cooldown[usr.macro12sindex] && usr.chakra>usr.macro12chak)
						usr.chakra-=usr.macro12chak

						spawn()usr.Skills(usr.macro12sindex)

						usr.cooldown[usr.macro12sindex]=1
						//src.overlays+='dull.dmi'
						sleep(usr.macro12cool*10)
						//src.overlays-='dull.dmi'
						usr.cooldown[usr.macro12sindex]=0
					else
						if(usr.cooldown[usr.macro12sindex])
							usr<<"You have to wait [usr.macro12cool] seconds to use this skill again"
							sleep(usr.macro12cool*10)
							//src.overlays-='dull.dmi'
							usr.cooldown[usr.macro12sindex]=0
						else if(usr.chakra<usr.macro12chak)
							usr<<"Not enough chakra [usr.chakra]/[usr.macro12chak]"
			else
				usr<<"Set This Macro"


		numberbrack()
			set hidden=1
			if(!usr.pk)
				usr<<"You are in a non pk zone"
				return
			if(usr.macroed13)
				if(usr.macro13sindex=="Sharingancopy")
					usr.Sharingancopy()
				else
					if(!usr.cooldown[usr.macro13sindex] && usr.chakra>usr.macro13chak)
						usr.chakra-=usr.macro13chak

						spawn()usr.Skills(usr.macro13sindex)

						usr.cooldown[usr.macro13sindex]=1
						//src.overlays+='dull.dmi'
						sleep(usr.macro13cool*10)
						//src.overlays-='dull.dmi'
						usr.cooldown[usr.macro13sindex]=0
					else
						if(usr.cooldown[usr.macro13sindex])
							usr<<"You have to wait [usr.macro13cool] seconds to use this skill again"
							sleep(usr.macro13cool*10)
							//src.overlays-='dull.dmi'
							usr.cooldown[usr.macro13sindex]=0
						else if(usr.chakra<usr.macro13chak)
							usr<<"Not enough chakra [usr.chakra]/[usr.macro13chak]"
			else
				usr<<"Set This Macro"



obj
	macronumber
		icon='number.dmi'
		icon_state="1"
		screen_loc="2,2"
		density=1
		opacity=1
		layer=MOB_LAYER+4
	macronumber2
		icon='number.dmi'
		icon_state="2"
		screen_loc="3,2"
		density=1
		opacity=1
		layer=MOB_LAYER+4
	macronumber3
		icon='number.dmi'
		icon_state="3"
		screen_loc="4,2"
		density=1
		opacity=1
		layer=MOB_LAYER+4
	macronumber4
		icon='number.dmi'
		icon_state="4"
		screen_loc="5,2"
		density=1
		opacity=1
		layer=MOB_LAYER+4
	macronumber5
		icon='number.dmi'
		icon_state="5"
		screen_loc="6,2"
		density=1
		opacity=1
		layer=MOB_LAYER+4
	macronumber6
		icon='number.dmi'
		icon_state="6"
		screen_loc="7,2"
		density=1
		opacity=1
		layer=MOB_LAYER+4
	macronumber7
		icon='number.dmi'
		screen_loc="8,2"
		icon_state="7"
		density=1
		opacity=1
		layer=MOB_LAYER+4
	macronumber8
		icon='number.dmi'
		screen_loc="9,2"
		icon_state="8"
		density=1
		opacity=1
		layer=MOB_LAYER+4
	macronumber9
		icon='number.dmi'
		screen_loc="10,2"
		icon_state="9"
		density=1
		opacity=1
		layer=MOB_LAYER+4
	macronumber10
		icon='number.dmi'
		screen_loc="11,2"
		icon_state="0"
		density=1
		opacity=1
		layer=MOB_LAYER+4
	macronumber11
		icon='number.dmi'
		screen_loc="12,2"
		icon_state="-"
		density=1
		opacity=1
		layer=MOB_LAYER+4
	macronumber12
		icon='number.dmi'
		screen_loc="13,2"
		icon_state="+"
		density=1
		opacity=1
		layer=MOB_LAYER+5
	macronumber13
		icon='number.dmi'
		screen_loc="14,2"
		icon_state="br"
		density=1
		opacity=1
		layer=MOB_LAYER+5

