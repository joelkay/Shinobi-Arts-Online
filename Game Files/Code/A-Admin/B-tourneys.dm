var/tmp/Clickedboi=0

mob/Owner
	verb
		Begin()
			set category="Tourny"
			set desc = "Begin Tournament"
			set name="Begin Tournament"
			switch(alert("Are you sure you wish to start a tournament?","Confirm","Yes","No"))
				if("No")
					usr<<"Cancelled."
				if("Yes")
					if(Tournament)
						usr<<"There's already a tournament going on!."
						return
					if(Chuunin)
						usr<<"There's a chuunin tournament going on!."
						return
					Tournament=1

					usr<<"setting up the maps!."
					Tournamentsetup()
					usr<<"maps loaded!."

					for(var/client/c in players)
						var/mob/M=c.mob
						M.jointournament()
					world<<"[usr.name] has started a tournament, join now!."

					sleep(300)
					if(!Entries.len)
						for(var/client/c in players)
							var/mob/P=c
							P.removejointournament()
						world<<"0 Players entered, tournament cancelled.."
						return


					world<<"Tournament Entries are now over. Tournament Begining..."

					for(var/client/c in players)
						var/mob/K=c.mob
						K.removejoin()

					Tournament_AI()

		Chuuninfight()
			set category = "Chuunin"
			set name="Chuunin Fights stage 2(Fight)"
			switch(alert("Are you sure you wish to start the chuunin fights?","Confirm","Yes","No"))
				if("No")
					usr<<"Cancelled."
				if("Yes")
					if(Chuunin)
						usr<<"There's already a chuunin tourny going on!."
						return
					if(Tournament)
						usr<<"There's a tournament going on!."
						return
					Chuunin=1
					for(var/client/c in players)
						var/mob/M=c.mob
						M.joinchuunin()

					world<<"The Chuunin preliminaries will now begin!."
					sleep(300)
					if(!Candidates.len)
						for(var/client/c in players)
							var/mob/P=c
							P.removejoinchuunin()

						world<<"0 Players entered, chuunin cancelled.."
						return
					world<<"Chuunin Entries are now over. Chuunin Begining..."
					Chuunin_AI()

		EndTornament()
			set category = "Tourny"
			world<<"Tournament(s) have been manualy stopped by [usr.name]..."
			Tournament=0
			Chuunin=0
			for(var/client/c in players)
				var/mob/M=c.mob
				M.removejointournament()

			for(var/mob/K in Entries)
				Entries.Remove(K)
			for(var/mob/M in Candidates)
				Candidates.Remove(M)

			for(var/swapmap/D in tourneymaps)
				D.Del()

		Force_Entry(client/c in players)
			set category = "Tourny"
			set name="Force tournament entry"
			var/mob/M=c.mob
			if(Entries.Find(M))
				return /// another demo verb, remove if you wish..
			Entries.Add(M)
			M.intourn=1
		Check_Entries()
			set category = "Tourny"
			var/tmp/C=0
			var/tmp/D=0
			for(var/mob/M in Entries) /// you might wanna keep this verb.
				C+=1
				usr<<M
			for(var/mob/M in Candidates) /// you might wanna keep this verb.
				D+=1
				usr<<M
			usr<<"[C] people in the tournament."
			usr<<"[D] people in the Chuunin."