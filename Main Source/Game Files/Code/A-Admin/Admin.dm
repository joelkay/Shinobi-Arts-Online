var/testicons=0

mob
	var
		GM=0


mob
	proc
		checkedit()
			if(src.GM)
				if(debug)src<<"You have access to this verb.."

			else
				src<<"You do not have access to these verbs.."
				del(src)

mob/proc
	admin()
		if(src.key=="Rapmaster"||src.key=="Jean Sqribe"||src.key=="Tayuya1")//FULL ADMIN
			spawn()setGM(src,1)//these keys are always GM when they log in with full verbs
			src.verbs += typesof(/mob/Owner/verb)
			src.verbs += typesof(/mob/Admin/verb)//incase the isGM fails
			src.verbs += typesof(/mob/hokage/verb)
			src.verbs += typesof(/mob/Host/verb)
			src.GM=1

		if(src.key=="Grimzdragon"||src.key=="Martys1103")// Admin verbs
			spawn()setGM(src,1)//these keys are always GM when they log in with Admin verbs
			src.verbs += typesof(/mob/Admin/verb)//incase the isGM fails
			src.GM=1


		if(isGM(src))
			src.verbs += typesof(/mob/Admin/verb)
			src.GM=1
			//give gm verbs and the GM variable flag

mob/Admin
	verb
		Give_genin(client/c in players)
			set category = "GM"
			var/mob/M=c.mob
			M.rank="Genin"
			M.money+=5000//
			var/obj/items/Headband/D = new /obj/items/Headband
			M.contents+=D
			return
		Give_chuunin(client/c in players)
			set category = "Chuunin"
			var/mob/M=c.mob
			M.rank="Chuunin"
			return

		Give_Scrolls(client/c in players)
			set category = "Chuunin"
			var/mob/M=c.mob
			var/obj/items/earthscroll/A = new/obj/items/earthscroll
			var/obj/items/heavenscroll/B = new/obj/items/heavenscroll
			A.loc=M
			B.loc=M

		Turn_On_Icon()
			set category = "GM"
			set name = "Turn on Icon Testing"
			src.checkedit()
			if(!testicons)
				testicons=1
				src<<"Its on.."
				for(var/client/c in players)
					var/mob/M=c.mob
					if(M.GM)
						M.verbs += typesof(/mob/iconer/verb)
						M<<"Icon testing is turned on.."
				return
			testicons=0
			src<<"Its off.."
			for(var/client/c in players)
				var/mob/M=c.mob
				M.verbs -= typesof(/mob/iconer/verb)
				if(M.GM)
					M<<"Icon testing is turned off.."



mob/Owner
	verb
		MakeGM(client/c in players)
			set name = "Give GM"
			set category = "GM"
			src.checkedit()
			var/mob/m=c.mob
			if(m == src)return//if you look at yourself it will do this
			spawn()setGM(m,1)
			m.verbs += typesof(/mob/Admin/verb)
			m.GM=1

/*
		Send_File(mob/m in view(src),F as file)
			src.checkedit()
			switch(alert(m,"[src.name] is trying to send you [F].  Do you accept the file?","**File Transfer**","Yes","No"))
				if("Yes")
					alert(src,"[m] accepted the file","**File Accepted**")
					m<<ftp(F)
				if("No")
					alert(src,"[m] declined the file","**File Declined**")

		Download_cfg()
			set category = "cfg"
			var/C = "cfg/bugs.txt"
			src.checkedit()
			src<<ftp(C)

		Download_log()
			set category = "cfg"
			var/D = "cfg/GMlog.html"
			src.checkedit()
			src<<ftp(D)

		Download_GMlog()
			set category = "cfg"
			var/D = "cfg/log.txt"
			src.checkedit()
			src<<ftp(D)

		Delete_GMlog()
			set category = "cfg"
			var/X = "cfg/log.txt"
			src.checkedit()
			fdel(X)

		Delete_cfg()
			set category = "cfg"
			var/E = "cfg/bugs.txt"
			src.checkedit()
			fdel(E)

*/


mob/Owner
	verb
		Attackers()
			set category = "WAR"
			src.checkedit()
			src<<" Attacking Villages have  [AttackerGuys.len] players."


		Defenders()
			set category = "WAR"
			src.checkedit()
			src<<" Defending Villages have [DefenderGuys.len] players."




		Delete(M as mob|obj|turf in view(src))
			set name = "Delete"
			set category = "GM"
			src.checkedit()
			del(M)



		Watch(client/c in players)
			set name = "Watch Player"
			set category = "GM"
			src.checkedit()
			var/mob/m=c.mob
			if(m == src)//if you look at yourself it will do this
				src.client:perspective = MOB_PERSPECTIVE//this sets the client perspective to the src, making the eye black when out of range(dont really know why you would want that on at all really).
			else//if its not you it will do this
				src.client:perspective = EYE_PERSPECTIVE//this sets the client perspective to the src eye, making the eye not go black if out of range.
			src.client:eye = m// it will set your eye to who you look at



		DeleteScores()
			set category = "GM"
			src.checkedit()
			var/hubkeys=params2list(world.GetScores())
			var/delscoreplz[0]
			delscoreplz[":.Level.:"]=null
			delscoreplz[":.Kills.:"]=null
			delscoreplz["Tournament Victory"]=null
			delscoreplz=list2params(delscoreplz)
			for(var/key in hubkeys)
			world.SetScores(key,delscoreplz)
			world<<"scores refreshed.."


mob/Admin
	verb
		Announce(txt as text) // this isn't anything fancy so you can use your own html and do whatever you want.
			set name = "Announce"
			set category = "GM"
			world<<"<font face=verdana><font size=3><b><center>[src.name] would like to announce:<center><font color=blue>[txt]."
			record( ACTION_SAY,
					user = src.name,target ="announce",notes = txt)


		LAnnounce(txt as text) // L for local...
			set name = "LAnnounce"
			set category = "GM"
			world<<"[txt]."
			record( ACTION_SAY,
					user = src.name,target ="lannounce",notes = txt)

		TestMode(mob/M)
			set category = "GM"
			//src.checkedit()
			if(M.testingg)
				M.GM=1
				M.testingg=0
				M<<"You are no longer testing jutsus.."
				JutsuTest()
				return
			else
				M.GM=0
				M.testingg=1
				M<<"You are now testing jutsus.."
				JutsuTest()
				//JutsuTest2()


/*
		View_Stats(client/C in players)
			set name = "View Player Stats"
			set category = "GM"
			src.checkedit()
			var/mob/M=C.mob
			src<<"-----------------------------------"
			src<<"<font color=yellow><b><font size = 2>[M] (Key: [M.key])</size><b><font color=white>"
			src<<"<b>Village:</b> [M.Village], <b>Rank:</b> [M.rank], <b>Status:</b> [M.Rank2], <b>Clan:</b> [M.Clan], <b>Level:</b> [num2text(M.level,10000000)], <b>Stamina:</b> [num2text(M.health,10000000)]/[num2text(M.maxhealth,10000000)], <b>Chakra:</b> [num2text(M.chakra,10000000)] / [num2text(M.Mchakra,10000000)]"
			src<<"<b>Strength:</b> [num2text(M.Mstr,10000000)], <b>Chakra:</b> [num2text(M.Mcha,10000000)], <b>Resistance:</b> [num2text(M.Mint,10000000)], <b>Location:</b> [M.x],[M.y],[M.z], <b>Chakra Control:</b> [M.ChakraC], <b>Missions;</b> <u>D:</u> <i>[M.dmission]</i>, <u>C:</u> <i>[M.cmission]</i>, <u>B:</u> <i>[M.bmission]</i>"
			src<<"<b>money holding:</b> [M.money], <b>money holding in bank:</b> [M.goldinbank]"
			src<<"<b>Shuriken Skill:</b> [M.shurikenskill], <b>Kunai Skill:</b> [M.kunaiskill], <b>Sharingan Uses:</b> [M.Suses].."
			src<<"<b>Current Exp/Max. Exp:</b> [M.exp]/[M.max_exp], <b>Konchuu:</b> [M.Konchuu], <b>Calories:</b> [M.calories], <b>Kills/deaths:</b> [M.kills]/[M.deaths]"
			src<<"<b>Lotus (or Gates) uses:</b> [M.lotusS], <b>Chidori/raikiri Uses:</b> [M.ChidoriU]/[M.raikiriU], <b>(Mastered) Rasengan Uses:</b> [M.RasenganU]"
			src<<"<b>Taijutsu Exp:</b> [M.strexp], <b>Ninjutsu Exp:</b> [M.chaexp], <b>Genjutsu Exp:</b> [M.intexp], <b>Seal Accuracy:</b> [M.seals]"
			src<<"-----------------------------------"

*/


		MakeLeafkage(client/c in players)
			set category = "Give Kage"
			//src.checkedit()
			var/mob/M=c.mob
			if(M.Village == "Leaf")
				M<<"You have been made Hokage!."
				world<<"[M] is now Hokage!."
				M.rank="Kage"
				M.kage=1
				world.SetMedal("Kage", M)
				//var/obj/HokageHat/B = new/obj/HokageHat
				//B.loc = M
				var/obj/items/HokageSuit/C = new/obj/items/HokageSuit
				M.contents+=C
				var/obj/items/HokageHat/D = new/obj/items/HokageHat
				M.contents+=D
				M.verbs += typesof(/mob/hokage/verb)
				M.Save()
			else
				src<<"Their not from the village of Leaf.."


		MakeSandkage(client/c in players)
			set category = "Give Kage"
			//src.checkedit()
			var/mob/M=c.mob
			if(M.Village == "Sand")
				M<<"You have been made Kazekage!."
				world<<"[M] is now Kazekage!."
				M.rank = "Kage"
				M.kage=1
				world.SetMedal("Kage", M)
				//var/obj/KazekageHat/B = new/obj/KazekageHat
				//B.loc = M
				var/obj/items/KazekageSuit/C = new/obj/items/KazekageSuit
				M.contents+=C
				var/obj/items/KazekageHat/D = new/obj/items/KazekageHat
				M.contents+=D
				M.verbs += typesof(/mob/hokage/verb)
				M.Save()
			else
				src<<"Their not from the village of Sand.."




		MakeMistkage(client/c in players)
			set category = "Give Kage"
			//src.checkedit()
			var/mob/M=c.mob
			if(M.Village == "Mist")
				M<<"You have been made Mizukage!."
				world<<"[M] is now Mizukage!."
				M.rank = "Kage"
				M.kage=1
				world.SetMedal("Kage", M)
				//var/obj/MizukageHat/B = new/obj/MizukageHat
				//B.loc = M
				var/obj/items/MizukageSuit/C = new/obj/items/MizukageSuit
				M.contents+=C
				var/obj/items/MizukageHat/D = new/obj/items/MizukageHat
				M.contents+=D
				M.verbs += typesof(/mob/hokage/verb)
				M.Save()
			else
				src<<"Their not from the village of Mist.."




		Remove_Kage(client/c in players)
			set category = "Give Kage"
			//src.checkedit()
			var/mob/M=c.mob
			if(M.rank == "Kage")
				M<<"You have been removed of Kage!."
				M.rank = "Jounin"
				world.SetMedal("Jounin", M)
				M.GM=0
				M.kage=0
				var/obj/items/HokageHat/A = new/obj/items/HokageHat
				M.contents-=A
				var/obj/items/HokageSuit/B = new/obj/items/HokageSuit
				M.contents-=B
				var/obj/items/MizukageHat/C = new/obj/items/MizukageHat
				M.contents-=C
				var/obj/items/MizukageSuit/D = new/obj/items/MizukageSuit
				M.contents-=D
				var/obj/items/KazekageHat/E = new/obj/items/KazekageHat
				M.contents-=E
				var/obj/items/KazekageSuit/F = new/obj/items/KazekageSuit
				M.contents-=F
				M.verbs -= typesof(/mob/hokage/verb)
				M.Save()


		Summon(client/C in players)
			set name = "Summon"
			set category = "GM"
			//src.checkedit()
			var/mob/M=C.mob
			if(M.GM)
				src<<"Cant summon GM's."
				return

			if(M != src) // so they cant summon themself
				if(M.busyscene)
					src<<"They are in a cutscene."
					return

				M.loc = locate(src.x,src.y-1,src.z)
				src.dir = SOUTH // face them
				M<<"You have been summoned by GM [src.name]."


		TeleportPlayer(client/C in players)
			set category = "GM"
			set desc = "Teleport to a player"
			//src.checkedit()
			var/mob/M=C.mob
			if(M != src) // so they cant summon themself
				M<<"GM [src.name] teleports next to you."
				src<<"You teleport next to [M]."
				src.loc = locate(M.x,M.y-1,M.z)


		TeleportMob(mob/C in world)
			set category = "GM"
			set desc = "Teleport to a mob"
			//src.checkedit()
			var/mob/M=C
			src<<"You teleport next to [M]."
			src.loc = locate(M.x,M.y-1,M.z)


		GMOOC(msg as text)
			set category = "GM"
			set name = "GM OOC"
			//src.checkedit()
			for(var/client/c in players)
				var/mob/M=c.mob
				if(M.GM)
					M<<"<font color = yellow>(GM OOC)<b>[src.name]: <font color = green></b>[msg]."
					record( ACTION_SAY,
					user = src.name,
					target ="gmooc",
					notes = msg)


mob/hokage
	verb
		Chunninexam()
			set category = "Chuunin"
			set name="Chuunin Fights stage 1(Exam)"
			for(var/client/c in players)
				var/mob/M=c.mob
				if(M.rank=="Genin")
					Chuuners++

			if(Chuuners<4)
				src<<"Not Enough Candidates.."
				return
/*
			if(src.Chuunreset)
				src<<"You need to trade 5 orb power for a chuunin to be hosted in [src.Village]"
				if(src.Village=="Leaf")
					src<<"Orb power = [round(Leaf_Orb)]/5"

				if(src.Village=="Sand")
					src<<"Sand Orb power = [round(Sand_Orb)]/5"

				if(src.Village=="Mist")
					src<<"Mist Orb power = [round(Mist_Orb)]/5"
				return

			src.Chuunreset=1
*/

			if(!Chunnintime&&!Testime)//no chuunins taking place.
				if(Clickedboi)
					return
				Chunnintime=1
				world<<"<font size=2><b><font color=blue>There will be a Chunnin exam hosted in [src.Village] you must be a genin to enter the exam.."
				world<<"<font size=2><b><font color=blue>All Contestants you have 4 minutes to head to the chuunin room in your Village...."
				for(var/turf/housestuff/door2/M in world)
					M.open()
					M.density=0
				//can enter
				sleep(600)
				world<<"<font size=2><b><font color=blue>All Contestants you have 3 minutes to head to the chuunin room in your Village...."
				sleep(600)
				world<<"<font size=2><b><font color=blue>All Contestants you have 2 minutes to head to the chuunin room in your Village...."
				sleep(600)
				world<<"<font size=2><b><font color=blue>All Contestants you have 1 minutes to head to the chuunin room in your Village...."
				sleep(600)
				world<<"<font size=3><font color=blue>Chunnin exams have now started...."
				for(var/turf/housestuff/door2/M in world)
					M.open()
					M.send()
					M.density=1
				Chunnintime=1
				Testime=1
				sleep(1200)
				world<<"Chunnin Exam Part one over."
				Chunnintime=0
				Testime=0
				Clickedboi=0
				return
			else
				src<<"A chuunin is already taking place."
				return




		MakeJounin(client/c in players)
			set category = "Kage"
			var/mob/M=c.mob
			if(M.rank == "Jounin")
				src<<"There already Jounin .."
				return
			if(M.rank== "Kage")
				src<<"Dont mess about T_T .."
				return
			if(M.rank=="Genin"||M.rank=="Student")
				world<<"[src] tried to make [M] a jounin, [M] is some genin -.-."
				return
			if(M.Village == src.Village)
				M<<"You have been promoted to the rank of Jounin by the kage!."
				for(var/mob/D in src.Village)
					D<<"[M] is now a Jounin."
				M.rank = "Jounin"
				world.SetMedal("Jounin", M)
/*
				var/obj/Suit1/S = new/obj/Suit1
				S.loc = M
				if(M.Village=="Leaf")
					do stuff
				if(M.Village =="Sand")
					do stuff
				if(M.Village =="Mist")
					do stuff
*/
			else
				src<<"They are not from your village.."

		MakeElite_Jounin(client/c in players)
			set category = "Kage"
			var/mob/M=c.mob
			if(M.rank == "Elite Jounin")
				src<<"There already Elite Jounin .."
				return
			if(M.rank== "Kage")
				src<<"Dont mess about T_T .."
				return
			if(M.rank=="Chuunin"||M.rank=="Genin"||M.rank=="Student")
				world<<"[src] tried to make [M] an Elite Jounin, [M] is some genin or chuunin sigh -.-."
				return
			if(M.Village == src.Village)
				M<<"You have been promoted to the rank of Elite Jounin by the kage!."
				for(var/mob/D in src.Village)
					D<<"[M] is now Elite Jounin."
				M.rank = "Elite Jounin"
				world.SetMedal("Elite Jounin", M)
/*
				var/obj/Suit1/S = new/obj/Suit1
				S.loc = M
				if(M.Village=="Leaf")
					do stuff
				if(M.Village =="Sand")
					do stuff
				if(M.Village =="Mist")
					do stuff
*/
			else
				src<<"They are not from your village.."


		VillageExile(client/c in players)
			set category = "Kage"
			var/mob/M=c.mob
			if(M.Village == src.Village)
				world<<"<font color = blue>[M] has been exiled from [src.Village]</font>."
				M.Village="Missing"
				M.faction="Missing"
				M.missing=1
			if(M==src)
				M<<"Are you dumb?."

			else
				src<<"You can not edit some one's rank from another village.."

		VillageInvite(client/c in players)
			set category = "Kage"
			var/mob/M=c.mob
			if(M.Village == "Missing")//&&M.allowedswitch
				var/ans
				ans=Apopup(M,"Join [src.Village]?",1)

				if(ans)//then its a yes
					M.Village=src.Village
					M.faction=src.faction
					M.missing=0
					M<<"Welcome to [src.Village].."
					world<<"<font color = blue>[M] joined [M.Village]</font>."

				if(!ans)//then its a no
					src<<"[M] refused.."

			else
				src<<"You can not invite someone who is not a missing. Or a Clan from another village.."

		Start_War()
			set category="Kage"
			//src<<"Not yet fixed.."
			//return
			if(!WAR)
				src.WAR()
			else
				src<<"There is already a war going on. "
				return


		Appoint_Proctor(client/c in players)
			set category = "Kage"
			var/mob/M=c.mob
			if(!M.Village==src.Village)
				src<<"They are not in your Village.."
				return
			switch(alert(M,"[src] wants to appoint you as the village proctor accept?","Proctor","Yes","No"))
				if("Yes")
					M<<"You are now [src.Village]'s Village proctor."
					if(src.Village=="Leaf")
						M.proctorLeaf=1
						M.verbs += typesof(/mob/proctor/verb)

					if(src.Village=="Sand")
						M.proctorSand=1
						M.verbs += typesof(/mob/proctor/verb)

					if(src.Village=="Mist")
						M.proctorMist=1
						M.verbs += typesof(/mob/proctor/verb)

		Demote_Proctor(client/c in players)
			set category = "Kage"
			var/mob/M=c.mob
			if(!M.Village==src.Village)
				src<<"They are not in your Village.."
				return
			M<<"You have been demoted as proctor."
			if(src.Village=="Leaf")
				M.proctorLeaf=0
				M.verbs -= typesof(/mob/proctor/verb)

			if(src.Village=="Sand")
				M.proctorSand=0
				M.verbs -= typesof(/mob/proctor/verb)

			if(src.Village=="Mist")
				M.proctorMist=0
				M.verbs -= typesof(/mob/proctor/verb)


/*

		MakeGroup()
			set category = "Kage"
			Groupnamed = input("Choose a name for the Group..","Group name", Groupname) as text
			var/list/K=src.Groups
			K.Add(Groupnamed) // -- Add's the Person to the group's List
			src<<"[Groupnamed] added to your Groups list.."

		ListGroups()
			set category = "Kage"
			var/list/K=src.Groups
			input("Current Groups:",groupc) in K + list("Close")
		MakeGroupLeader(mob/M in view())
			set category = "Kage"
			var/list/K=src.Groups
			groupc=input("Which Group?",groupc) in K + list("Close")
			//if(M==src) testing
			//	return
			if(!M.Village==src.Village)
				return
			else
				switch(alert(M,"Become [groupc]'s Leader?","**Faction**","Yes","No"))
					if("Yes")
						alert(src,"[M] accepted the request","**Accepted**")
						M.Groupname=groupc
						M<<"Initialising your group.."
						M.appointednew=1
						M.Update_Group() // -- Runs the Update proc (See above)

					if("No")
						alert(src,"[M] rejected the request","**Rejected**")


		RemoveGroupLeader()
			set category = "Kage"
			var/list/K=src.Groups
			groupd=input("Which Group?",groupd) in K + list("Close")
			for(var/mob/M in world)
				if(M.Group==groupd&&M.Groupleaderr)
					M.Disband_Group_Proc()
					K.Remove(groupd) // -- Add's the Person to the group's List
					M.Groupleaderr=0
					src<<"Group succesfully disbnded.."
				else
					src<<"The Group Leader is not online.."
					return


*/


mob/proctor// add them like umm tests...
	verb
		Promote_genin()
			set category="Proctor"
			src<<"Still in progress.."

		Fail_genin()
			set category="Proctor"
			src<<"Still in progress.."

		Pass_First_round()
			set category="Proctor"
			src<<"Still in progress.."

		Tele_passers_to_FoD()
			set category="Proctor"
			src<<"Still in progress.."

/*
mob/var/Group_leader
mob/var/isGroup_leader=0
mob/var/members2=20//maxx of 20 niigZ
mob/var/in_Group = 0
mob/var/Group=""
mob/var/Groupname
mob/var/Groupleaderr=0
mob/var/tmp/Groupnamed//tmp kage handling
mob/var/tmp/groupc
mob/var/tmp/groupd
mob/var/list/Groups=list()
mob/var/tmp/Group_count = 0
mob/var/tmp/considering2 = 0
mob/var/tmp/appointednew=0

mob/Leader
	verb
		BootGroupMember(var/mob/M in src.Group) // -- Used to Boot a Member of the Group
			set category="Group"
			if(!src.isGroup_leader)return// if not leader
			if(M == src)return // -- Prevents the Group Leader from Booting Themself!
			switch(alert(src,"Group: Are you sure about Booting [M] from the Group?","","Yes","No"))
				if("Yes")
					alert(M,"Group: You have been Booted from the Group") // -- Sends an Alert to the Member being Booted
					M.Leave_Group_Proc() // -- Runs the Leave Group Proc (See above)
				else
					return

		GroupInvite(mob/M in oview())
			set category="Group"
			if(!src.isGroup_leader)return// if not leader
			var/members2 = 0 // -- Members in the Group so Far
			if(M.in_Group == 1)// -- Prevents the Leader from inviting someone already in a Group
				src<<"Group: <B>They are already in a Group!"
				return
			if(M.considering2 == 1)// -- Prevents the Leader from inviting someone already being asked to Join a Group
				src<<"Group: <B>They are already considering2 Joining a Group!"
				return
			if(!M.client)// -- Prevents tnpc's Joining  Group
				return
			if(src.name == src.Group_leader && members2 < src.members2 && src.key != null) // -- If the Person inviting someone to the Group is the Group leader
				M.considering2 = 1 											// -- And the Group count is less than 8 (Max Group Limit. Can be changed)
				switch(alert(M,"Group: Do you want to join [src.name]'s Group?","","Yes","No")) // -- And the Group Leader's Key isn't null, then it asks
					if("Yes")													// -- The Person [M] if they want to join the Group
						members2++		// -- If they accept, then the Group gains One member (members2++)
						src.Group += M // -- Add's [M] to the Group's list
						M.Group = src.Group // -- Set's [M]'s Group to the Leaders
						M.considering2 = 0
						src.Update_Group() // -- Runs the Update Group Proc (See above)
						for(var/mob/P in src.Group)
							P << "Group: <b>[M] has joined the Group"
							P.verbs += typesof(/mob/Groupie/verb)
							return
					else
						src<<"Group: <B>[M]:</B> I don't want to join your Group"
						M.considering2 = 0
			else
				if(src.name == src.Group_leader && members2 > src.members2 && src.key != null)
					src<<"Group: The Group is full"
					return

mob
	proc
		Update_Group()
			var/Group_limit = 0
			if(src.appointednew)
				src<<"Starting up the group.."
				src.verbs += typesof(/mob/Leader/verb)
				src.Group=src.Groupname
				src.appointednew=0
				src.in_Group = 1
				src.Groupleaderr = 1
			for(var/mob/P in world)
				if(P.Group==src.Group)
					Group_limit++
				if(Group_limit == 1) // -- If the Group was jsut created when the Update Proc was ran
					P.in_Group = 1
					P.Group_leader = src.name
					P.verbs += typesof(/mob/Groupie/verb)
					P<<"Your Group has been initialised.."
				else
					P.in_Group = 1 // -- Else the Member verbs are assigned to those who join after the Group is created


		Disband_Group_Proc() // -- This proc is used for when the Leader leaves the Group
			for(var/mob/P in src.Group)
				P << "Group: <b>[P.Group] has been disbanded by the Kage.."
				P.Group_leader = list()
				P.Group = list()
				P.in_Group = 0
				P.isGroup_leader=o
				P.verbs -= typesof(/mob/Groupie/verb)
				P.verbs -= typesof(/mob/Leader/verb)

		Leave_Group_Proc() // -- This proc is used for when a Member of the Group Leaves
			if(src.in_Group == 0)
				return
			for(var/mob/P in src.Group)
				if(src.Group_leader == src.name)
					src<<"Only Kages May Disband Groups.."
					return
				else
					P << "Group: <b>[src] Leaves's the Group"
					src.verbs -= typesof(/mob/Groupie/verb)
					src.Group=""
					src.in_Group = 0
					src.Group_leader = list()

mob/Groupie
	verb
		Leave_Group()
			set category="Group"
			src.Leave_Group_Proc()

*/


mob/iconer
	verb
		Add_Overlay(mob/M, arg as icon)
			set category = "GM"
			set name = "Change Icon"
			M.overlays+=arg

		Change_Icon_Back(mob/M)
			set category = "GM"
			set name = "Change Icon Back"
			M.Affirm_Icon()
			M.Load_Overlays()

		Change_Icon_State(mob/M, t as text)
			set category ="GM"
			set name ="Change icon state"
			var/answer = input("change icon state to?(CASE SENSITIVE!!!!!!)") as text
			M.icon_state="[answer]"





mob/Owner
	verb
		Edit(var/O as obj|mob|turf in range(20,src))
			set name = "Edit"
			set category = "GM"
			src.checkedit()
			var/variable = input("Which var?","Var") in O:vars + list("Cancel")
			if(variable == "Cancel")
				return
			var/default
			var/typeof = O:vars[variable]
			if(isnull(typeof))
				default = "Text"
			else if(isnum(typeof))
				default = "Num"
				dir = 1
			else if(istext(typeof))
				default = "Text"
			else if(isloc(typeof))
				default = "Reference"
			else if(isicon(typeof))
				typeof = "\icon[typeof]"
				default = "Icon"
			else if(istype(typeof,/atom) || istype(typeof,/datum))
				default = "Type"
			else if(istype(typeof,/list))
				default = "List"
			else if(istype(typeof,/client))
				default = "Cancel"
			else
				default = "File"
			var/class = input("What kind of variable?","Variable Type",default) in list("Text","Num","Type","Reference","Icon","File","Restore to default","List","Null","Cancel")
			record(ACTION_MESSAGE,
					user = src.key,
					target =O:name,
					notes = "[O:name] was edited by [src.name]([src.key])")

			switch(class)
				if("Cancel")
					return
				if("Restore to default")
					O:vars[variable] = initial(O:vars[variable])
				if("Text")
					O:vars[variable] = input("Enter new text:","Text",O:vars[variable]) as text
				if("Num")
					O:vars[variable] = input("Enter new number:","Num",O:vars[variable]) as num
				if("Type")
					O:vars[variable] = input("Enter type:","Type",O:vars[variable]) in typesof(/obj,/mob,/area,/turf)
				if("Reference")
					O:vars[variable] = input("Select reference:","Reference",O:vars[variable]) as mob|obj|turf|area in world
				if("File")
					O:vars[variable] = input("Pick file:","File",O:vars[variable]) as file
				if("Icon")
					O:vars[variable] = input("Pick icon:","Icon",O:vars[variable]) as icon
				if("List")
					input("This is what's in [variable]") in O:vars[variable] + list("Close")
				if("Null")
					if(alert("Are you sure you want to clear this variable?","Null","Yes","No") == "Yes")
						O:vars[variable] = null


