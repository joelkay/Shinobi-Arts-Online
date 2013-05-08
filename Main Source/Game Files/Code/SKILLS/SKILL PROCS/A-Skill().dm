mob
	var/tmp/hsealvalue=2//slep 0.2 seconds
	var/tmp/canlevel=0



	proc/hseals(skill,level)// all jutsu bypass this proc muahhahaha
		if(src.koed)
			return
		if(skill=="Shadow_possesion_Cancel"||"Shadow_NeckBind"||"Shadow_Needles")
			src.Skills(skill)
			return
		if(src.doing||src.health<0||src.trapped||src.shadow||src.inmeat)//cant do jutsus while busy.
			return
		if(src.trapped||!src.canmove)
			return
		src.defending=0

		if(!src.pk)
			src<<"Non pk zone"
			return

		spawn()src.seals()//stop spam bro

		src.Skills(skill,level)//for damages that get stronger with level.







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
	proc/Skills(i,dmg)//dmg is the level of jutsu being sen
		src.chakraforceadd(src.learningcurve)
		if(dmg)
			src.damagemultiplier=dmg

		if(src.Clan=="Nara")src.Skillnara(i)//if nara
		if(src.Clan=="Deidara")src.Skilldeidara(i)//if deidara
		if(src.Clan=="Gaara")src.Skillgaara(i)//if gaara
		if(src.Clan=="Uchiha")src.Skilluchiha(i)//if uchiha
		if(src.Clan=="Hyuuga")src.Skillhyuuga(i)//if uchiha
		if(src.Clan=="Haku")src.Skillhaku(i)//if uchiha
		src.Skillkaton(i)//if katon
		src.Skillsuiton(i)//if suiton
		src.Skill(i)//if other

		//src.doing=1










mob
	proc/Skill(i)
		switch(i)///BASE JUTSUS///////
			if("Body_Replacement_Technique")//lol advanced shizle
				src << output("[src]: Body_Replacement_Technique no-Jutsu!", "combatlog")
				src.hsealvalue=1//slep 0.1 seconds
				src.kawax=0//map change makes these 0
				src.kaway=0
				src<<output("You have set your Body_Replacement_Technique location. when you are attacked, you will return to this location this jutsu lasts 150 seconds..", "combatlog")
				src.kawax=src.x
				src.kaway=src.y
				src.kawaz=src.z
				src.kawad=1
				if(src.client)
					src.client.screen+=new/obj/Body_Replacement_Technique
				sleep(600)//60 secs?
				src.kawax=0
				src.kaway=0
				src.kawad=0
				if(src.client)
					for(var/obj/Body_Replacement_Technique/A in src.client.screen)
						del(A)
				return


			if("Body_Flicker")//lol advanced shizle
				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				if(src.inshunsh)return
				var/mob/M=src.targeted

				if(M)
					src.Facedir(M)//help to direct them :p

				src.inshunsh=1
				src.overlays+='Shunshin.dmi'
				src.shuncharge()
				src<<output("You begin to dash at high speed", "combatlog")


			if("Transformation_Technique")//lol advanced shizle

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				var/t=src.icon
				o = src.overlays.Copy()
				var/mob/M=src.targeted
				if(!M)
					src<<output("You need to target someone first..", "combatlog")
					return
				src << output("[src]: Transformation_Technique no-Jutsu!", "combatlog")
				src.savedi=t
			//	src.copyname=src.name
			//	src.name=M.name
				flick('smoke.dmi',src)
				src.icon=M.icon
				src.overlays = src.overlays.Remove(src.overlays)
				src.overlays = M.overlays
				src.Transformation_Techniqued=1
				src<<output("Press L to revert to yourself", "combatlog")


			if("Shadow_Clone")//lol advanced shizle

				src << output("[src]: Shadow_Clone no-Jutsu!", "combatlog")
				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				src.KillShadow_Clone()
				var/mob/NPC/Shadow_Clone/A = new /mob/NPC/Shadow_Clone
				A.icon=src.icon
				A.overlays = src.overlays
				A.dir = src.dir
				A.owner = src
				A.name = src.name
				A.Village = src.Village
				A.name=src.name
				A.loc = locate(src.x, src.y-1, src.z)
				flick('smoke2.dmi',A)

				for(var/mob/M in view(src))
					if(M.targeted == src)
						var/image/I = image('selected.dmi',A,"",999) // create a new target on the source. layer 999
						M<<I // make it so they can see the target
				//A.Load_Overlays()// loads it all
				//A.Affirm_Icon()// loads it all





////////////////////////RATON//////////
			if("Chidori_Blade")

				rem="Chidori_Blade"//shari_copy
				nem=500//cost of Fireblast
				dem=200
				sharicopy(src)
				////////////////////////////////////////////
				src.hsealvalue=40//slep 4 seconds
				src.seals()
				src << output("[src]: Raton-Sword Assasination Technique", "combatlog")
				src.icon_state=""
				src.overlays+='flickraton.dmi'
				spawn(4)
					src.overlays-='flickraton.dmi'
					src.overlays+='ratonswordoverlay.dmi'
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)//face M
				new/obj/RatonS(src.loc,src.dir,src)
				src.canmove=0

				spawn(12)
					src.canmove=1
					src.overlays-='ratonswordoverlay.dmi'

			if("Chidori")//lol advanced shizle

				rem="Chidori"//shari_copy
				nem=500//cost of chidori
				dem=200
				////////////////////////////////////////////
				src.hsealvalue=5//slep 4 seconds
				src.seals()
				if(src.rasenganon||src.drillon)
					src << output("[src]: You can't stack skills!", "combatlog")
					return
				src << output("[src]: Chidori", "combatlog")
				src << output("<i>You begin to charge chidori!", "combatlog")
				src.overlays+='chidori.dmi'
				src.icon_state="chidoricreate"
				src.canmove=0
				src.chargingchidori=1
				var/charged=50
				if(src.Clan=="Uchiha")
					charged=25//takes less time
				CHARGING
				if(charged>=100)
					src.overlays-='chidori.dmi'
					src.canmove=1
					src.overlays+='chidorihold.dmi'
					src.chargingchidori=0
					src.finishedchargingchidori=1//I would of inserted chidori icon change here but i can do that later
					src.chidorion=1
					src.movespeed=0
					src.doing=0
					src << output("<font oolor=blue>You are now done charging chidori. Press Q to charge in a direction....", "combatlog")
					return
				else
					charged+=src.chargerate
					src << output("<font oolor=blue>Charging [charged]% completed!", "combatlog")
					sleep(10)
					goto CHARGING



			if("Raikiri")//lol advanced shizle

				rem="Raikiri"//shari_copy
				nem=500//cost of raikiri
				dem=300
				sharicopy(src)
				////////////////////////////////////////////
				src.hsealvalue=50//slep 4 seconds
				if(src.Clan=="Uchiha")
					src.hsealvalue=src.chidorivalue//slep 4 seconds
				src.seals()
				src.overlays -= 'raikiri.dmi'
				var/mob/M=src.targeted
				if(M in view())//make sure nigga is in range
					src.Facedir(M)
				src << output("[src]: raikiri", "combatlog")
				src.overlays+='raikiri.dmi'
				src << output("[src] hit [M] quickly before it runs out..", "combatlog")//change l8r
				src.chidorion=1
				src.reflexplus+=20//stronger than chidori.
				sleep(60)
				src.reflexplus-=20
				src.chidorion=0
				src.overlays -= 'raikiri.dmi'
				src.icon_state=""
				src.overlays-='raikiri.dmi'


			if("Chidori_Nagashi")//lol advanced shizle
				rem="Chidori_Nagashi"//shari_copy
				nem=300//cost of nagashi
				dem=80
				sharicopy(src)
				////////////////////////////////////////////
				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				src << output("[src]: Chidori_Nagashi", "combatlog")
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)//face M
				if(src.inwater)
					src.canmove=0
					src.icon_state="jutsu exicute"
					Execution(/obj/triggerable/Nagashi,3,800,src)
					spawn(30)
						src.icon_state=""
						src.canmove=1
				else
					src.canmove=0
					src.icon_state="jutsu exicute"
					Execution(/obj/triggerable/Nagashi,1,500,src)
					spawn(30)
						src.icon_state=""
						src.canmove=1

//////////////////////////GENJUTSU//////////////////

			if("Sleepgen")//lol advanced shizle
				rem="Sleepgen"//shari_copy
				nem=600//cost of nagashi
				dem=70//cooldown
				sharicopy(src)
				////////////////////////////////////////////
				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				src << output("[src]: Sleep Genjutsu", "combatlog")
				var/mob/M=src.targeted
				var/intone=(src.dexteritymain+200)/10

				if(M)
					src.Facedir(M)//face M
					var/inttwo=(M.dexteritymain+100)/10
					if(intone>inttwo)
						var/time=(intone-inttwo)*4
						var/thing=5
						if(time>50)
							time=50
							thing-=1
						if(time<30)
							thing-=2
						if(time<10)
							thing-=3
						Execution3(/obj/triggerable/sleep,thing,M,time, src)

				else
					var/time=(intone)*4
					var/thing=5
					if(time>50)
						time=50
						thing-=1
					if(time<30)
						thing-=2
					if(time<10)
						thing-=3
					Execution3(/obj/triggerable/sleep,thing,src,time, src)


/////////////////////////////DOTON/////////////////
			if("Chamber_of_Nothingness")
				rem="Chamber_of_Nothingness"//shari_copy
				nem=500//cost of Chamber_of_Nothingness
				dem=50
				sharicopy(src)
				////////////////////////////////////////////
				src.hsealvalue=20//slep 2 seconds
				src.seals()
				var/mob/A=src.targeted
				if(!A in view(src))
					return
				if(A==src||A=="")
					return
				src << output("[src]: Chamber_of_Nothingness", "combatlog")
				src.Facedir(A)
				var/obj/DotonT/open/D= new/obj/DotonT/open(locate(A.x,A.y,A.z))
				D.owner=src
				sleep(10)//a sec to kawa.

				if(A.loc==D.loc)
					A.canmove=0
					del(D)
					var/obj/DotonT/trapped/E= new/obj/DotonT/trapped(locate(A.x,A.y,A.z))
					E.owner=src
					A.canmove=0
					A.indot=1
					A.doing=1
					src.canleech=1

				else
					del(D)
					A.canmove=1
					A.indot=0


			if("Chamber_Leech")
				rem="Chamber_Leech"//shari_copy
				nem=500//cost of Chamber_of_Nothingness
				dem=60
				sharicopy(src)
				////////////////////////////////////////////
				src.hsealvalue=30//slep 30 seconds
				var/mob/A=src.targeted
				if(A==src||A=="")
					return
				if(A&&!A.indot||!src.canleech)
					src<<output("You have to target a person in a doton cage to leech", "combatlog")
					return
				src.seals()
				src.newleech=1
				src << output("[src]: Chamber_Leech", "combatlog")
				src.dir=EAST
				src.loc=locate(A.x-2,A.y,A.z)
				src.icon_state="heal"
				src.canmove=0
				var/obj/DotonT/leech/E= new/obj/DotonT/leech(locate(A.x,A.y,A.z))
				E.owner=src
				src.leech(A)


			if("Doton_River")
				rem="Doton_River"//shari_copy
				nem=250//cost of Chamber_of_Nothingness
				dem=30
				sharicopy(src)
				////////////////////////////////////////////
				src.hsealvalue=30//slep 3 seconds
				src.seals()
				src << output("[src]: Doton_River", "combatlog")
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)//face M
				new/obj/DotonR(src.loc,src.dir,src)


			if("Doton_MudBullets")
				rem="Doton_MudBullets"//shari_copy
				nem=350//cost of Chamber_of_Nothingness
				dem=80
				sharicopy(src)
				////////////////////////////////////////////
				src.hsealvalue=30//slep 3 seconds
				src.seals()
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)//face M
				src << output("[src]: Doton_MudBullets", "combatlog")
				var/obj/DotonBH/A = new /obj/DotonBH
				A.loc=src.loc
				A.dir=src.dir
				spawn(20)
				new/obj/DotonB(A.loc,A.dir,src)
				spawn(20)
				new/obj/DotonB(A.loc,A.dir,src)
				spawn(20)
				new/obj/DotonB(A.loc,A.dir,src)
				spawn(20)
				new/obj/DotonB(A.loc,A.dir,src)
				spawn(20)
				new/obj/DotonB(A.loc,A.dir,src)
				spawn(20)
				new/obj/DotonB(A.loc,A.dir,src)
				spawn(20)
				new/obj/DotonB(A.loc,A.dir,src)
				spawn(20)
				new/obj/DotonB(A.loc,A.dir,src)
				spawn(20)
				new/obj/DotonB(A.loc,A.dir,src)
				spawn(20)
				new/obj/DotonB(A.loc,A.dir,src)






//////////////////FUUTON//////////////////////
			if("Fuuton_Sweep")

				rem="Fuuton_Sweep"//shari_copy
				nem=250//cost of Chamber_of_Nothingness
				dem=20
				sharicopy(src)
				////////////////////////////////////////////
				src.hsealvalue=20//slep 2 seconds
				src.seals()
				src << output("[src]: Fuuton_Sweep", "combatlog")
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)//face M
				new/obj/FuutonS(src.loc,src.dir,src)

			if("Fuuton_Blast")

				rem="Fuuton_Blast"//shari_copy
				nem=350//cost of Chamber_of_Nothingness
				dem=80
				sharicopy(src)
				////////////////////////////////////////////
				src.hsealvalue=20//slep 2 seconds
				src.seals()
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)//face M
				src << output("[src]: Fuuton_Blast", "combatlog")
				if(src.dir == NORTH)
					var/obj/FuutonB/A = new /obj/FuutonB(locate(src.x, src.y, src.z))
					var/obj/FuutonB/B = new /obj/FuutonB(locate(src.x+1, src.y, src.z))
					var/obj/FuutonB/C = new /obj/FuutonB(locate(src.x-1, src.y, src.z))
					var/obj/FuutonB/D = new /obj/FuutonB(locate(src.x-2, src.y, src.z))
					var/obj/FuutonB/E = new /obj/FuutonB(locate(src.x+2, src.y, src.z))
					A.owner=src
					B.owner=src
					C.owner=src
					D.owner=src
					E.owner=src
					A.dir = NORTH
					B.dir = NORTH
					C.dir = NORTH
					D.dir = NORTH
					E.dir = NORTH
					walk(A,src.dir,2)
					walk(B,src.dir,2)
					walk(C,src.dir,2)
					walk(D,src.dir,2)
					walk(E,src.dir,2)
					sleep(60)
					del(A)
					del(B)
					del(C)
					del(D)
					del(E)
					return
				if(src.dir == SOUTH)
					var/obj/FuutonB/A = new /obj/FuutonB(locate(src.x, src.y, src.z))
					var/obj/FuutonB/B = new /obj/FuutonB(locate(src.x+1, src.y, src.z))
					var/obj/FuutonB/C = new /obj/FuutonB(locate(src.x-1, src.y, src.z))
					var/obj/FuutonB/D = new /obj/FuutonB(locate(src.x-2, src.y, src.z))
					var/obj/FuutonB/E = new /obj/FuutonB(locate(src.x+2, src.y, src.z))
					A.owner=src
					B.owner=src
					C.owner=src
					D.owner=src
					E.owner=src
					A.dir = SOUTH
					B.dir = SOUTH
					C.dir = SOUTH
					D.dir = SOUTH
					E.dir = SOUTH
					walk(A,src.dir,2)
					walk(B,src.dir,2)
					walk(C,src.dir,2)
					walk(D,src.dir,2)
					walk(E,src.dir,2)
					sleep(60)
					del(A)
					del(B)
					del(C)
					del(D)
					del(E)
					return
				if(src.dir == WEST)
					var/obj/FuutonB/A = new /obj/FuutonB(locate(src.x, src.y, src.z))
					var/obj/FuutonB/B = new /obj/FuutonB(locate(src.x, src.y-1, src.z))
					var/obj/FuutonB/C = new /obj/FuutonB(locate(src.x, src.y-2, src.z))
					var/obj/FuutonB/D = new /obj/FuutonB(locate(src.x, src.y+1, src.z))
					var/obj/FuutonB/E = new /obj/FuutonB(locate(src.x, src.y+2, src.z))
					A.owner=src
					B.owner=src
					C.owner=src
					D.owner=src
					E.owner=src
					A.dir = WEST
					B.dir = WEST
					C.dir = WEST
					D.dir = WEST
					E.dir = WEST
					walk(A,src.dir,2)
					walk(B,src.dir,2)
					walk(C,src.dir,2)
					walk(D,src.dir,2)
					walk(E,src.dir,2)
					sleep(60)
					del(A)
					del(B)
					del(C)
					del(D)
					del(E)
					return
				if(src.dir == EAST)
					var/obj/FuutonB/A = new /obj/FuutonB(locate(src.x, src.y, src.z))
					var/obj/FuutonB/B = new /obj/FuutonB(locate(src.x, src.y-1, src.z))
					var/obj/FuutonB/C = new /obj/FuutonB(locate(src.x, src.y-2, src.z))
					var/obj/FuutonB/D = new /obj/FuutonB(locate(src.x, src.y+1, src.z))
					var/obj/FuutonB/E = new /obj/FuutonB(locate(src.x, src.y+2, src.z))
					A.owner=src
					B.owner=src
					C.owner=src
					D.owner=src
					E.owner=src
					A.dir = EAST
					B.dir = EAST
					C.dir = EAST
					D.dir = EAST
					E.dir = EAST
					walk(A,src.dir,2)
					walk(B,src.dir,2)
					walk(C,src.dir,2)
					walk(D,src.dir,2)
					walk(E,src.dir,2)
					sleep(60)
					del(A)
					del(B)
					del(C)
					del(D)
					del(E)
					return
				return

			if("Fuuton_Tornado")

				rem="Fuuton_Tornado"//shari_copy
				nem=250//cost of Chamber_of_Nothingness
				dem=30
				sharicopy(src)
				////////////////////////////////////////////
				src.hsealvalue=30//slep 3 seconds
				src.seals()
				src << output("[src]: Fuuton_Tornado", "combatlog")
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)//face M
				new/obj/FuutonT(src.loc,src.dir,src)


			if("Fuuton_Slice")

				rem="Fuuton_Slice"//shari_copy
				nem=250//cost of Chamber_of_Nothingness
				dem=30
				sharicopy(src)
				////////////////////////////////////////////
				src.hsealvalue=30//slep 3 seconds
				src.seals()
				src << output("[src]: Fuuton_Slice", "combatlog")
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)//face M
				new/obj/FuutonSl(src.loc,src.dir,src)



/////////////////Puppet///////////////////////////////

			if("puppet1")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				src.delpups()
				var/mob/puppet1/P = new/mob/puppet1
				flick('smoke2.dmi',P)
				P.loc = locate(src.x, src.y, src.z)
				P.owner = src
				P.health = src.health/2
				P.strength = src.strengthmain
				P.dexterity = src.dexteritymain
				src << output("<font color = blue>Press I to controll puppet 1. pressing I again will return ccontrol to yourself. Also pressing L will delete puppets.</FONT>", "combatlog")

			if("puppet2")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				src.delpups2()
				var/mob/puppet2/P = new/mob/puppet2
				flick('smoke2.dmi',P)
				P.loc = locate(src.x, src.y, src.z)
				P.owner = src
				P.health = src.health/2
				P.strength = src.strengthmain
				P.dexterity = src.dexteritymain
				src << output("<font color = blue>Press O to controll puppet 2. pressing O again will return ccontrol to yourself. Also pressing L will delete puppets.</FONT>", "combatlog")


			if("puppet3")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				src.delpups3()
				var/mob/puppet3/P = new/mob/puppet3
				flick('smoke2.dmi',P)
				P.loc = locate(src.x, src.y, src.z)
				P.owner = src
				P.health = src.health/2
				P.strength = src.strengthmain
				P.dexterity = src.dexteritymain
				src << output("<font color = blue>Press P to controll puppet 3. pressing P again will return ccontrol to yourself. Also pressing L will delete puppets.</FONT>", "combatlog")




			if("Puppet_Knives")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				if(src.puppet1)
					for(var/mob/puppet1/P in world)
						if(P.owner==src)
							var/Weapon/Kunai/L = new/Weapon/Kunai
							L.loc = P.loc
							L.dir = P.dir
							L.owner=src
							sleep(3)
							if(src.targeted)
								var/D=src.targeted
								walk_towards(L,D,2)
							else
								walk(L,P.dir,2)
							sleep(50)
							del(L)
							return
				if(src.puppet2)
					for(var/mob/puppet2/P in world)
						if(P.owner==src)
							var/Weapon/Kunai/L = new/Weapon/Kunai
							L.loc = P.loc
							L.dir = P.dir
							L.owner=src
							sleep(3)
							if(src.targeted)
								var/D=src.targeted
								walk_towards(L,D,2)
							else
								walk(L,P.dir,2)
							sleep(50)
							del(L)
							return
				if(src.puppet3)
					for(var/mob/puppet3/P in world)
						if(P.owner==src)
							var/Weapon/Kunai/L = new/Weapon/Kunai
							L.loc = P.loc
							L.dir = P.dir
							L.owner=src
							sleep(3)
							if(src.targeted)
								var/D=src.targeted
								walk_towards(L,D,2)
							else
								walk(L,P.dir,2)
							sleep(50)
							del(L)
							return


				else
					src << output("You must be in controll of a puppet to use this jutsu..", "combatlog")
					return

			if("Puppet_Transformation_Technique")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				if(src.puppet1)
					for(var/mob/puppet1/P in view(src))
						if(P.owner==src)
							if(src.targeted)
								var/t=P.icon
								o = P.overlays.Copy()
								var/mob/M=src.targeted
								src << output("[src]: Puppet_Transformation_Technique no-Jutsu!", "combatlog")
								P.savedi=t
								flick('smoke.dmi',P)
								P.icon=M.icon
								P.overlays = M.overlays
							else
								src<<output("Puppet will Transformation_Technique into you..", "combatlog")
								P.icon=src.icon
								P.overlays = src.overlays
								return
				if(src.puppet2)
					for(var/mob/puppet2/P in view(src))
						if(P.owner==src)
							if(src.targeted)
								var/t=P.icon
								o = P.overlays.Copy()
								var/mob/M=src.targeted
								src << output("[src]: Puppet_Transformation_Technique no-Jutsu!", "combatlog")
								P.savedi=t
								flick('smoke.dmi',P)
								P.icon=M.icon
								P.overlays = M.overlays
							else
								src<<output("Puppet will Transformation_Technique into you..", "combatlog")
								P.icon=src.icon
								P.overlays = src.overlays
								return

				if(src.puppet3)
					for(var/mob/puppet3/P in view(src))
						if(P.owner==src)
							if(src.targeted)
								var/t=P.icon
								o = P.overlays.Copy()
								var/mob/M=src.targeted
								src << output("[src]: Puppet_Transformation_Technique no-Jutsu!", "combatlog")
								P.savedi=t
								flick('smoke.dmi',P)
								P.icon=M.icon
								P.overlays = M.overlays
							else
								src<<output("Puppet will Transformation_Technique into you..", "combatlog")
								P.icon=src.icon
								P.overlays = src.overlays
								return

				else
					src << output("You must be in controll of a puppet to use this jutsu..", "combatlog")
					return


			if("Puppet_Shield")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				if(src.puppet2)
					for(var/mob/puppet2/P in view(src))
						if(P.owner==src)
							P.icon_state="shield"
							P.protected=1
							if(src in range(2,P))
								src.protected=1
								spawn(60)// 6 seconds
									P.protected=0
									P.icon_state=""
									src.protected=0
				else
					src<<output("You must be in controll of puppet 2..", "combatlog")

			if("Puppet_Crush")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				if(src.puppet3)
					for(var/mob/puppet3/P in view(src))
						if(P.owner==src)
							P.crushing=1
							src<<output("You have 4 seconds to trap an opponent..", "combatlog")
							sleep(40)// 6 seconds
							P.crushing=0
				else
					src<<output("You must be in controll of puppet 3..", "combatlog")




			if("Poison_Bomb")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				if(src.puppet1)
					for(var/mob/puppet1/P in view(src))
						if(P.owner==src)
							if(src.targeted)
								var/mob/M=src.targeted
								var/obj/PoisonB/L = new/obj/PoisonB
								L.loc = P.loc
								L.dir = P.dir
								L.owner=src
								walk_towards(L,M,2)

				if(src.puppet2)
					for(var/mob/puppet2/P in view(src))
						if(P.owner==src)
							if(src.targeted)
								var/mob/M=src.targeted
								var/obj/PoisonB/L = new/obj/PoisonB
								L.loc = P.loc
								L.dir = P.dir
								L.owner=src
								walk_towards(L,M,2)

				if(src.puppet3)
					for(var/mob/puppet3/P in view(src))
						if(P.owner==src)
							if(src.targeted)
								var/mob/M=src.targeted
								var/obj/PoisonB/L = new/obj/PoisonB
								L.loc = P.loc
								L.dir = P.dir
								L.owner=src
								walk_towards(L,M,2)
				else
					src << output("You must be in controll of a puppet to use this jutsu..", "combatlog")
					return









//////////////////LEE///////////////////////////////////////////////////////////////

			if("Gate1")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				if(!src.cangate)
					return
				view() << output("[src] activates the first gate", "combatlog")
				src.cangate2=1//
				src.overlays+='gate1.dmi'
				src.reflexplus+=10
				src.strengthplus+=10
				src.health+=2000//2k + health
				src.gateson=1
				sleep(500)
				src.gateson=0
				src.diffgate=0
				if(src.diffgate)
					return
				if(src.lee)
					src.Dec_life(0,src,"Gate1")
				else
					src.Dec_life(5,src,"Gate1")
				src.Death(src)
				src << output("[src] is fatigued by the gate", "combatlog")
				src.icon_state=""
				src.overlays-='gate1.dmi'
				src.reflexplus-=10
				if(src.reflexplus<0)
					src.reflexplus=0
				src.strengthplus-=10
				if(src.strengthplus<0)
					src.strengthplus=0

				sleep(400)
				src.cangate=1

			if("Gate2")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				if(!src.cangate2)
					return
				view() << output("[src] activates the second gate", "combatlog")
				src.cangate3=1
				src.overlays+='gate2.dmi'
				sleep(30)
				src.diffgate=1
				src.reflexplus+=20
				src.strengthplus+=20
				src.health+=2500//2.5k + health
				src.diffgate2=0
				src.gateson=1
				sleep(500)
				src.gateson=0
				if(src.diffgate2)
					return
				if(src.lee)
					src.Dec_life(5,src,"Gate2")
				else
					src.Dec_life(10,src,"Gate2")
				src.Death(src)
				src << output("[src] is fatigued by the gate", "combatlog")
				src.icon_state=""
				src.overlays-='gate1.dmi'
				src.reflexplus-=30//1 & 2
				if(src.reflexplus<0)
					src.reflexplus=0
				src.strengthplus-=30
				if(src.strengthplus<0)
					src.strengthplus=0
				sleep(400)
				src.cangate2=1

			if("Gate3")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				if(!src.cangate3)
					return
				view() << output("[src] activates the third gate", "combatlog")
				src.cangate4=1
				src.overlays+='gate3.dmi'
				sleep(30)
				src.overlays-='gate3.dmi'
				src.diffgate2=1
				src.reflexplus+=30
				src.strengthplus+=30
				src.health+=3000//3k + health
				src.diffgate3=0
				src.gateson=1
				sleep(500)
				src.gateson=0
				if(src.diffgate3)
					return
				if(src.lee)
					src.Dec_life(10,src,"Gate3")
				else
					src.Dec_life(20,src,"Gate3")
				src.Death(src)
				src << output("[src] is fatigued by the gate", "combatlog")
				src.icon_state=""
				src.overlays-='gate1.dmi'
				src.reflexplus-=60
				if(src.reflexplus<0)
					src.reflexplus=0
				src.strengthplus-=60
				if(src.strengthplus<0)
					src.strengthplus=0

				sleep(400)
				src.cangate3=1

			if("Gate4")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				if(!src.cangate4)
					return
				view() << output("[src] activates the fourth gate", "combatlog")
				src.cangate5=1
				src.overlays+='gate4.dmi'
				src.icon='gatez.dmi'
				src.overlays-='gate4.dmi'
				src.diffgate3=1
				src.reflexplus+=40
				src.strengthplus+=40
				src.health+=3000//3k + health
				src.diffgate4=0
				src.teleattack=1
				src.gateson=1
				sleep(500)
				src.teleattack=0
				src.gateson=0
				if(src.diffgate4)
					return
				if(src.lee)
					src.Dec_life(15,src,"Gate4")
				else
					src.Dec_life(30,src,"Gate4")
				src.Death(src)
				src << output("[src] is fatigued by the gate", "combatlog")
				src.icon_state=""
				src.Affirm_Icon()
				src.overlays-='gate1.dmi'
				src.reflexplus-=100
				if(src.reflexplus<0)
					src.reflexplus=0
				src.strengthplus-=100
				if(src.strengthplus<0)
					src.strengthplus=0

				sleep(400)
				src.cangate4=1

			if("Gate5")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				if(!src.cangate5)
					return
				view() << output("[src] activates the last gate", "combatlog")
				src.overlays+='gate5.dmi'
				sleep(15)
				src.overlays-='gate5.dmi'
				src.diffgate4=1
				src.reflexplus+=50
				src.strengthplus+=50
				src.teleattack=1
				src.gateson=1
				src.health+=5000//5k + health
				sleep(500)
				src.teleattack=0
				if(src.lee)
					src.Dec_life(20,src,"Gate5")
				else
					src.Dec_life(40,src,"Gate5")
				src.Death(src)
				src << output("[src] is fatigued by the gate", "combatlog")
				src.icon_state=""
				src.Affirm_Icon()
				src.overlays-='gate5.dmi'
				src.overlays-='gate2.dmi'
				src.reflexplus-=150
				if(src.reflexplus<0)
					src.reflexplus=0
				src.strengthplus-=150
				if(src.strengthplus<0)
					src.strengthplus=0
				sleep(400)
				src.cangate5=1

			if("GateCancel")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				view() << output("[src] cancels out the gates", "combatlog")
				src.icon_state=""
				src.overlays-='gate1.dmi'
				src.overlays-='gate2.dmi'
				src.overlays-='gate3.dmi'
				src.overlays-='gate4.dmi'
				src.overlays-='gate5.dmi'
				src.icon_state=""
				src.Affirm_Icon()
				src.cangate=1
				src.cangate2=0
				src.cangate3=0
				src.cangate4=0
				src.cangate5=0
				src.overlays-='gate1.dmi'
				src.gateson=0



			if("Lotus")

				rem="Lotus"//shari_copy
				nem=200//cost of Chamber_of_Nothingness
				sharicopy(src)
				//////////////////////////////////////////////////////////
				src.seals()
				src << output("[src] loosens his bandages and prepares for a high flying taijutsu move", "combatlog")
				src.overlays+='goalioncombo.dmi'
				sleep(20)//2 secs to get
				src.overlays-='goalioncombo.dmi'
				src.icon_state=""
				for(var/mob/M in get_step(src,src.dir))
					if(M)
						src.Facedir(M)
						var/damage = round(src.strengthmain*rand(2,4))
						M.combloc=locate(M.x,M.y,M.z)//save this spot
						src.canmove=0
						src.doing=1
						M.doing=1
						M.canmove=0
						src.dir=SOUTH
						M.dir=SOUTH
						M.loc = locate(src.x,src.y-1,src.z)//below src
						//M.incombo=1
						src.loc=M.loc
						M.loc = locate(src.x,src.y+1,src.z)//tiles to go up
						src.loc=M.loc
						src.icon_state="lioncombatker"
						M.icon_state="lioncombdefender"
						M.loc = locate(src.x,src.y+1,src.z)//tiles to go up
						src.loc=locate(M.x,M.y-1,M.z)//tiles to go up
						spawn(19)
							M.loc = locate(src.x,src.y+2,src.z)//tiles to go up
							src.loc=M.loc
						spawn(42)
							M.loc=M.combloc//take them back
							src.loc = locate(M.x,M.y+1,M.z)
						spawn(46)//wait for animation
							M.icon_state=""
							src.icon_state=""//refresh states
							src.canmove=1
							M.canmove=1
							src.doing=0
							M.doing=0
							sleep(10)
							M.Dec_health(damage,src,"Lotus")




/////////////////////UZUMAKI/////////////////

			if("KageShadow_Clone")//lol advanced shizle
				rem="KageShadow_Clone"//shari_copy
				nem=200//cost of Chamber_of_Nothingness
				dem=80
				sharicopy(src)
				////////////////////////////////////////////
				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				src << output("[src]: Kage Shadow_Clone no-Jutsu! press L to revert back to yourself", "combatlog")
				src.KillShadow_Clone()
				var/mob/NPC/KShadow_Clone/A = new /mob/NPC/KShadow_Clone
				flick('smoke2.dmi',A)
				A.loc = locate(src.x,src.y-1,src.z)
				A.dir = src.dir
				A.owner = src
				A.icon = src.icon
				A.overlays=src.overlays
				A.health = 300

				src.controlled = A
				src.kagebunshd = 1
				src.client.eye = A

			if("TajuuKageShadow_Clone")//lol advanced shizle

				rem="TajuuKageShadow_Clone"//shari_copy
				nem=100//cost of Chamber_of_Nothingness
				dem=200
				sharicopy(src)
				////////////////////////////////////////////
				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				src.KillShadow_Clone()
				src << output("[src]: Tajuu Kage Shadow_Clone no-Jutsu! press L to deactivate kage Shadow_Clones. Press F to make them attack your target..", "combatlog")
				if(src.chakra<=2000)//five
					src.tajnum=5
					src.chakra=0
					src.tajuu()//create 5 clonez
					src.bunsh=1

				if(src.chakra>=2001)//ten
					src.tajnum=10
					src.chakra=0
					src.tajuu()//create 10 clonez
					src.bunsh=1





			if("Rasengan")
				rem="Rasengan"//shari_copy
				nem=300//cost of Chamber_of_Nothingness
				dem=100
				sharicopy(src)
				////////////////////////////////////////////
				src.hsealvalue=5//slep 4 seconds
				//src.seals()
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

				rem="Oodama_Rasengan"//shari_copy
				nem=600//cost of Chamber_of_Nothingness
				dem=300
				sharicopy(src)
				////////////////////////////////////////////
				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
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

//////////////////////////MEDIC//////////////////////

			if("Medic")

				rem="Medic"//shari_copy
				nem=150//cost of Fireblast
				sharicopy(src)
				src.hsealvalue=1//
				src.seals()
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)//face M
				if(M in get_step(src,src.dir))
					if(M.life>=100)
						return
					var/healage=((src.chakraforcemain/20)*(src.medpassive/2))+rand(0,10)//med passive quikens healing
					M.life+=healage
					flick('healing.dmi',src)
					flick("healing",M)
					sleep(10)
					src << output("healed [M] for [healage] life", "combatlog")




			if("Mystic_Palm")

				rem="Mystic_Palm"//shari_copy
				nem=150//cost of Fireblast
				sharicopy(src)
				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				src << output("[src]: You are now using mystical palms, attacking people causes damage to life", "combatlog")
				src.icon="palms"
				src.Load_Overlays()
				src.Affirm_Icon()
				src.mysticpalms=1
				return

			if("Cancel_MysticPalm")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				src << output("[src]: You cancel the mystic palms", "combatlog")
				src.icon_state=""
				src.Load_Overlays()
				src.Affirm_Icon()
				src.mysticpalms=0
				return

			if("Chakra_Enforced_Punch")

				rem="Chakra_Enforced_Punch"//shari_copy
				nem=150//cost of Fireblast
				sharicopy(src)
				////////////////////////////////////////////
				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				src << output("[src]: You are now using chakra enforced punch quickly attack someone before your chakra runs out..", "combatlog")
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)//face M
				src.cep=1
				src.cepdrain()// add later
				src.overlays+='cepcharge.dmi'
				sleep(20)
				src.overlays-='cepcharge.dmi'
				return

			if("Rebirth")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				src.overlays+='rebirth.dmi'
				src << output("[src]: You gained full life and a slight health boost..", "combatlog")
				src.canregen=1
				spawn() src.regeneration()
				src.life+=100
				src.overlays-='rebirth.dmi'
				if(src.life>100)
					src.life=100
				src.health+=(src.max_health*1.5)
				return



///////////AKIMICHI////////////////////////////////////

			if("Spinach_pill")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
			//	src.overlays+='akipilla.dmi'
				src << output("[src]: You gained a strength and health boost be carefull it lasts 50 seconds..", "combatlog")
				src.strengthplus+=30
			//	src.health+=(src.max_health*2)
				sleep(1000)
				src<<output("You lost life as the side effects of the pill..", "combatlog")
			//	src.overlays-='akipilla.dmi'
				src.Dec_life(30,src,"Spinach_pill")
				src.strengthplus-=30
				if(src.strengthplus<0)
					src.strengthplus=0
				return

			if("Curry_pill")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
			//	src.overlays+='akipillb.dmi'
				src << output("[src]: You gained a high strength and health boost be carefull it lasts 50 seconds..", "combatlog")
				src.strengthplus+=60
			//	src.health+=(src.max_health*3.5)
				sleep(1000)
				src<<output("You lost life as the side effects of the pill..", "combatlog")
			//	src.overlays-='akipillb.dmi'
				src.Dec_life(60,src,"Curry_pill")
				src.strengthplus-=60
				if(src.strengthplus<0)
					src.strengthplus=0
				return

			if("Chilli_pill")
				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				//src.overlays+=new/obj/butterflywings
				//spawn(50)
				//	src.overlays-=new/obj/butterflywings
				src << output("[src]: You gained a significant strength and health boost be carefull it lasts 50 seconds..", "combatlog")
				src.strengthplus+=250
			//	src.health+=(src.max_health*8)
				sleep(1000)
				src<<output("You lost life as the side effects of the pill..", "combatlog")
				src.overlays-='akipillc.dmi'
				src.Dec_life(250,src,"Chilli_pill")
				src.strengthplus-=250
				src.health=250
				if(src.strengthplus<0)
					src.strengthplus=0
				return

			if("Sizeup")
				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				src << output("[src]: Sizeup..", "combatlog")
				src<<output("Skill not yet fixed..", "combatlog")

				var/icon/d= new(src:icon, src:icon_state)
				d.Scale(128,128)
				src.icon=d
				for(var/O in src.overlays)
					var/icon/A = new(O:icon, O:icon_state)
					A.Scale(128,128)
					overlays.Add(A)


			if("Meattank")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				src << output("[src]: Meattank..", "combatlog")
				var/obj/meattank/A=new/obj/meattank
				src.inmeat=1
				src.icon=A
				src.overlays=null
				sleep(70)
				src.icon=""
				src.inmeat=0
				src.Load_Overlays()
				src.Affirm_Icon()

////////////////////////Jashin//////////////////////////////////////

			if("Bloodbind")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				src << output("[src]: Bloodbind..", "combatlog")
				for(var/mob/M in get_step(src,src.dir))
					if(M)
						Blood(M.x,M.y,M.z)
						M<<output("[src] took your blood..", "combatlog")
						src<<output("took [M]'s blood..", "combatlog")
						src.binded=M
						return
					else
						src<<output("Couldnt get blood..", "combatlog")


			if("Bloodbind_Cancel")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				src << output("[src]: You Cancel bloodbind..", "combatlog")
				src.binded=""
				return



			if("Jashin_circle")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				src << output("[src]: Jashin circle: When you enter this circle, any damage you do to yourself is done the enemy in bloodbind", "combatlog")
				if(src.binded)
					src << output("[src]: Jashin circle: you curently have [src.binded] in bloodbind", "combatlog")
					for(var/obj/triggerable/bloodcircle/T in world)
						if(T.owner==src)
							del(T)
					var/obj/triggerable/bloodcircle/T = new/obj/triggerable/bloodcircle(locate(src.x,src.y,src.z))
					T.owner=src
					src.incircle=0
					src.icon='jashin.dmi'
					sleep(600)
					del(T)
					src.Affirm_Icon()
					src.incircle=0
					src.binded=""
					src<<output("The contract ends..", "combatlog")
				else
					src<<output("You have no one in bloodbind..", "combatlog")


			if("Self_Harm")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				if(src.incircle&&src.binded)
					var/mob/D=src.binded
					src << output("[src]:Self-Harm ", "combatlog")
					flick("self harm",src)
					Blood(src.x,src.y,src.z)
					Blood(D.x,D.y,D.z)
					D.Dec_health(50,src,"Self_Harm")
					src.Dec_life(10,src,"Self_Harm")
					D.Dec_life(10,src,"Self_Harm")
					D<<output("you took 10 life from [src]'s blood bind..", "combatlog")
					src<<output("gave 10 life damage to [D] with blood bind..", "combatlog")
					return
				else
					src<<output("You have no one in bloodbind or are not in your circle..", "combatlog")


			if("Self_Heal")
				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				if(!src.binded)
					if(src.life>=100)
						src<<output("Your at full life..", "combatlog")
						return
					src << output("[src]:Self-Heal ", "combatlog")
					flick("heal",src)
					src.life+=5
					src.canregen=1
					spawn() src.regeneration()
					return
				src<<output("Cant heal yourself while you have someone in bind..", "combatlog")


			if("Immortal")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				if(src.canimmortal)
					if(src.inmortal)
						return
					src << output("[src]:Immortal ", "combatlog")
					src.canimmortal=0
					src.inmortal=1
					src.life+=250
					sleep(2500)
					src.Dec_life(250,src,"Immortal")
					src.Affirm_Icon()
					src.canimmortal=1
					src.inmortal=0
					src<<output("Your immortality wears off..", "combatlog")
				else
					src<<output("Can only go immortal every 2500 seconds..", "combatlog")


////////////////////KAGUYA///////////////////////////////

			if("Bone_Drill")

				src.hsealvalue=20//slep 0.1 seconds
				src.seals()
				src << output("[src]: Bone_Drill!", "combatlog")
				src << output("[src] quickly attack an opponent with A !", "combatlog")
				src.overlays+='drill.dmi'
				src.drillon=1
				sleep(70)
				src.drillon=0
				src.overlays-='drill.dmi'

			if("Bone_Bullets")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				src << output("[src]: Bone_Bullets..", "combatlog")
				var/obj/Bbullet/D=new/obj/Bbullet
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)
				D.loc = src.loc
				D.dir = src.dir
				D.owner = src
				walk(D,src.dir)
				sleep(50)
				del(D)

			if("Bone_Sword")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				src << output("[src]: pulls out a sword from his body..", "combatlog")
				src<<output("<font color=blue>The Bone Sword is in your Skills Inventory.</font>..", "combatlog")
				src.contents += new/Weapon/KSword
				sleep(360)//hwever long tht is.
				for(var/Weapon/KSword/D in src.contents)
					del(D)
				sleep(1)//refresh macros.
				src << output("[src]: The Bone Sword fades..", "combatlog")
				//src.client.screen+=new/obj/macros/wepmacro1
				//src.client.screen+=new/obj/macros/wepmacro2
			//	src.wepmacro1=0
			//	src.wepmacro1supps=0
			//	src.wepmacro1cool=0
			//	src.wepmacro1sindex=""
			//	src.wepmacro2=0
			//	src.wepmacro2supps=0
			//	src.wepmacro2cool=0
			//	src.wepmacro2sindex=""
				src.overlays-='KSword.dmi'
				src.sworded=0
				src.swordtype="none"
				src<<output("<font color=blue>UN-Equiped sword</font>..", "combatlog")
				return

			if("Bone_Armour")

				src.hsealvalue=5//slep 0.1 seconds
				src.seals()
				src << output("Bones erupt from [src]'s body..", "combatlog")
				src.overlays+='activate.dmi'
				src.canceled=0//can cancel.
				for(var/mob/M in get_step(src,src.dir))
					if(M)
						Blood(M.x,M.y,M.z)
						M.Dec_health(800,src,"Bone_Armour")
				sleep(20)
				src.overlays-='activate.dmi'
				src.overlays+='active.dmi'
				src.protected=1
				src.canregen=0
				sleep(360)//2 minz
				if(!src.canceled)
					src << output("[src]'s Bone Armour fades..", "combatlog")
					src.overlays-='activate.dmi'
					src.overlays-='active.dmi'
					src.overlays+='cancel.dmi'
					src.protected=0
					src.canregen=1
					spawn() src.regeneration()
					sleep(20)
					src.overlays-='cancel.dmi'
					src.canceled=1
					return


			if("Bone_ArmourCancel")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				if(!src.canceled)
					src << output("[src] Cancels Bone Armour body..", "combatlog")
					src.overlays-='activate.dmi'
					src.overlays-='active.dmi'
					src.overlays+='cancel.dmi'
					src.protected=0
					src.canregen=1
					spawn() src.regeneration()
					sleep(20)
					src.overlays-='cancel.dmi'
					src.canceled=1
					return

			if("Sawarabi")

				src.hsealvalue=40//slep 0.1 seconds
				src.seals()
				src << output("[src]: Sawarabi..", "combatlog")
				Execution(/obj/Sawa,5,700,src)






/////////////////////////WEPS///////////////////////////
			if("Sword")//lol advanced shizle

				src.hsealvalue=1//slep 0.1 seconds
				if(!src.sworded)
					src.overlays+='sword.dmi'
					src.sworded=1
					src.swordtype="normal"
					src<<output("<font color=blue>Equiped sword, press S to attack with it</font>..", "combatlog")
					return
				else
					src.overlays-='sword.dmi'
					src.sworded=0
					src.swordtype="none"
					src<<output("<font color=blue>UN-Equiped sword</font>..", "combatlog")
					return

			if("Kunai")

				src.hsealvalue=1//slep 0.1 seconds
				src << output("[src]: throws a Kunai..", "combatlog")
				var/Weapon/Kunai/D = new/Weapon/Kunai
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)
				flick("throw",src)
				D.loc = src.loc
				D.dir = src.dir
				D.owner = src
				walk(D,src.dir)
				sleep(50)
				del(D)

			if("Shuriken")

				src.hsealvalue=1//slep 0.1 seconds
				src << output("[src]: throws a ahuriken..", "combatlog")
				var/Weapon/Shuriken/D = new/Weapon/Shuriken
				var/Weapon/Shuriken/E = new/Weapon/Shuriken
				var/Weapon/Shuriken/F = new/Weapon/Shuriken
				var/mob/M=src.targeted
				if(M)
					src.Facedir(M)
				if(src.dir==NORTH||SOUTH)
					D.loc = locate(src.x,src.y,src.z)//Tops
					E.loc = locate(src.x+1,src.y,src.z)//Tops
					F.loc = locate(src.x-1,src.y,src.z)//Tops
				else//east and west.
					D.loc = locate(src.x,src.y,src.z)//Tops
					E.loc = locate(src.x,src.y+1,src.z)//Tops
					F.loc = locate(src.x,src.y-1,src.z)//Tops
				flick("throw",src)
				D.dir = src.dir
				E.owner = src
				E.dir = src.dir
				F.owner = src
				F.dir = src.dir
				walk(D,src.dir)
				walk(E,src.dir)
				walk(F,src.dir)
				sleep(50)
				del(D)

			if("KSword")//lol advanced shizle

				src.hsealvalue=1//slep 0.1 seconds
				if(!src.sworded)
					src.overlays+='KSword.dmi'
					src.sworded=1
					src.swordtype="KSword"
					src<<output("<font color=blue>Equiped sword, press S to attack with it</font>..", "combatlog")
					return
				else
					src.overlays-='KSword.dmi'
					src.sworded=0
					src.swordtype="none"
					src<<output("<font color=blue>UN-Equiped sword</font>..", "combatlog")
					return







/*

///////////////SUMMONS//////////////////////////////

			if("Frog_Summon")
				src.hsealvalue=40//slep 0.1 seconds
				src.seals()
				usr.Summoneffect()
				src << output ("<font size=1><font face=verdana><b><font color=white>[usr.name]<font color=green> Says: Kuchiyose No Jutsu!", "combatlog")
				usr.frog()

			if("Bee_Summon")
				src.hsealvalue=40//slep 0.1 seconds
				src.seals()
				usr.Summoneffect()
				src << output ("<font size=1><font face=verdana><b><font color=white>[usr.name]<font color=green> Says: Kuchiyose No Jutsu!", "combatlog")
				usr.bee()

			if("Snake_Summon")
				src.hsealvalue=40//slep 0.1 seconds
				src.seals()
				usr.Summoneffect()
				src << output ("<font size=1><font face=verdana><b><font color=white>[usr.name]<font color=green> Says: Kuchiyose No Jutsu!", "combatlog")
				usr.snake()

			if("Slug_Summon")
				src.hsealvalue=40//slep 0.1 seconds
				src.seals()
				usr.Summoneffect()
				src << output ("<font size=1><font face=verdana><b><font color=white>[usr.name]<font color=green> Says: Kuchiyose No Jutsu!", "combatlog")
				usr.slug()

*/