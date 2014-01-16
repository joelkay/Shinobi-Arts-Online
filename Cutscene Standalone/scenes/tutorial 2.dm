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


mob/var/tut2=0

mob
	proc
		tutorial1()
			/// WHAT IS SAO////
			var/mob/cutscene/iruka/a=new(src.name)
			//src.loc=locate(src.map3.x1+1,src.map3.y1+8,src.map3.z1)//16,6,9//mobs loc
			a.loc=locate(src.map3.x1+3,src.map3.y1+8,src.map3.z1)//19,6,9 to the right of mob
			src.dir=EAST
			a.dir=WEST

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

			src<<"Hahaha get it; i showed you the ropes, hahaha."
			src<<"Anyway on a more serious note, let me show you the ropes ; look in that corner at the far right.."

			src<<"once a fool...always a fool hahaha."

			src<<"Okay enough, those ropes you have there, i want you to make a trip wire. left click the rope and place it in the parts shown in red.."

			src<<"Good"
			src<<"Notice you need two ropes for a trip wire.."

			src<<"While we wait for kakashi and iruka to lure that sound nin here let me tell you abit about Shinobi Arts Online.."
			src<<"This is not your normal hack and slash BYOND rip, this is Spartaaa!."
			src<<"your not laughing... do you want me to leave?, ofcourse not you cant even fight!."
			src<<"really? fine ill let you fight my kage bunshin!."
			src<<"oh erm your better than i thought, now fight 10!."

			src<<"Jishiro stop playing and teach [src.name] the controls we are about to get into a war here.."//some other jounin watching this.
			src<<"Okay then"

			src<<"[src.name] look at the red flashing image on your hud, this is....."

			spawn(30)
				src.scenesdone()