//Targeting example
//By: Salarn  salarn@muchneededrest.com
//A collection of commands to have visual targeting
//and can be used for combat, but using usr.enemy
//in attacks.





mob
	DblClick()
		..()
		DeleteTarget()
		var/image/I = image('selected.dmi',src,"",999) // create a new target on the source.
		usr<<I // make it so only u can see the target
		usr.targeted=src // make your target variable source name.
		usr<<"<FONT COLOR = #CCCC99>Targetting [src] Health:[round(src.health)]/[src.max_health] Chakra:[round(src.chakra)]/[src.max_chakra] Life:[round(src.life)]/100</FONT>" /// a verb to see who your targetting.
		if(usr==src) return
		spawn() usr.enemybars()




mob
	verb
		nearesttarget()
			set hidden=1
			var/mob/M=cMob(src,10)//closest mob
			if(M==src) return

			DeleteTarget()

			var/image/I = image('selected.dmi',M,"",999) // create a new target on the source. layer 999
			src<<I // make it so only u can see the target
			src.targeted=M // make your target variable source name.
			if(!M) return//stop dem errorZ
			src<<"<FONT COLOR = red>Targetting [M] Health:[round(M.health)]/[M.max_health] Chakra:[round(M.chakra)]/[M.max_chakra] Life:[round(M.life)]/100</FONT>" /// a verb to see who your targetting.
			spawn() src.enemybars()


proc/cMob(atom/source,maxdist)
	var/vch=0
	for(var/x=1,x<=maxdist,x++)
		for(var/mob/M in ohearers(x,source))
			return M
			vch++
			break//make sure it doesnt continue this inner for-loop

		if(vch) break//make sure it doesnt continue the outer for-loop
	if(!vch) return 0//returns noth




mob/proc/DeleteTarget()
	set background=1
	src.target=null
	src.targeted=null
	for(var/image/x in usr.client.images)
		if(x.icon=='selected.dmi')
			del(x)



mob
	verb
		Untarget()
			set hidden=1
			usr.DeleteTarget()
			if(ismob(target))
				usr<<"You untarget [target]"
				for(var/image/x in usr.client.images)
					if(x.icon=='selected.dmi')
						del(x)
				DeleteTarget()

				spawn() src.enemybars()
			else
				usr<<"You dont have a target.."




/*	if(usr.plevel > src.plevel)
			usr<<"<font size=3><font color=red>You are stronger than [src].."
		if(src.plevel > usr.plevel)
			usr<<"<font size=3><font color=red>[src] is stronger than you.."
		if(src.plevel == usr.plevel)
			usr<<"<font size=3><font color=red>you and [src] have got equal stats.."
		//src<<"<font color=red><font size=1>[usr.name] has targeted you to see your stats.."

*/

mob
	verb
		Help_Me()
			set desc="Call for help from a online GM"
			set category = "Character Management"
			for(var/L in SOS)
				var/tmp/theirkey = copytext(L,1,findtext(L," ("))
				if(theirkey==src.ckey)
					Apopup(src,"You are already in the SOS list. Please wait while a GM gets to you")
					return
			switch(alert(usr,"Add yourself to the SOS List?","SOS!","Yes","No"))
				if("Yes")
					SOS+="[src.name] ([src.ckey])"
					for(var/client/c in players)
						var/mob/M=c.mob
						if(M.GM==1)
							M<<"[src.name] ([src.ckey]) is seeking help"
				else
					return