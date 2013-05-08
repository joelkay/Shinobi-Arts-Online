var/Leafoption1=0
var/Leafoption2=0
var/Leafoption3=0
var/Leafoption4=0
var/Leafoption5=0
var/Mistoption1=0
var/Mistoption2=0
var/Mistoption3=0
var/Mistoption4=0
var/Mistoption5=0
var/Sandoption1=0
var/Sandoption2=0
var/Sandoption3=0
var/Sandoption4=0
var/Sandoption5=0
var/Leaf_Orb = 0
var/Sand_Orb = 0
var/Mist_Orb = 0
var/Max_Orb = 100//////////////max
var/Leaf_maxrate = 40
var/Sand_maxrate = 40
var/Mist_maxrate = 40
var/Mist_poweratk= 0
var/Leaf_poweratk= 0
var/Sand_poweratk= 0
var/Mist_powerdef= 0
var/Leaf_powerdef= 0
var/Sand_powerdef= 0
////NOT ADDED WAR ADITIONS DO IT LATER

mob/Owner
	verb
		Reset_Orb()
			set category = "Orbs"
			switch(alert("Would you like to reset the Village Orbs?","Orbs","Yes","Cancel"))
				if("Yes")
					Leafoption1=0
					Leafoption2=0
					Leafoption3=0
					Leafoption4=0
					Leafoption5=0
					Mistoption1=0
					Mistoption2=0
					Mistoption3=0
					Mistoption4=0
					Mistoption5=0
					Sandoption1=0
					Sandoption2=0
					Sandoption3=0
					Sandoption4=0
					Sandoption5=0
					Leaf_Orb = 0
					Sand_Orb = 0
					Mist_Orb = 0
					Leaf_maxrate = 100
					Sand_maxrate = 100
					Mist_maxrate = 100
					Mist_poweratk= 0
					Leaf_poweratk= 0
					Sand_poweratk= 0
					Mist_powerdef= 0
					Leaf_powerdef= 0
					Sand_powerdef= 0
					prestcangain=1

mob/hokage
	verb
		Use_Orb()
			set category = "Orb"
			//reset them//
			Leafoption1=0//for ppl who log in
			Leafoption2=0
			Leafoption3=0
			Leafoption4=0
			Leafoption5=0

			Mistoption1=0
			Mistoption2=0
			Mistoption3=0
			Mistoption4=0
			Mistoption5=0

			Sandoption1=0
			Sandoption2=0
			Sandoption3=0
			Sandoption4=0
			Sandoption5=0
			if(src.Village=="Leaf" && Leaf_Orb<=0 ||src.Village=="Sand" && Sand_Orb<=0 || src.Village=="Mist" && Mist_Orb<=0)
				src<<"You need an Orb with power of over 0."
				return

			var/list/options2 = list("Max-Rate Increase","Boost Attack Power","Boost Defence Power","Economy Boost","Help Other Village","Buy Chuunin")//,"Change Server Password")
			switch(input("What would you like your village to specialise in?","Configure Village") as null|anything in options2)
				if("Max-Rate Increase")
					switch(alert("Would you like to specialise in max-rate increase?","Max-Rate Increase","Yes","Cancel"))
						if("Yes")
							if(src.Village=="Leaf")
								Leafoption1=1
								var/boost=Leaf_Orb
								Leaf_Orb=0
								Leaf_maxrate = 40+(boost/50*200)
								src<<"New [src.Village] max-rate is [Leaf_maxrate].."
								src.learningcurve=Leaf_maxrate
								for(var/client/c in players)
									var/mob/M=c.mob
									if(M.Village=="Leaf")
										M<<"The max rate for [M.Village] has been increaed by the kage.."
										M.learningcurve=Leaf_maxrate





							if(src.Village=="Sand")
								Sandoption1=1
								var/boost=Sand_Orb
								Sand_Orb=0
								Sand_maxrate = 40+(boost/50*200)
								src<<"New [src.Village] max-rate is [Sand_maxrate].."
								src.learningcurve=Sand_maxrate
								for(var/client/c in players)
									var/mob/M=c.mob
									if(M.Village=="Sand")
										M<<"The max rate for [M.Village] has been increaed by the kage.."
										M.learningcurve=Sand_maxrate



							if(src.Village=="Mist")
								Mistoption1=1
								var/boost=Mist_Orb
								Mist_Orb=0
								Mist_maxrate = 40+(boost/50*200)
								src<<"New [src.Village] max-rate is [Mist_maxrate].."
								src.learningcurve=Mist_maxrate
								for(var/client/c in players)
									var/mob/M=c.mob
									if(M.Village=="Mist")
										M<<"The max rate for [M.Village] has been increaed by the kage.."
										M.learningcurve=Mist_maxrate


						if("Cancel")
							return

				if("Boost Attack Power")
					switch(alert("Would you like to specialise in Village Attack?","Village Attack","Yes","Cancel"))
						if("Yes")
							if(src.Village=="Leaf")
								Leafoption2=1
								var/boost=Leaf_Orb
								Leaf_Orb=0
								Leaf_poweratk = boost/2
								src<<"New [src.Village] Attack boost is [Leaf_poweratk].."
								src.dexterityboost=Leaf_poweratk
								src.reflexboost=Leaf_poweratk
								src.strengthboost=0
								src.resistanceboost=0
								for(var/client/c in players)
									var/mob/M=c.mob
									if(M.Village=="Leaf")
										M<<"New [src.Village] Attack boost is [Leaf_poweratk].."
										M.dexterityboost=Leaf_poweratk
										M.reflexboost=Leaf_poweratk
										M.strengthboost=0
										M.resistanceboost=0

							if(src.Village=="Sand")
								Sandoption2=1
								var/boost=Sand_Orb
								Sand_Orb=0
								Sand_poweratk = boost/2
								src<<"New [src.Village] Attack boost is [Sand_poweratk].."
								src.dexterityboost=Sand_poweratk
								src.reflexboost=Sand_poweratk
								src.strengthboost=0
								src.resistanceboost=0
								for(var/client/c in players)
									var/mob/M=c.mob
									if(M.Village=="Sand")
										M<<"New [src.Village] Attack boost is [Sand_poweratk].."
										M.dexterityboost=Sand_poweratk
										M.reflexboost=Sand_poweratk
										M.strengthboost=0
										M.resistanceboost=0

							if(src.Village=="Mist")
								Mistoption2=1
								var/boost=Mist_Orb
								Mist_Orb=0
								Mist_poweratk = boost/2
								src<<"New [src.Village] Attack boost is [Mist_poweratk].."
								src.dexterityboost=Mist_poweratk
								src.reflexboost=Mist_poweratk
								src.strengthboost=0
								src.resistanceboost=0
								for(var/client/c in players)
									var/mob/M=c.mob
									if(M.Village=="Mist")
										M<<"New [src.Village] Attack boost is [Mist_poweratk].."
										M.dexterityboost=Mist_poweratk
										M.reflexboost=Mist_poweratk
										M.strengthboost=0
										M.resistanceboost=0

						if("Cancel")
							return

				if("Boost Defence Power")
					switch(alert("Would you like to specialise in Village Defence?","Village Defence","Yes","Cancel"))
						if("Yes")
							if(src.Village=="Leaf")
								Leafoption3=1
								var/boost=Leaf_Orb
								Leaf_Orb=0
								Leaf_powerdef = boost/2
								src<<"New [src.Village] Defence boost is [Leaf_powerdef].."
								src.strengthboost=Leaf_powerdef
								src.resistanceboost=Leaf_powerdef
								src.dexterityboost=0
								src.reflexboost=0
								for(var/client/c in players)
									var/mob/M=c.mob
									if(M.Village=="Leaf")
										M<<"New [src.Village] Defence boost is [Leaf_powerdef].."
										M.strengthboost=Leaf_powerdef
										M.resistanceboost=Leaf_powerdef
										M.dexterityboost=0
										M.reflexboost=0

							if(src.Village=="Sand")
								Sandoption3=1
								var/boost=Sand_Orb
								Sand_Orb=0
								Sand_powerdef = boost/2
								src<<"New [src.Village] Defence boost is [Sand_powerdef].."
								src.strengthboost=Sand_powerdef
								src.resistanceboost=Sand_powerdef
								src.dexterityboost=0
								src.reflexboost=0
								for(var/client/c in players)
									var/mob/M=c.mob
									if(M.Village=="Sand")
										M<<"New [src.Village] Defence boost is [Sand_powerdef].."
										M.strengthboost=Sand_powerdef
										M.resistanceboost=Sand_powerdef
										M.dexterityboost=0
										M.reflexboost=0

							if(src.Village=="Mist")
								Mistoption3=1
								var/boost=Mist_Orb
								Mist_Orb=0
								Mist_powerdef = boost/2
								src<<"New [src.Village] Defence boost is [Mist_powerdef].."
								src.strengthboost=Mist_powerdef
								src.resistanceboost=Mist_powerdef
								src.dexterityboost=0
								src.reflexboost=0
								for(var/client/c in players)
									var/mob/M=c.mob
									if(M.Village=="Mist")
										M<<"New [src.Village] Defence boost is [Mist_powerdef].."
										M.strengthboost=Mist_powerdef
										M.resistanceboost=Mist_powerdef
										M.dexterityboost=0
										M.reflexboost=0

						if("Cancel")
							return

				if("Economy Boost")
					switch(alert("Would you like to Boost the Economy?","Economy Boost","Yes","Cancel"))
						if("Yes")
							if(src.Village=="Leaf")
								Leafoption4=1
								var/boost=Leaf_Orb
								Leaf_Orb=0
								var/D=(boost/50)*100
								Leafeconomp+=boost
								src<<"Boosted Economy by [D]%"
								for(var/client/c in players)
									var/mob/M=c.mob
									if(M.Village=="Leaf")
										M<<"The Kage Boosted Economy by [D]%"
								Leaf_Orb=100

							if(src.Village=="Sand")
								Sandoption4=1
								var/boost=Sand_Orb
								Sand_Orb=0
								var/D=(boost/50)*100
								Sandeconomp+=boost
								src<<"Boosted Economy by [D]%"
								for(var/client/c in players)
									var/mob/M=c.mob
									if(M.Village=="Sand")
										M<<"The Kage Boosted Economy by [D]%"
								Sand_Orb=100

							if(src.Village=="Mist")
								Mistoption4=1
								var/boost=Mist_Orb
								Mist_Orb=0
								var/D=(boost/50)*100
								Misteconomp+=boost
								src<<"Boosted Economy by [D]%"
								for(var/client/c in players)
									var/mob/M=c.mob
									if(M.Village=="Mist")
										M<<"The Kage Boosted Economy by [D]%"
								Mist_Orb=100


				if("Help Other Village")
					switch(alert("Would you like to Help Another Village?","Help Other Village","Yes","Cancel"))
						if("Yes")
							if(src.Village=="Leaf")
								Leafoption5=1
								var/boost=Leaf_Orb
								Leaf_Orb=0
								var/list/options3 = list("Sand","Mist")//,"Change Server Password")
								switch(input("Who would you like to help?","Choose Village") as null|anything in options3)
									if("Sand")
										Sand_Orb(boost)
										world<<"Leaf has helped boost Sand Villages Orb.."

									if("Mist")
										Mist_Orb(boost)
										world<<"Leaf has helped boost Mist Villages Orb.."


							if(src.Village=="Sand")
								Sandoption5=1
								var/boost=Sand_Orb
								Sand_Orb=0
								var/list/options4 = list("Leaf","Mist")//,"Change Server Password")
								switch(input("Who would you like to help?","Choose Village") as null|anything in options4)
									if("Leaf")
										Leaf_Orb(boost)
										world<<"Sand has helped boost Leaf Villages Orb.."

									if("Mist")
										Mist_Orb(boost)
										world<<"Sand has helped boost Mist Villages Orb.."


							if(src.Village=="Mist")
								Mistoption5=1
								var/boost=Mist_Orb
								Mist_Orb=0
								var/list/options5 = list("Sand","Leaf")//,"Change Server Password")
								switch(input("Who would you like to help?","Choose Village") as null|anything in options5)
									if("Sand")
										Sand_Orb(boost)
										world<<"Mist has helped boost Sand Villages Orb.."

									if("Mist")
										Leaf_Orb(boost)
										world<<"Mist has helped boost Leaf Villages Orb.."




				if("Host Chuunin")
					switch(alert("Would you like to Host a Chuunin Exam...50 orb power?","Chuunin","Yes","Cancel"))
						if("Yes")
							if(src.Village=="Leaf")
								if(Leaf_Orb>=50)
									Leaf_Orb-=50
									src.Chuunreset=0
									src<<"You may now host a chuunin exam.."
									src<<"Everyone who pays to watch or enter the exam pays money to your village economy.."
									world<<"[src] spent [src.Village] Orb power to host a chuunin exam.."
									return
								else
									src<<"Need 50+ Orb.."

							if(src.Village=="Sand")
								if(Sand_Orb>=50)
									Sand_Orb-=50
									src.Chuunreset=0
									src<<"You may now host a chuunin exam.."
									src<<"Everyone who pays to watch or enter the exam pays money to your village economy.."
									world<<"[src] spent [src.Village] Orb power to host a chuunin exam.."
									return
								else
									src<<"Need 50+ Orb.."

							if(src.Village=="Mist")
								if(Mist_Orb>=50)
									Mist_Orb-=50
									src.Chuunreset=0
									src<<"You may now host a chuunin exam.."
									src<<"Everyone who pays to watch or enter the exam pays money to your village economy.."
									world<<"[src] spent [src.Village] Orb power to host a chuunin exam.."
									return
								else
									src<<"Need 50+ Orb.."







var/tmp/prestcangain=1
proc
	Leaf_Orb(num)
		if(!prestcangain)
			return
		if(Leaf_Orb<0)
			Leaf_Orb=0
			return
		if(Leaf_Orb>=Max_Orb)
			Leaf_Orb=200
			world<<"Leaf is at Max_Orb. It has recieved 200% enhancement. also other villages can no longer gain Orb power"
			world<<"Leaf gets to keep this Orb ability for 10 minutes.."
			Goldenage(1)
			return
		else
			Leaf_Orb+=num
			for(var/client/c in players)
				var/mob/M=c.mob
				if(M.Orbshow)
					M<<"<font color=green>Leaf Village gains [num] Orb.."


	Sand_Orb(num)
		if(!prestcangain)
			return
		if(Sand_Orb<0)
			Sand_Orb=0
			return
		if(Sand_Orb>=Max_Orb)
			Sand_Orb=200
			world<<"Sand is at Max_Orb. It has recieved 200% enhancement. also other villages can no longer gain Orb power"
			world<<"Sand gets to keep this Orb ability for 10 minutes.."
			Goldenage(2)
			return
		else
			Sand_Orb+=num
			for(var/client/c in players)
				var/mob/M=c.mob
				if(M.Orbshow)
					M<<"<font color=yellow>Sand Village gains [num] Orb.."



	Mist_Orb(num)
		if(!prestcangain)
			return
		if(Mist_Orb<0)
			Mist_Orb=0
			return
		if(Mist_Orb>=Max_Orb)
			Mist_Orb=200
			world<<"Mist is at Max_Orb. It has recieved 200% enhancement. also other villages can no longer gain Orb power"
			world<<"Mist gets to keep this Orb ability for 10 minutes.."
			Goldenage(3)
			return
		else
			Mist_Orb+=num
			for(var/client/c in players)
				var/mob/M=c.mob
				if(M.Orbshow)
					M<<"<font color=blue>Mist Village gains [num] Orb.."



	Goldenage(vil)
		prestcangain=0
		spawn(36000)//10 minutes
			prestcangain=1// turns it backon.
			world<<"The Orbs have been reset..."
			if(vil==1)
				Sand_Orb=0
				Mist_Orb=10
				Leaf_Orb=10
				return
			if(vil==2)
				Sand_Orb=10
				Mist_Orb=0
				Leaf_Orb=10
				return
			if(vil==3)
				Sand_Orb=10
				Mist_Orb=10
				Leaf_Orb=0
				return

mob
	verb
		Check_Orb()
			set category = "Orb"
			var/F=round(Leaf_Orb)
			src<<"<font color=green>Leaf Village has [F]% Orb.."

			var/G=round(Sand_Orb)
			src<<"<font color=yellow>Sand Village has [G]% Orb.."

			var/H=round(Mist_Orb)
			src<<"<font color=blue>Mist Village has [H]% Orb.."

			if(src.Village=="Leaf"||src.Village=="Sand"||src.Village=="Mist")
				src<<"You have contributed [src.contribution] to your Village so Far.."


		Show_Orb_Changes()
			set category= "Orb"
			if(!src.Orbshow)
				src<<"You will now be notifed whenever Orb is gained.."
				src.Orbshow=1
				return
			else
				src<<"You will no longer be notifed whenever Orb is gained.."
				src.Orbshow=0
				return