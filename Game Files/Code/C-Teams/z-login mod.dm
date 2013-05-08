mob
	var/teamname=""

mob
	proc/Teamage()
		if(src.teamname)
			var/Team/x=new/Team
			x.teamname=src.teamname
			x.load()
			if(x.leader==src.name)
				var/a="[src.namefirst]-[src.name], the team leader has logged in"
				x.teamsay(a)
				src.verbs += typesof(/mob/Teams/verb)

			if(!x.leader)
				src<<"this team disbanded."
				src.teamname=""
				return

			if(src.name in x.members&&!x.leader==src.name)
				var/b="[src.namefirst]-[src.name], one of the team members has logged in"
				x.teamsay(b)
			del(x)
