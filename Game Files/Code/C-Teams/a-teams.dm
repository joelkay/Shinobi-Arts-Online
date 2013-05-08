
Team
	parent_type = /obj/

	var
		teamname=""
		list/members=list()
		leader=""
		maxmembers=3//initial max of 3 groupies
		sharedexp=0

	proc/save()
		var/savefile/s=new("Savefiles/Teams/[src.teamname].sav")
		s["name"] << teamname
		s["members"] << members
		s["leader"] << leader
		s["maxmembers"] << maxmembers
		s["sharedexp"] << sharedexp


	proc/load()
		var/savefile/s=new("Savefiles/Teams/[src.teamname].sav")
		s["name"] >> teamname
		s["members"] >> members
		s["leader"] >> leader
		s["maxmembers"] >> maxmembers
		s["sharedexp"] >> sharedexp

	proc/remove()
		var/s=("Savefiles/Teams/[src.teamname].sav")
		var/a="[src.teamname] has been disbanded"
		src.teamsay(a)
		fdel(s)
		Teams.Remove(teamname)//removes to current list
		Save_Teams()

	proc/invite_member(client/x)
		members.Add(x)
		var/b="[x] has been added to [src.teamname]"
		src.teamsay(b)
		src.save()

	proc/boot_member(client/x)
		members.Remove(x)
		var/a="[x] has been removed from [src.teamname]"
		src.teamsay(a)
		src.save()

	proc/teamsay(msg,say=0,mob/x)
		for(var/client/c in members)
			var/mob/M=c.mob
			if(M.teamname==src.teamname)
				if(say && M in view(x)||M==x)continue//say doesnt get repeated
				M << {"<FONT COLOR = blue>{[teamname]:<FONT COLOR = white>[msg]<FONT COLOR = blue>}</FONT>"}


	proc/expshare(num)
		var/x=num*2
		src.sharedexp+=x
		src.save()
		for(var/client/c in members)
			var/mob/M=c.mob
			if(M.teamname==src.teamname)
				M << {"<FONT COLOR = blue>{[teamname] info:<FONT COLOR = white>Exp Share: +[x] exp<FONT COLOR = blue>}</FONT>"}
				M.exp+=num

	proc/moneyshare(ammo)
		//src.money+=x
		//src.save()
		for(var/client/c in members)
			var/mob/M=c.mob
			if(M.teamname==src.teamname)
				M << {"<FONT COLOR = blue>{[teamname] info:<FONT COLOR = white>Money Share: +[ammo] exp<FONT COLOR = blue>}</FONT>"}
				M.money+=ammo






