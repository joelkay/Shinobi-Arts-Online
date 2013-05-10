mob
	var/tmp/hsealvalue=2//slep 0.2 seconds
	var/tmp/canlevel=0
	var/bypass=0


	proc/hseals(Skill/S)// all jutsu bypass this proc muahhahaha
		if(src.koed)
			return

		if(src.Clan=="Nara")
			if(S.sindex=="Shadow_possesion_Cancel"||"Shadow_NeckBind"||"Shadow_Needles")
				bypass=1
				src.Skills(S)

		if(src.doing||src.health<0||src.trapped||src.shadow||src.inmeat)//cant do jutsus while busy.
			return

		if(src.trapped||!src.canmove)
			return

		src.defending=0

		if(!src.pk)
			src<<"Non pk zone"
			return

		spawn()src.seals()//stop spam bro
		if(!bypass)src.Skills(S)//for damages that get stronger with level.







	proc/seals(src.hsealvalue)
		src.icon_state="jutsu exicute"//since they do seals already
		spawn(src.hsealvalue)
			src.icon_state=""//since they do seals already






	proc/ReturnPrice(var/txt)//return cooldowns and chakra for failed skills
		for(var/Skill/S in src.contents)
			if(S.sindex==txt)
				S.cooldown=0
				usr.chakra+=S.chakracost


	//	var/d=pick(1,2,3,4,5,6,7,8,9,10)
	//	if(d==3)
	//		src.ezing()


//	proc/ezing()
		//if(src.ezprocon)
		//	return
	//	else
		//	src.ezprocon=1
		//	//spawn(18000)
			//	src.canlevel=0
			//	src<<"EZ_AVOIDANCE_SYSTEM: Click The (Im Not Ezing) button in the ANTI-EZ tab if you want to get level points again.."
			//	src.verbs += typesof(/mob/ezing/verb)

//mob/ezing
//	verb
	//	Im_Not_Ezing()
		//	set category = "ANTI-EZ"
		//	src<<"Leveling is now turned back on.."
		//	src.canlevel=1
		//	src.ezprocon=0

mob
	var/tmp/kalled=0
	var/tmp/looop=0
	proc
		cool_skill()
			set background=1
			var/mob/M=src
			M.kalled=1
			//M.doing=1//stop spam
			if(looop<=world.time&&M)//check if hes still online
				M.kalled=0//can use this skill again
				M.doing=0//can use this skill again
			else
				spawn(10) cool_skill()//reiterate




mob
	proc/Skills(Skill/S)//dmg is the level of jutsu being sen
		src.chakraforceadd(src.learningcurve)
		bypass=0
		if(S.level)
			src.damagemultiplier=S.level

		if(debug) world<<"Skill:[S.sindex]: proc:[S.procedure] level:[S.level]"

		switch(S.procedure)//this should optimise things abit, instead of players using all procs to find their skill
			if("Nara")
				if(src.Clan=="Nara")src.Skillnara(S.sindex)//if nara

			if("Deidara")
				if(src.Clan=="Deidara")src.Skilldeidara(S.sindex)//if deidara

			if("Gaara")
				if(src.Clan=="Gaara")src.Skillgaara(S.sindex)//if gaara

			if("Uchiha")
				if(src.Clan=="Uchiha")src.Skilluchiha(S.sindex)//if uchiha

			if("Akimichi")
				if(src.Clan=="Akimichi")src.Skillakimichi(S.sindex)//if akimichi

			if("Hyuuga")
				if(src.Clan=="Hyuuga")src.Skillhyuuga(S.sindex)//if uchiha

			if("Haku")
				if(src.Clan=="Haku")src.Skillhaku(S.sindex)//if uchiha

			if("Puppet")
				if(src.Clan=="Puppet")src.Skillpuppet(S.sindex)//if puppet

			if("Kaguya")
				if(src.Clan=="Kaguya")src.Skillkaguya(S.sindex)//if kaguya

			if("Jashin")
				if(src.Clan=="Jashin")src.Skilljashin(S.sindex)//if kaguya

			if("Weapon")
				src.Skillweapon(S.sindex)//if weapon

			if("Basic")
				src.Skillbasic(S.sindex)//if basic skill

			if("Katon")
				src.Skillkaton(S.sindex)//if katon

			if("Raton")
				src.Skillraton(S.sindex)//if raton

			if("Suiton")
				src.Skillsuiton(S.sindex)//if suiton

			if("Fuuton")
				src.Skillfuuton(S.sindex)//if fuuton

			if("Doton")
				src.Skilldoton(S.sindex)//if fuuton

			if("Rasengan")
				src.Skillrasengan(S.sindex)//if rasengan

			if("Genjutsu")
				src.Skillgenjutsu(S.sindex)//if genjutsu

			if("Gates")
				src.Skillgates(S.sindex)//if gates

			if("Kagebunshin")
				src.Skillkagebunshin(S.sindex)//if kagebunshins

			if("Medic")
				src.Skillmedic(S.sindex)//if medic
/*
			if("Summon")
				src.Skillsummon(S.sindex)//if summoning. this needs work
*/
			else
				return

		//src.doing=1










