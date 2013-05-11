mob
	verb
		Leave_Village()
			set category = "Character Management"
			if(src.rank=="Student")
				src<<" Only Genin can leave village.."
				return
			if(src.Village!="Missing"&&src.blevel>=10)
				world<<"<font color = blue>[src.name] left [src.Village]</font>"
				src.Village="Missing"
				src.faction="Missing"
				if(src.rank=="Genin")
					src.rank="Genin"
					src.missing=1
					return
				src.rank="Chuunin"
				src.missing=1
				return
			else
				src<<"You must be atleast lvl 10 to leave village"



mob/Admin
	verb
		MakeFactionL(client/c in players)
			set category = "Faction"
			src.checkedit()
			var/mob/M=c.mob
			if(M.faction != "Missing"||M.factionll)
				src<<"[M] has a faction already., or is not a Missing ninja"
				return
			else
				var/Factionname
				Factionname = input("Choose a name for the Group..","Group name", Factionname)
				M.Village="[Factionname]"
				M<<"You have been given a Faction!"
				world<<"[M] is now [M.Village] Leader!"
				M.rank = "[M.Village]"
				M.faction = M.Village
				M.factionll=1
				//var/obj/MizukageHat/B = new/obj/MizukageHat
				//B.loc = M
				M.verbs += typesof(/mob/FactionL/verb)
				spawn() M.Save()


		RemoveFactionL(client/c in players)
			set category = "Faction"
			src.checkedit()
			var/mob/M=c.mob
			M<<"You have been removed from Faction!"
			M.rank = "Jounin"
			M.Village = "Missing"
			M.faction="Missing"
			world.SetMedal("Jounin", M)
			M.factionll=0
			M.verbs -= typesof(/mob/FactionL/verb)


mob/FactionL
	verb
		FactionBoot(client/c in players)
			set category="Faction"
			var/mob/M=c.mob
			if(M.Village == src.Village)
				M.Village="Missing"
				var/Team/x =new/Team
				x.teamname=src.teamname
				M.teamname=""
				x.boot_member(M.name)


			else
				src<<"You can not edit some one's rank from another village.."

		FactionInvite(mob/M in view())
			set category="Faction"
			if(M.teamname)
				src<<"[M] has a team already.."
				return
			if(M.Village == "Missing")
				switch(alert(M,"Join [src.Village]?","**Faction**","Yes","No"))
					if("Yes")
						alert(src,"[M] accepted the invite","**Accepted**")
						M.Village=src.Village
						M.rank = "[M.Village]"
						M.faction = M.Village
						M<<"Welcome to [src.Village].."

					if("No")
						Apopup(src,"[M] rejected the invite")

			else
				src<<"You can not invite someone who is not a missing.."
