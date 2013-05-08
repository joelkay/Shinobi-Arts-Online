mob
	proc
		tutorial1()
			/// WHAT IS SAO////
			var/mob/cutscene/iruka/a=new(src.name)
			//src.loc=locate(src.map3.x1+1,src.map3.y1+8,src.map3.z1)//16,6,9//mobs loc
			a.loc=locate(src.map3.x1+3,src.map3.y1+8,src.map3.z1)//19,6,9 to the right of mob
			src.dir=EAST
			a.dir=WEST

			switch(alert(src,"Right Hello there [src.name], you are probably wondering how and why you are chasing a sound jounin..","?","Yes","No"))
				if("No")
					alert(src,"No? hmm well anyway my name is....actually i can't tell you yet..","?")
				if("Yes")
					alert(src,"Well we needed a way to break the ice. Anyway my name is....actually i can't tell you yet..","?")

			alert(src,"But i will show you the ropes; look in that corner at the far right..","?")

			src<<"You found ropes."

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