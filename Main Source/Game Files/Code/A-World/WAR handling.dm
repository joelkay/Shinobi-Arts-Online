var/swapmap/WARMAP


proc
	CreateMaps()
		WARMAP=SwapMaps_CreateFromTemplate("Maps/warmap")
		covermap(WARMAP)//this updates swapmap names

world
	New()
		..()
		spawn() CreateMaps()

		Villages=new()
		Villages.Add("Leaf","Mist","Sand")//defaults

var
	list/Villages()
	tmp/WAR=0
	tmp/WAR2=0
	list/AttackerGuys=list()
	list/DefenderGuys=list()
	list/Attackers=list()
	list/Defenders=list()

mob
	proc
		WAR()
			if(!WARMAP)
				src<<"War Map not loaded.."
				return
			if(WAR)
				src<<"Theres a war going on.."
				return
			WAR=1
			switch(alert("Are you sure you wish to start a WAR?","Confirm","Yes","No"))

				if("No")
					src<<"Cancelled"
					WAR=0


				if("Yes")

					var/list/temp=new/list
					for(var/mob/M in people)
						if(M.kage&&M!=src)
							temp.Add("[M.Village]")

					if(!temp)
						src<<"No kages online"
						return

					var/G = input("Who do you wish to War?") in temp + list("Cancel")
					if(G=="Cancel") return

					for(var/mob/M in people)
						if(M.Village==G&&M.rank=="Kage")
							switch(alert(M,"[src] wants to start a war with your village accept?","WAR","Yes","No"))
								if("Yes")
									src<<"[M] accepted war offer your ninja are being told to gather in the war zone.."
									M<<"You accepted the war offer your ninja are being told to gather in the war zone.."

									spawn()
										src.Attackerjoin()//initiates the joining stuffs
										M.Defenderjoin()

									src.joinbutton()
									M.joinbutton()

									spawn() invitevillagers(src,M)
									inviteothervillage(src,M)


								if("No")
									src<<"[M] refused the WAR offer"
									WAR=0
									return



proc
	invitevillagers(mob/A,mob/B)
		set background=1
		for(var/mob/D in people)
			if(D.Village==A.Village||D.Village==B.Village&&D.rank!="Kage")
				D.joinbutton()
				D<<"A war has begun between [A.Village] and [B.Village], press join war to join it"

	invitevillagers2(mob/A,mob/B,mob/C)
		set background=1
		for(var/mob/D in people)
			if(D.Village==A.Village&&D.rank!="Kage")
				D.joinbutton()
				D<<"Your Kage has decided to help [B.Village] vs [C.Village] press join war to join it"


	inviteothervillage(mob/A,mob/B)
		set background=1
		for(var/mob/D in people)
			if(D.rank=="Kage"&&D.Village!=A.Village&&D.Village!=B.Village)//other kages
				D.joinwar(A,B)

mob/proc
	joinwar(mob/A,mob/B)

		var/list/warring=list()
		warring.Add("[A.Village]","[B.Village]")

		var/Help = input("[A.Village] is starting a war on [B.Village] who will you Help?..") in warring + list("None")

		var/mob/D=src

		if(Help=="[A.Village]")
			world<<"[D.Village] is helping [A.Village].."
			D.Attackerjoin()
			D.joinbutton()
			Attackers.Add(D.Village)
			spawn() invitevillagers2(D,A,B)


		if(Help=="[B.Village]")
			world<<"[D.Village] is helping [B.Village].."
			D.Defenderjoin()
			D.joinbutton()
			Defenders.Add(D.Village)
			spawn() invitevillagers2(D,B,A)


		if(Help=="None")
			world<<"[D.Village] is not going to participate.."

	joinbutton()
		winset(src,null,{"
		war-button.is-visible ="true";
		"})

	removejoinbutton()
		winset(src,null,{"
		war-button.is-visible ="false";
		"})













proc
	startwar()
		if(!WAR2&&AttackerGuys.len>0&&DefenderGuys.len>0)
			WAR2()//start war proc.



var/tmp/war2var=0
var/tmp/cantjoin
proc
	WAR2()
		set background=1
		if(war2var)
			return

		spawn(300)
			for(var/mob/D in people)
				D.removejoinbutton()
			cantjoin=1//cant join anymore

		WAR2=1
		war2var=1

		world<<"A War has begun!"

		while(AttackerGuys.len>0&&DefenderGuys.len>0)
			//world<<"Attackers have [AttackerGuys.len] members left"
			//world<<"Defenders have [DefenderGuys.len] members left"
			sleep(LAGDELAY)


		if(AttackerGuys.len<=0)
			Defenderwins()

		if(DefenderGuys.len<=0)
			Attackerwins()

		/*
		if(DefenderGuys.len<=0&&AttackerGuys.len<=0)
			///////RESET VARS/////////
			WAR=0
			WAR2=0
			war_message=0
			cantjoin=0
			AttackerGuys=new/list()
			DefenderGuys=new/list()
			world<<"A tie has happened!"
			for(var/mob/D in people)
				D.removejoinbutton()
				if(D.WAR)
					D.Respawn()
					D.asked=0
		*/





proc
	Attackerwins()
		///////RESET VARS/////////
		WAR=0
		WAR2=0
		war_message=0
		cantjoin=0
		AttackerGuys=new/list()
		DefenderGuys=new/list()
		if(!WAR)return

		for(var/X in Attackers)
			world<<"<font color=red>[X] has won a war, Economy has improved."
			if(X=="Leaf")
				Leafeconomp=20//plus
			if(X=="Sand")
				Sandeconomp=20//plus
			if(X=="Mist")
				Sandeconomp=20//plus
			Attackers.Remove(X)

		for(var/Z in Defenders)
			world<<"<font color=red>[Z]'s Economy has gone down.."
			if(Z=="Leaf")
				Leafeconomm=20//minus
			if(Z=="Sand")
				Sandeconomm=20//minus
			if(Z=="Mist")
				Sandeconomm=20//minus
			Defenders.Remove(Z)

		for(var/mob/D in people)

			D.removejoinbutton()

			if(D.WAR)
				D.Respawn()
				D.asked=0


proc
	Defenderwins()
		///////RESET VARS/////////
		WAR=0
		WAR2=0
		war_message=0
		cantjoin=0
		AttackerGuys=new/list()
		DefenderGuys=new/list()
		if(!WAR)return

		for(var/X in Defenders)
			world<<"<font color=red>[X] has won a war, Economy has improved."
			if(X=="Leaf")
				Leafeconomp=20//plus
			if(X=="Sand")
				Sandeconomp=20//plus
			if(X=="Mist")
				Sandeconomp=20//plus
			Defenders.Remove(X)

		for(var/Z in Attackers)
			world<<"<font color=red>[Z]'s Economy has gone down.."
			if(Z=="Leaf")
				Leafeconomm=20//minus
			if(Z=="Sand")
				Sandeconomm=20//minus
			if(Z=="Mist")
				Sandeconomm=20//minus
			Attackers.Remove(Z)

		for(var/mob/D in people)

			D.removejoinbutton()

			if(D.WAR)
				D.Respawn()
				D.asked=0



mob
	var/tmp/asked=0
	var/tmp/warring=1

var/tmp/war_message=0


mob
	verb
		JoinWar()
			set hidden=1
			if(src.Village in Attackers)
				src.Attackerjoin()

			if(src.Village in Defenders)
				src.Defenderjoin()

	proc
		Attackerjoin()
			set background=1
			if(cantjoin)
				src<<"Too late"
				return

			if(!src.asked&&src.warring)
				if(AttackerGuys.len)
					if(!AttackerGuys.Find(src))
						AttackerGuys.Add(src)
				else
					AttackerGuys.Add(src)

				src.WAR=1
				switch(src.Village)
					if("Leaf")
						src.loc=locate(WARMAP.x1+27,WARMAP.x1+95,WARMAP.z1)//28,96,1...leaf
					if("Sand")
						src.loc=locate(WARMAP.x1+9,WARMAP.x1+4,WARMAP.z1)//10,5,1...sand
					if("Mist")
						src.loc=locate(WARMAP.x1+95,WARMAP.x1+66,WARMAP.z1)//96,67,1...mist
				//toggle the map
				src.toggle()

				src.pk=1


				if(Attackers.len)
					if(!Attackers.Find(src.Village)) Attackers.Add(src.Village)
				else
					Attackers.Add(src.Village)

				src.asked=1

				if(!WAR2)
					startwar()



		Defenderjoin()
			set background=1
			if(cantjoin)
				src<<"Too late"
				return

			if(!src.asked&&src.warring)
				if(DefenderGuys.len)
					if(!DefenderGuys.Find(src))
						DefenderGuys.Add(src)
				else
					DefenderGuys.Add(src)

				src.WAR=1
				switch(src.Village)
					if("Leaf")
						src.loc=locate(WARMAP.x1+27,WARMAP.x1+95,WARMAP.z1)//28,96,1...leaf
					if("Sand")
						src.loc=locate(WARMAP.x1+9,WARMAP.x1+4,WARMAP.z1)//10,5,1...sand
					if("Mist")
						src.loc=locate(WARMAP.x1+95,WARMAP.x1+66,WARMAP.z1)//96,67,1...mist
				//toggle the map
				src.toggle()

				src.pk=1

				if(Defenders.len)
					if(!Defenders.Find(src.Village)) Defenders.Add(src.Village)
				else
					Defenders.Add(src.Village)

				src.asked=1


				if(!WAR2)
					startwar()







