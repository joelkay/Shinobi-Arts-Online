mob
	var
		tmp/isrunning=0

	proc
		stataz()//this is the vars with adds or minuses
			if(!src.loggedin)return
			src.reflexmain=(src.reflex+src.reflexplus+src.reflexboost)-src.reflexminus
			src.dexteritymain=(src.dexterity+src.dexterityplus+src.dexterityboost)-src.dexterityminus
			src.resistancemain=(src.resistance+src.resistanceplus+src.resistanceboost)-src.resistanceminus
			src.strengthmain=(src.strength+src.strengthplus+src.strengthboost)-src.strengthminus
			src.chakraforcemain=(src.chakraforce+src.chakraforceplus+src.chakraforceboost)-src.chakraforceminus
			src.agilitymain=(src.agility+src.agilityplus+src.agilityboost)-src.agilityminus
			src.attackrate=(src.reflexmain/src.agilitymain)
			if(attackrate<5)
				attackrate=5
			if(attackrate>10)
				attackrate=10

mob
	proc
		Respawn()
			if(src.Village=="Leaf")// spawn points
				src.loc=locate("LeafHospitalRespawn")//Leaf hosp spawn location
				src.Reset()
				return

			if(src.Village=="Sand")
				src.loc=locate("SandHospitalRespawn")//Leaf hosp spawn location change to Sand
				src.Reset()
				return

			if(src.Village=="Mist")
				src.loc=locate("MistHospitalRespawn")//Leaf hosp spawn location change to Mist
				src.Reset()
				return

			else
				src.loc=locate("LeafHospitalRespawn")//Leaf hosp spawn location change to Mist
				src.Reset()
				return
mob
	proc
		Reset()
			src.willused=0//may use will again
			src.koed=0
			src.canregen=1
			src.doing=0
			src.canmove=1
			src.icon_state=""
			src.life=100
			src.energy=src.max_energy
			src.chakra=src.max_chakra
			src.health=src.max_health
			src.canregen=1
			spawn() src.regeneration()
			src.canarr=0// cant press R to die
			src.overlayremoval()
			src.Affirm_Icon()
			src.Load_Overlays()
			src.pk=0//hit ppl
			/*
			for(var/client/c in players)
				var/mob/M=c.mob
				if(M.binded==src)
					M.binded=""
			*/
			//set all stats to recovery value, and insert code for death penalties.

mob
	proc
		overlayremoval()
			src.overlays-='chakra gain.dmi'








mob/var/tmp/inreg=0
mob
	proc
		regeneration()
			set background = 1
			if(inreg)return

			if(life>100)
				Death(src)
				return

			if(!src.canregen||src.koed||src.life<=0)
				spawn(10) regeneration()//wait till its ready

			while(src.canregen&&!src.koed&&src.life>=0)
				sleep(10)
				inreg=1
				var/canhealth=1
				spawn()
					if(src.chakra<0)src.chakra=0
					if(src.chakra<src.max_chakra) //regen chakra
						canhealth=0
						src.chakra+=src.chakraregen
						if(src.chakra>src.max_chakra)
							src.chakra=src.max_chakra
						src.exp+=src.learningcurve
				spawn()
					if(src.energy<0)src.energy=0
					if(src.energy<src.max_energy) //regen energy
						canhealth=0
						src.energy+=src.energyregen
						src.energy+=src.energyregenboost
						if(src.energy>src.max_energy)
							src.energy=src.max_energy
						src.exp+=src.learningcurve
				spawn()
					//if(src.energy>=src.max_energy&&src.chakra>=src.max_chakra)
					if(src.health<0)src.health=0
					if(src.health<src.max_health&&canhealth) //or else heal.
						src.health+=src.healthregen
						src.exp+=src.learningcurve //add 10 exp whenever you regenerate health. Basic
						if(src.health>src.max_health)
							src.health=src.max_health


				//////////////////////////
				if(src.dizzy)
					src.dizzy-=src.dizzyrate       //as they regen it removes dizzyness
					if(src.dizzy<0)
						src.dizzy=0
				//////////////////////////////
				if(src.client)// so npcs dont go thru this.
					spawn()
						src.bodycheck()
						src.stataz()// added bonuses etc.
				//regenerate health? put stuff like this here. This happens every second.
			inreg=0







mob
	proc
		bodycheck()
			spawn()
				src.attributecheckr()
				src.attributecheckc()
				src.attributechecka()
				src.attributecheckd()
				src.attributecheckre()
				src.attributechecks()

			if(src.exp>src.maxexp) // your level times itself times 100 plus 1000 as an offset
				src.exp=0
				src.blevel++
				if(src.Village=="Leaf")
					Leaf_Orb-=0.02
				if(src.Village=="Sand")
					Sand_Orb-=0.02
				if(src.Village=="Mist")
					Mist_Orb-=0.02
				if(src.blevel>=81&&!usr.setmed)
					world<<"<font color=blue>[src] has attained the medal Over 80!</font>"
					world.SetMedal("Over 80!", usr)
					usr.setmed=1

				///////////////////////REGENS/////////////////////////////
				src.energyregen=10+(src.max_energy/500)
				src.chakraregen=30+(src.max_chakra/400)
				src.healthregen=10+(src.max_health/250)
				src.maxexp()
				//src.Save()
				var/params
				params=list(":.Level.:"=src.blevel)
				world.SetScores(src.key,list2params(params))

///////////////////////////////////////////////////////////////////////////////////////
				if(src.teamname)
					var/Team/x =new/Team
					x.teamname=src.teamname
					x.expshare(blevel)
////////////////////////////////////////////////////////////////////////////////////////
				if(src.max_health>=20000)
					src.max_health=20000
				else
					src.max_health=2000+round((src.blevel)*100)+(src.strength*11)//lvl1 = aprox 1600 health

				if(src.max_chakra>=10000)
					src.max_chakra=10000
				else
					src.max_chakra=1000+round((src.blevel)*100)+(src.chakraforce*8)// lvl1 = 300+100 = 1400 chakra

				if(src.max_energy>=12000)
					src.max_energy=12000
				else
					src.max_energy=500+round((src.blevel)*100)+(src.agility*5)
				return







mob/proc
	maxexp()
		src.maxexp=(src.blevel*src.blevel*100)+800 // your level times itself times 100 plus 800 as an offset

mob/proc
	Pk_Check()
		if(src.loc.loc)
			if(src.loc.loc:safe)
				src.pk=0
			else
				src.pk=1