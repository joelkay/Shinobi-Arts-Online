var/tmp/Tournament=0
var/tmp/list/Entries = list()
mob
	var/tmp/intourn=0
	var/tmp/spectating=0



mob
	proc
		jointournament()
			winset(src,null,{"
			war-button.text ="Join Tournament";
			war-button.command ="JoinTournament";
			war-button.is-visible ="true";

			spectate-button.text ="Spectate Tournament";
			spectate-button.is-visible ="true";
			spectate-button.command ="SpecatateTournament";

			unspectate-button.text ="Stop Spectate";
			unspectate-button.is-visible ="true";
			unspectate-button.command ="UnSpectate";;
			"})

		removejoin()
			winset(src,null,{"
			war-button.is-visible ="false";
			"})

		removejointournament()
			winset(src,null,{"
			war-button.is-visible ="false";
			spectate-button.is-visible ="false";
			unspectate-button.is-visible ="false";
			"})

mob
	verb
		JoinTournament()
			set hidden=1
			if(src.intourn)
				src<<"You're already in the tournament!"
				return
			Entries.Add(src)
			src.intourn=1
			src<<"You entered the tournament!"
			//////////////////////////////////////////////////////////
			src.Savedx=src.x ///incase of RELOOG
			src.Savedy=src.y
			src.Savedz=src.z
			//////////////////////////////////////////////////////////////////
			src.loc=locate(bm.x1+5,bm.y1+10,bm.z1) /// Change this LOC to your arenas loc!
			src.toggle()//show the map
			////////////////////////////////////////////////////
			src.life=100
			src.chakra=src.max_chakra
			src.health=src.max_health
			src.canregen=1
			spawn() src.regeneration()
			src.pk=0

	verb
		SpecatateTournament()
			set hidden=1
			var/mob/M = input("Who do you wish to Spectate?") in Entries + list("Cancel")
			if(M=="Cancel") return

			src.client.eye = M
			src<<"Spectating [M]"
			spectating=1

			var/area/A = M.loc
			while(A && !istype(A))
				A = A.loc
				if(A)
					//src<<"youre in [A]" for bug testing purposes
					src.uncover(A.number)
			src.client.eye = M
			src<<"Spectating [M]"
			spectating=1

	verb
		UnSpectate()
			set hidden=1
			src.client.eye = src
			src<<"Viewing stopped"
			spectating=0





var/swapmap/wr
var/swapmap/bm
var/list/tourneymaps=list()


proc
	Tournamentsetup()
		wr = SwapMaps_CreateFromTemplate("Maps/waiting room")	 //load the fighting map
		bm	= SwapMaps_CreateFromTemplate("Maps/tournament")	 //load the waiting map
		covermap(wr)
		covermap(bm)
		tourneymaps.Add(wr)
		tourneymaps.Add(bm)



proc
	Tournament_AI()
		if(Entries.len==1)
			world<<"Tournament over, winner is:"
			for(var/mob/K in Entries)
				var/amm=rand(1000,3000)
				K.money += amm
				K.torwins += 1
				K.Respawn()
				K<<"You won [amm].."
				world<<"[K.name]"
				Entries.Remove(K)
				K.Respawn()

				for(var/client/c in players)
					var/mob/M=c.mob
					M.removejointournament()

				//for(var/swapmap/D in tourneymaps)
				//	D.Del()

			Tournament=0

		else
			goto doit
		doit
			for(var/client/c in players)
				var/mob/M=c.mob
				if(M.intourn)
					var/tmp/mob/A=pick(Entries)
					var/tmp/mob/B=pick(Entries)
					if(A==B||!A||!B)
						if(Entries.len==1)
							Tournament_AI()
						else
							goto doit
					sleep(10)
					world<<"Tournament Announcer: Okay lets start this match!"
					sleep(20)
					world<<"Tournament Announcer: This match will be...."
					sleep(30)
					world<<"Tournament Announcer: [A] .VS. [B]!"
					B.loc=locate(wr.x1+5,wr.y1+5,wr.z1) /// locate them to a specific place.
					A.loc=locate(wr.x1+15,wr.y1+10,wr.z1) /// locate them to a specific place.
					////////////////////////////////////////////////////////////////
					A.toggle()//show the map
					B.toggle()//show the map
					////////////////////////////////////////////////////////////////
					A.tourndied=0
					B.tourndied=0
					A.intourn = 1// for death proc
					B.intourn = 1
					A.pk=1
					B.pk=1// can attack eachother
					A.canmove=0
					B.canmove=0
					sleep(20)
					world<<"Tournament Announcer: ready!"
					sleep(10)
					world<<"Tournament Announcer: Fight!"
					A.canmove=1
					B.canmove=1
					A.canarr=0
					B.canarr=0
					Fight(A,B)
					return



proc
	Fight(mob/A,mob/B)
		begin
			A.Death(A)
			B.Death(B)
			if(A.tourndied >= 1) /// YOU MIGHT HAVE TO CHANGE THIS INCASE YOUR health VAR IS DIFF, see: your death proc for more info
				world<<"[B] has won against [A]!"
				Entries.Remove(A)
				A.tourndied=0
				A.Respawn()
				B.loc=locate(bm.x1+5,bm.y1+10,bm.z1) /// relocate the winner.
				B.toggle()//show the map
				////////////////////////////////////////////////////
				B.money += rand(200,500)
				B<<"You gained some money.."
				B.life=100
				B.chakra=B.max_chakra
				B.health=B.max_health
				B.canregen=1
				spawn() B.regeneration()
				sleep(50)
				Tournament_AI()
				return // stop runtime errors

			if(B.tourndied >= 1) /// YOU MIGHT HAVE TO CHANGE THIS INCASE YOUR health VAR IS DIFF, SEE: your death proc for more info
				world<<"[A] has won against [B]!"
				Entries.Remove(B)
				B.tourndied=0
				B.Respawn()
				A.loc=locate(bm.x1+5,bm.y1+10,bm.z1) /// relocate the winner.
				A.toggle()//show the map
				////////////////////////////////////////////////////
				A.money += rand(200,500)
				A<<"You gained some money.."
				A.life=100
				A.chakra=A.max_chakra
				A.health=A.max_health
				A.canregen=1
				spawn() A.regeneration()
				sleep(50)
				Tournament_AI()
				return // stop runtime errors
			else
				sleep(10)
				goto begin




