mob
	verb
		Create_Team()
			set category= "Teams"
			if(src.teamname)
				src<<"You have a team already.."
				return
			else
				var/Team/X = new/Team
				X.leader=src.name
				X.teamname = input("Choose a name for your team..","Team Name",X.teamname)
				src.teamname=X.teamname
				src.verbs += typesof(/mob/Teams/verb)

				var/a="[src.teamname] has been created"
				X.teamsay(a)
				X.invite_member(src.name)

				X.save()
				spawn() src.Save()

				Teams.Add(src.teamname)//add to current list
				Save_Teams()







mob
	verb
		leave_team()
			set category= "Teams"
			var/Team/x =new/Team
			x.teamname=src.teamname
			x.load()

			if(x.leader==src.name)
				switch(alert(src,"Do you wish to disband this squad?","Confirm","Yes","No"))
					if("No")
						usr<<"safe.."
					if("Yes")
						x.leader=""
						x.boot_member(src.name)
						for(var/client/c in x.members)
							var/mob/M=c.mob
							if(M.teamname==src.teamname)
								M.teamname=""
						src.verbs -= typesof(/mob/Teams/verb)
						x.remove()



			else
				x.boot_member(src.name)
				src.teamname=""
				x.save()
				del(x)


mob/Teams
	verb
		invite_member(mob/M)
			set category= "Teams"
			var/Team/x =new/Team
			x.teamname=src.teamname
			x.load()
			var/a=x.members.len
			if(a>=x.maxmembers)
				src<<"No spots left.."
				return
			if(M==src)
				src<<"cant inivte urself dummy.."
				return
			if(M.teamname)
				src<<"[M] has a team already.."
				return
			switch(alert(M,"Do you wish to join [x.teamname] led by [x.leader]?","Confirm","Yes","No"))
				if("No")
					usr<<"[M] rejected the offer.."
				if("Yes")
					M.teamname=x.teamname
					x.invite_member(M.name)


		boot_member()
			set category= "Teams"
			var/Team/x =new/Team
			x.teamname=src.teamname
			x.load()
			var/member = input("Which member do you wish to boot?") in x.members + list("Cancel")
			if(member == "Cancel") return
			x.boot_member(member)


