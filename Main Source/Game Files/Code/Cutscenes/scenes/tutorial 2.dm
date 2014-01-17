obj
	rope
		icon='denseobj.dmi'
		density=1

		Cross(atom/movable/a)
			if(ismob(a))
				var/mob/A=a
				if(!A.tut2)
					A.tutorial2()
				spawn(2)
					del(src)
			..()


mob/var
	tut2=0
	tut3=0

mob/var/tmp/mob/tutor

mob
	proc
		tutorial1()
			/// WHAT IS SAO////
			var/mob/cutscene/iruka/a=new(src.name)
			//src.loc=locate(src.map3.x1+1,src.map3.y1+8,src.map3.z1)//16,6,9//mobs loc
			a.loc=locate(src.map3.x1+3,src.map3.y1+8,src.map3.z1)//19,6,9 to the right of mob
			src.dir=EAST
			a.dir=WEST
			src.tutor=a

			var/mob/face=new/mob
			face.icon='irukaface.dmi'
			var/mob/preview=new/mob
			preview.icon='baseface.dmi'

			var/iconName2 = "popup[ckey(face)]_flattened.dmi"
			// Copy the file to the rsc manually
			var/icon/c = fcopy_rsc(getFlatIcon(face))
			// Send the icon to src's local cache
			src<<browse_rsc(c, iconName2)

			var/iconName = "popup[ckey(preview)]_flattened.dmi"
			// Copy the file to the rsc manually
			var/icon/b = fcopy_rsc(getFlatIcon(preview))
			// Send the icon to src's local cache
			src<<browse_rsc(b, iconName)


			if(Apopup(src,"Right Hello there [src.name], you are probably wondering how and why you are chasing a sound jounin..",1,face))
				Apopup(src,"Well we needed a way to break the ice. Anyway my name is....actually i can't tell you yet..",0,face)

			else
				Apopup(src,"No? hmm well anyway my name is....actually i can't tell you yet..",0,face)

			Apopup(src,"But i will show you the ropes; look in that corner at the far right..",0,face)

			src.canmove=1

			var/obj/rope/ra = new/obj/rope
			var/obj/rope/rb = new/obj/rope
			var/obj/rope/rc = new/obj/rope
			var/obj/rope/rd = new/obj/rope
			var/obj/rope/re = new/obj/rope

			ra.loc = locate(src.map3.x1+25,src.map3.y1+7,src.map3.z1)
			rb.loc = locate(src.map3.x1+25,src.map3.y1+8,src.map3.z1)
			rc.loc = locate(src.map3.x1+25,src.map3.y1+9,src.map3.z1)
			rd.loc = locate(src.map3.x1+25,src.map3.y1+10,src.map3.z1)
			re.loc = locate(src.map3.x1+25,src.map3.y1+11,src.map3.z1)

		tutorial2()

			tut2=1
			var/mob/face=new/mob
			face.icon='irukaface.dmi'
			var/mob/preview=new/mob
			preview.icon='baseface.dmi'

			var/iconName2 = "popup[ckey(face)]_flattened.dmi"
			// Copy the file to the rsc manually
			var/icon/c = fcopy_rsc(getFlatIcon(face))
			// Send the icon to src's local cache
			src<<browse_rsc(c, iconName2)

			var/iconName = "popup[ckey(preview)]_flattened.dmi"
			// Copy the file to the rsc manually
			var/icon/b = fcopy_rsc(getFlatIcon(preview))
			// Send the icon to src's local cache
			src<<browse_rsc(b, iconName)

			//var/obj/z=new/obj
			//z.loc=locate(src.map2.x1+15,src.map2.y1+6,src.map2.z1) //camera
			//src.client.eye=z
			//walk_towards(z,o,3)//scenic


			Apopup(src,"You look and see some rope.",0,preview)
			src.canmove=0

			if(!tut3)tutorial3()
			else
				tutorial4()

		tutorial3()

			tut3=1
			var/mob/face=new/mob
			face.icon='irukaface.dmi'
			var/mob/preview=new/mob
			preview.icon='baseface.dmi'

			var/iconName2 = "popup[ckey(face)]_flattened.dmi"
			// Copy the file to the rsc manually
			var/icon/c = fcopy_rsc(getFlatIcon(face))
			// Send the icon to src's local cache
			src<<browse_rsc(c, iconName2)

			var/iconName = "popup[ckey(preview)]_flattened.dmi"
			// Copy the file to the rsc manually
			var/icon/b = fcopy_rsc(getFlatIcon(preview))
			// Send the icon to src's local cache
			src<<browse_rsc(b, iconName)
			src.loc=locate(src.map3.x1+5,src.map3.y1+8,src.map3.z1)//19,6,9 to the right of mob
			src.dir=WEST
			src.tutor.dir=EAST

			Apopup(src,"Hahaha get it; i showed you the ropes, hahaha.",0,face)

			Apopup(src,"Anyway on a more serious note, let me show you the ropes ; look in that corner at the far right..",0,face)

			src.canmove=1
			src.tut2=0//make them do it again

			var/obj/rope/ra = new/obj/rope
			var/obj/rope/rb = new/obj/rope
			var/obj/rope/rc = new/obj/rope
			var/obj/rope/rd = new/obj/rope
			var/obj/rope/re = new/obj/rope

			ra.loc = locate(src.map3.x1+25,src.map3.y1+7,src.map3.z1)
			rb.loc = locate(src.map3.x1+25,src.map3.y1+8,src.map3.z1)
			rc.loc = locate(src.map3.x1+25,src.map3.y1+9,src.map3.z1)
			rd.loc = locate(src.map3.x1+25,src.map3.y1+10,src.map3.z1)
			re.loc = locate(src.map3.x1+25,src.map3.y1+11,src.map3.z1)


		tutorial4()

			var/mob/face=new/mob
			face.icon='irukaface.dmi'
			var/mob/preview=new/mob
			preview.icon='baseface.dmi'

			var/iconName2 = "popup[ckey(face)]_flattened.dmi"
			// Copy the file to the rsc manually
			var/icon/c = fcopy_rsc(getFlatIcon(face))
			// Send the icon to src's local cache
			src<<browse_rsc(c, iconName2)

			var/iconName = "popup[ckey(preview)]_flattened.dmi"
			// Copy the file to the rsc manually
			var/icon/b = fcopy_rsc(getFlatIcon(preview))
			// Send the icon to src's local cache
			src<<browse_rsc(b, iconName)

			src.loc=locate(src.map3.x1+5,src.map3.y1+8,src.map3.z1)//19,6,9 to the right of mob
			src.dir=WEST
			src.tutor.dir=EAST

			Apopup(src,"once a fool...always a fool hahaha.",0,face)

			Apopup(src,"While we wait for kakashi and iruka to lure that sound nin here let me tell you abit about Shinobi Arts Online..",0,face)

			Apopup(src,"This is not your normal hack and slash BYOND rip, this is Spartaaa!.",0,face)

			Apopup(src,"Your not funny dude..",0,preview)

			Apopup(src,"your not laughing... do you want me to leave?, ofcourse not you cant even fight!",0,face)

			Apopup(src,"Yes I can!.",0,preview)

			Apopup(src,"really? fine ill let you fight my kage bunshin!",0,face)

			///SUMMON UP BUNSHINS///
			var/mob/cutscene/tempBunshin/a=new(src.name)
			a.loc=locate(src.map3.x1+4,src.map3.y1+8,src.map3.z1)//19,6,9 to the right of mob
			a.dir=EAST
			src.canmove=1//give him time to attack

			while(!src.bunshinattacks)
				sleep(10)

			/*
			Apopup(src,"oh erm your better than i thought, now fight 10!.",0,face)

			src.canmove=0//give him time to attack
			///SUMMON UP MORE BUNSHINS///
			for(var/x=0,x++,x<10)
				var/mob/cutscene/tempBunshin/a=new(src.name)
				a.loc=locate(src.map3.x1+4,src.map3.y1+8,src.map3.z1)//19,6,9 to the right of mob
				a.dir=EAST

			src.canmove=1//give him time to attack

			while(!src.bunshinattacks<11)
				sleep(10)
			*/

			Apopup(src,"very good [src.name] but the journey ahead is alot harder.",0,face)

			popup(src,"hud")

			/////////////////////////////////////ADD MORE TUTRORIAL PARTS/////////////////////////////////

			Apopup(src,"Now go join the world and explore some quests and build your character!",0,face)

			/////////

			spawn(30)
				src.scenesdone()