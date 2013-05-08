var/NPCDELAY=10//this can be changed to slow down the speed NPC's process their next moves.
var/CLANS=list("Uchiha","Hyuuga")

mob/NPC
	var/action=""//what they want to process
	var/spawnx///
	var/spawny//where they re"SPAWN"
	var/spawnz///
	var/PROCESS=1//what kind of npc is it; 1 means they "WALK" e.t.c... 0 means they stay still
	var/HOSTILE=1//fighter or quest giver
	var/GUARD=0
	var/list/Skilllist=list()//skills

	//regen//
	healthregen=100
	chakraregen=100
	energyregen=50


	New()
		..()
		if(!src.Shadow_Clone)
			src.action="SPAWN"//they "SPAWN" in this state
			spawnx=src.x
			spawny=src.y
			spawnz=src.z

			if(!summonnpc)
				src.max_health=5000
				src.max_chakra=2000
				src.life=100
				src.reflexmain = 30
				src.dexteritymain = 30
				src.resistancemain = 30
				src.strengthmain = 30
				src.chakraforcemain =30
				src.agilitymain = 30
				src.attackrate=1
				src.Affirm_Icon()
				src.Load_Overlays()

			src.npcd=1//npc respawn
			src.process()//no mob going through
		else
			if(!summonnpc)//wolves snakes, etc
				src.max_health=5000
				src.max_chakra=2000
				src.life=100
				src.Affirm_Icon()
				src.Load_Overlays()
				//////////////////////////make these similar to owners set of skillz
				var/skillseta=list("Chidori_Blade","Chidori_Nagashi")
				var/skillsetb=list("Mystic_Fire_Dragon","Katonball","Multiple_FirePoenix")
				var/skillsetc=list("Fuuton_Sweep","Fuuton_Blast","Fuuton_Slice","Fuuton_Tornado")

				src.Skilllist=pick(skillseta,skillsetb,skillsetc)



	proc/process()// the brain of each npc
		set background=1
		while(src.PROCESS)// non process
			sleep(NPCDELAY)
			if(src.life<=0)break//stop processing
			if(src.koed)
				spawn(10) process()//dont move when koed
				break
			switch(src.action)
				if("SPAWN")
					src.action="WALK"//first iteration
					src.Clan=pick(CLANS)
					src.initiate()
					src.Nwalk()

				if("WALK")
					src.Nwalk()
					src.Nlook()//guards


				if("ATTACK")
					if(!summonnpc)//wolves snakes, etc
						src.Nattack()
					else
						src.Nattackclose()

				if("APPROACH")
					src.Napproach()


				if("RESET")
					src.targeted=null
					src.x=spawnx
					src.y=spawny
					src.z=spawnz
					src.action="WALK"//first iteration

					/*
					if(TestMobs(src))
						src.Nwalk()

					else
						src.action="RESET"//first iteration

					//	src.PROCESS=0//turn them back on how?
					//give them "RESET"
					*/





	proc/initiate()
		if(src.HOSTILE&&!summonnpc)
			var/skillseta=list("Chidori_Blade","Chidori_Nagashi")
			var/skillsetb=list("Fireblast","Mystic_Fire_Dragon","Katonball","Multiple_FirePoenix")
			var/skillsetc=list("Fuuton_Sweep","Fuuton_Blast","Fuuton_Slice","Fuuton_Tornado")
			var/skillsetd=list("Suiton_Wave","Suiton_GiantWave","Suiton_Dragon")
			var/skillsete=list("Chamber_of_Nothingness","Doton_MudBullets")

			src.Skilllist=pick(skillseta,skillsetb,skillsetc,skillsetd,skillsete)



	proc/Nwalk()//the "WALK" nerve
		set background = 1
		if(src.action!="WALK")
			return//recursive calls
		var/nextdir=pick(NORTH,SOUTH,EAST,WEST,NORTHEAST,NORTHWEST,SOUTHEAST,SOUTHWEST)
		var/turf/x = get_step(src,nextdir)
		if(!x || x.density==1)
			return
		var/obj/WATER/O
		if(O in x)
			return//dodge water

		src.runon=0
		step(src,nextdir)


	proc/Nattackclose()
		var/mob/M=src.targeted
		if(!M)
			src.action="RESET"
			return

		src.Facedir(M)
		var/dist=get_dist(src,M)

		if(dist<2)
			Move(M.loc)
			src.Facedir(M)
			Attack(src,M)//"ATTACK" them
			src.action="ATTACK"
			return

		if(dist>5 && dist<=15)// in shunshin range
			src.Facedir(M)
			src.action="APPROACH"//chase them down
			return

		else
			src.action="RESET"//chase them down



	proc/Nattack()
		var/mob/M=src.targeted
		if(!M)
			src.action="RESET"
			return

		src.Facedir(M)
		var/dist=get_dist(src,M)
		var/closeatk=pick(0,1)//50% chance
		var/dokawa=pick(1,2,3,4,5)
		var/skill=pick(src.Skilllist)

		if(dist<2)
			Move(M.loc)
			src.Facedir(M)
			if(closeatk)
				Attack(src,M)//"ATTACK" them
			else
				src.Skills("[skill]")
			if(dokawa>3)
				src.Skills("Body_Replacement_Technique")
			return

		if(dist>2 && dist<=15)// in shunshin range
			src.Skills("Body_Flicker")
			return

		else
			src.Facedir(M)
			src.Skills("[skill]")
			src.action="APPROACH"//chase them down




	proc/Napproach()
		set background=1
		var/mob/M=src.targeted
		if(!M)
			src.action="RESET"
			return
		var/dist=get_dist(src,M)
		src.Facedir(M)

		if(dist<2)
			spawn() Attack(src,M)//"ATTACK" them
			src.action="ATTACK"

		if(dist>2 && dist<=15)// in shunshin range
			src.Skills("Body_Flicker")
			return

		if(dist>10 && dist<=30)
			step_to(src,M,1)
			return

		if(dist>30)
			src.action="RESET"

		else//if all the loops fail just reset
			src.action="RESET"






	proc/Ndecide(mob/M)//when they recieve damage.
		if(M.Village!=src.Village)
			src.targeted=M
			src.action="ATTACK"



	proc/Nlook()
		set background=1
		if(src.GUARD)
			var/mob/M
			for(M in view(15,src))
				if(M.Village!=src.Village)
					src.action="ATTACK"
					src.targeted=M
					break












