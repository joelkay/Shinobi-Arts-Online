mob
	var/tmp/cantalk=1
	var/tmp/talk=0
	verb
		reportbug(msg as text)
			set category = null
			text2file("(((((Bug)))))[time2text(world.realtime)]:[src.namefirst] [src.name] says [msg] Location:[src.x],[src.y],[src.z]","cfg/bugs.txt") // add it to the log


		Say(msg as text)
			set category = null
			if(!src.name)return
		/*
			record(ACTION_SAY,
					user = src.name,
					target = "view",
					notes = msg)
		*/
			view(src) <<output("<font color = #64a17c><b>[src.name] Says: </b><font color = white>[filter(msg)]</font>", "chatbox.chat")
			if(src.teamname)
				var/Team/x =new/Team
				x.teamname=src.teamname
				var/a="<font color = #72923F><b>[src.name] Radio: </b><font color = white>[filter(msg)]</font>"
				x.teamsay(a,1,src)




	verb
		OOC(msg as text)
			set category = null
			set category="Commands"
			set desc = "Say something to everyone in the game"
			if(!src.name)return
			if(!src.cantalk)
				src<<"Your Muted!."
				return
			if(src.talk>=4&&src.cantalk&&src.client)
				src<<"Stop spamming!!"
				src.cantalk=0
				players<<"[src.name] is spamming T_T shame on him.."
				sleep(1200)
				src<<"You may talk again.."
				src.talk=0
				src.cantalk=1
/*
			record(ACTION_SAY,
					user = src.name,
					target = "ooc",
					notes = msg)
*/
			var/L=VillageIcon(src.Village,0)

			if(src.GM)
				players << "<IMG CLASS=icon SRC=\ref[L]><FONT COLOR = #CCCC99>OOC:{<font color= #72923F><b>[src.namefirst]-[src.name]</b></font>, [src.rank]}<font color = cyan> :[filter(msg)]</FONT>"
				src.talk+=1
				sleep(30)
				src.talk-=1
				//var/pick2=pick(0,1,2)
				//if(pick2==2)
					//npctalkback(msg,src)
				return
			else
				players<< "<IMG CLASS=icon SRC=\ref[L]><FONT COLOR = #CCCC99>OOC:{<b>[src.namefirst]-[src.name]</b>, [src.rank]}<font color = cyan> :[filter(msg)]</FONT>"
				src.talk+=1
				sleep(30)
				src.talk-=1
				//var/pick1=pick(0,1,2)
				//if(pick1==2)
					//npctalkback(msg,src)


		VillageSay(msg as text)
			set category = null
			set desc = "Say something to everyone in your Village"
			if(!src.name)return
			if(!src.cantalk)
				src<<"Your Muted!"
				return
			if(src.talk>=4&&src.cantalk)
				src<<"Stop spamming!!."
				src.cantalk=0
				world<<"[src.name] is spamming T_T shame on him.."
				sleep(1200)
				src<<"You may talk again.."
				src.talk=0
				src.cantalk=1
/*
			record(ACTION_SAY,
					user = src.name,
					target = src.Village,
					notes = msg)
*/
			var/D=filter(msg)
			for(var/client/c in players)
				var/mob/M=c.mob
				//if(src in M.ignorelist&&src!=M)
				//	return
				var/L=VillageIcon(0,src.faction)

				if(M.faction == src.faction)
					if(M.faction=="Leaf")
						M <<output( {"<font color = green><b><IMG CLASS=icon SRC=\ref[L]>{[src.faction] <font color = green>[src.namefirst]-[src.name]</b>, [src.rank]}<font color = #FF6600> :[D]</FONT>"}, "chatbox.chat")
					if(M.faction=="Sand")
						M <<output( {"<font color = #996515><b><IMG CLASS=icon SRC=\ref[L]>{[src.faction] <font color = #996515>[src.namefirst]-[src.name]</b>, [src.rank]}<FONT COLOR = #D4AF37> :[D]</FONT>"}, "chatbox.chat")
					if(M.faction=="Mist")
						M <<output( {"<font color = #336699><b><IMG CLASS=icon SRC=\ref[L]>{[src.faction] <font color = #336699>[src.namefirst]-[src.name]</b>, [src.rank]}<FONT COLOR = #732C7B> :[D]</FONT>"}, "chatbox.chat")//:<font color = blue>[src.Group]
					if(M.missing)
						M <<output( {"<FONT COLOR = #7f9e62><b><IMG CLASS=icon SRC=\ref[L]>{[src.faction]:[src.namefirst]-[src.name]</b>, [src.rank]}<FONT COLOR = white> :[D]</FONT>"}, "chatbox.chat")

				else if(M.GM)
					if(src.faction=="Leaf")
						M <<output( {"<font color = green><b><IMG CLASS=icon SRC=\ref[L]>{[src.faction] <font color = #7f9e62>[src.namefirst]-[src.name]</b>, [src.rank]}<font color = #FF6600> :[D]</FONT>"}, "chatbox.chat")
					if(src.faction=="Sand")
						M <<output( {"<font color = #72923F><b><IMG CLASS=icon SRC=\ref[L]>{[src.faction] <font color = #7f9e62>[src.namefirst]-[src.name]</b>, [src.rank]}<FONT COLOR = #D4AF37> :[D]</FONT>"}, "chatbox.chat")
					if(src.faction=="Mist")
						M <<output( {"<font color = #72923F><b><IMG CLASS=icon SRC=\ref[L]>{[src.faction] <font color = #7f9e62>[src.namefirst]-[src.name]</b>, [src.rank]}<FONT COLOR = #732C7B> :[D]</FONT>"}, "chatbox.chat")//:<font color = blue>[src.Group]
					if(src.missing)
						M <<output( {"<FONT COLOR = #72923F><b><IMG CLASS=icon SRC=\ref[L]>{[src.faction]:[src.namefirst]-[src.name]</b>, [src.rank]}<FONT COLOR = white> :[D]</FONT>"}, "chatbox.chat")

					src.talk+=1
					spawn(30)
						src.talk-=1




mob
	proc
		VillageIcon(var/one,var/two)
			var/L
			if(one)
				if(src.Village=="Leaf")
					L='leafooc.dmi'
				if(src.Village=="Sand")
					L='sandooc.dmi'
				if(src.Village=="Mist")
					L='mistooc.dmi'
				return L

			if(two)
				if(src.faction=="Leaf")
					L='leafooc.dmi'
				if(src.faction=="Sand")
					L='sandooc.dmi'
				if(src.faction=="Mist")
					L='mistooc.dmi'
				return L



mob/var/tmp/list/ignorelist=list()
mob
	verb
		ignorep(client/c in players)
			set hidden=1
			var/mob/M=c.mob
			if(M==src)
				return
			if(M in src.ignorelist)
				src.ignorelist+=M
				src<<"You stop ignoring [M] "
			else
				src.ignorelist+=M
				src<<"You start ignoring [M] "

		whisperp(client/c in players)
			set hidden=1
			var/mob/M=c.mob
			if(M==src)
				return
			if(src in M.ignorelist)
				src<<"[M] is ignoring you.."
				return
			else
				var/message
				message=input("Type a message..","msg",message) as text
				src << output("<font color = yellow>[src.name] whispers: [filter(message)]</font>", "chatbox.chat")//copy for self notification
				M << output("<font color = yellow>[src.name] <i> you whisper: [filter(message)]</font>", "chatbox.chat")




/*
var/tmp/list/mobs1=list()
var/tmp/list/mobs2=list()

mob/var/tmp/oocmute=0
mob/var/tmp/villagemute=0


mob
	verb
		oocmute()
			set hidden=1
			if(!src.oocmute)
				src.oocmute=1
				src<<"Turned off ooc, wait for changes to take place."
				mobs1.Remove(src)
			else
				src.oocmute=0
				src<<"Turned on ooc, wait for changes to take place."
				mobs1.Add(src)

		villagemute()
			set hidden=1
			if(!src.villagemute)
				src.villagemute=1
				src<<"Turned off village say, wait for changes to take place."
				mobs2.Remove(src)
			else
				src.villagemute=0
				src<<"Turned on village say, wait for changes to take place."
				mobs2.Add(src)





		Whisper(mob/M in world)//continue this
			set category="Commands"
			set desc = "Say something to everyone in your Village"
*/



var
	swears = list(\
	"fuck","bitch","shit","slut",\
	"asshole","<font"\
	)



proc
	symbol(length as num)
		var/T
		for(var/i = 0,i < length,i++)
			T += "*"
			//T += pick("!","@","#","$","%","^","&","*")
		return T

	filter(msg as text)
		var/txt = lowertext(html_encode(msg))
		var/a
		var/out
		for(var/swr in swears)
			if(findtext(txt,"[swr]"))
				for(var/i = 1, i <= length(txt))
					a = copytext(msg, i, i+length(swr))
					if(lowertext(a) == "[swr]")
						a = symbol(length(swr))
						i+= length(swr)
						out += "[a]"
					else
						out += copytext(msg, i, i+1)
						i ++
				msg = out
				txt = lowertext(msg)
				out = ""
		return msg

/*
	npctalkback(msg as text,mob/guy)
		var/txtx = lowertext(msg)
		for(var/mob/NPC/g in world)
			if(findtext(txtx,"[g.name]"))
				g.OOC("Hey,Stop talking about me [guy.name] or else! we all know you only got [guy.money] in your wallet, poor bastard")




*/



var
	oocmute=0
mob
	proc/talkcool()
		src.talkcooling=1
		while(src.talkcool>0)
			spawn(1)
			src.talkcool-=1
		src.talktimes=0
		src.talkcooling=0
