mob
	proc/Skillrasengan(r)
		switch(r)

			//rasengans

			if("Rasengan")
				if(src.chidorion||src.drillon)
					src << output("[src]: You can't stack skills!", "combatlog")
					return
				src << output("[src]: You begin go charge Rasengan!", "combatlog")
				src.overlays+='rasengan.dmi'
				src.icon_state="rasengancreate"
				src.canmove=0
				var/charged=50
				if(src.Clan=="Uzumaki")
					src.rasthrow()
					charged=25//takes less time
				CHARGING
				if(charged>=100)
					src.canmove=1
					src.rasenganon=1
					src.movespeed=0
					src.doing=0
					src << output("<font oolor=blue>You are now done charging rasengan press Q to charge in the direction you are facing....", "combatlog")
					return
				else
					charged+=src.chargerate//this var where is it :D
					src << output("<font oolor=blue>Charging [charged]% completed!", "combatlog")
					sleep(10)
					goto CHARGING



			if("Oodama_Rasengan")
				src << output("[src]: Oodama_Rasengan!", "combatlog")
				src << output("[src] quickly attack an opponent with A !", "combatlog")
				src.overlays+='rasengano.dmi'
				if(src.Clan=="Uzumaki")
					src.rasthrow()
				src.rasenganon=1
				src.chakraforceplus+=20
				sleep(60)
				src.chakraforceplus-=20
				src.overlays-='rasengano.dmi'