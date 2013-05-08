mob
	proc
		rasengan()
			for(var/mob/M in get_step(src,src.dir))
				if(M)
					src.overlays-='rasengan.dmi'
					src.overlays-='rasengan.dmi'
					var/damage=src.chakraforcemain+src.strengthmain*30
					src.overlays-='rasengan.dmi'
					src.overlays-='rasengano.dmi'
					M.overlays+='explosion2.dmi'
					M.PushEnemy(5,src.dir)
					flick("hurt",M)
					M.overlays-='explosion2.dmi'
					M.Dec_health(damage,src,"Rasengan")// use Dec_health boi
					src.rasenganon=0
					src.canmove=1


				else
					src.rasenganon=0
					src.overlays-='rasengan.dmi'
					src.overlays-='rasengano.dmi'
					src << output("the rasengan wears off", "combatlog")
					src.canmove=1

		chidori()

			for(var/mob/M in get_step(src,src.dir))
				if(M)
					src.overlays-='chidori.dmi'
					src.overlays-='raikiri.dmi'
					spawn() Blood(M.x,M.y,M.z)
					src.chidorion=0
					flick("hurt",M)
					var/X=rand(19,30)
					M.Dec_life(X,src,"Chidori")
					src.canmove=1


				else
					src.overlays-='chidori.dmi'
					src.overlays-='raikiri.dmi'
					src.chidorion=0
					src << output("the chidori/raikiri wears off", "combatlog")
					src.canmove=1



		drill()

			for(var/mob/M in get_step(src,src.dir))
				if(M)
					flick("punch1",src)
					flick("",src)
					src.overlays-='drill.dmi'
					spawn()Blood(M.x,M.y,M.z)
					src.drillon=0
					flick("hurt",M)
					var/X=rand(10,20)
					M.Dec_life(X,src,"Bone_Drill")


				else
					src.overlays-='drill.dmi'
					src.drillon=0
					src << output("the Bone Drill wears off", "combatlog")



		teleattack(mob/M)
			if(!src.teleattack)
				return
			if(src.inteleatk)
				return
			else
				if(!M in view(src))
					return
				var/damage=60+(src.strengthmain+(src.strengthmain*2+src.reflexmain*1.5))
				src.inteleatk=1
				src.loc=locate(M.x,M.y-1,M.z)
				src.dir=NORTH
				sleep(10)
				flick('teleattack.dmi',src)
				src.attackolays(M,"punch")

				////////////////////CRIT + DAZE////////////////////
				var/pick2=pick(1,2,3,4,5,6,7,8,9,10)
				if(pick2>=9)
					M.dizzy++
					src.attackolays(M,"dazed")
				if(pick2<=2)
					damage=damage*2
					src.attackolays(M,"critical")
				////////////////////CRIT + DAZE////////////////////

				M.Dec_health(damage,src,"Taijutsu")// use Dec_health boi

				src.loc=locate(M.x-1,M.y,M.z)
				src.dir=EAST
				sleep(10)
				flick('teleattack.dmi',src)
				src.attackolays(M,"punch")

				////////////////////CRIT + DAZE////////////////////
				var/pick1=pick(1,2,3,4,5,6,7,8,9,10)
				if(pick1>=9)
					M.dizzy++
					src.attackolays(M,"dazed")
				if(pick1<=2)
					damage=damage*2
					src.attackolays(M,"critical")
				////////////////////CRIT + DAZE////////////////////

				M.Dec_health(damage,src,"Taijutsu")// use Dec_health boi

				src.loc=locate(M.x,M.y+1,M.z)
				src.dir=SOUTH
				sleep(10)
				flick('teleattack.dmi',src)
				src.attackolays(M,"punch")

				////////////////////CRIT + DAZE////////////////////
				var/pick3=pick(1,2,3,4,5,6,7,8,9,10)
				if(pick3>=9)
					M.dizzy++
					src.attackolays(M,"dazed")
				if(pick3<=2)
					damage=damage*2
					src.attackolays(M,"critical")
				////////////////////CRIT + DAZE////////////////////

				M.Dec_health(damage,src,"Taijutsu")// use Dec_health boi

				src.loc=locate(M.x+1,M.y,M.z)
				src.dir=WEST
				sleep(10)
				flick('teleattack.dmi',src)
				src.attackolays(M,"punch")

				////////////////////CRIT + DAZE////////////////////
				var/pick4=pick(1,2,3,4,5,6,7,8,9,10)
				if(pick4>=9)
					M.dizzy++
					src.attackolays(M,"dazed")
				if(pick4<=2)
					damage=damage*2
					src.attackolays(M,"critical")
				////////////////////CRIT + DAZE////////////////////

				M.Dec_health(damage,src,"Taijutsu")// use Dec_health boi
				sleep(30)
				src.inteleatk=0

				return






mob
	var/tmp/called=0
	var/tmp/innloop=0
	proc
		cool_atk()
			var/mob/M=src
			if(M.called)
				if(M.innloop) return 0
				spawn(M.attackrate)
					M.called=0//proc can be called
					M.doing=0//can attack again
					M.innloop=0
				M.innloop=1
				return 0
			else
				M.called=1//slow it down
				M.doing=0//can attack again
				return 1


mob/proc
	attackolays(mob/M,z)//(src,M)// attacker, attacked guy
		if(!M||!z) return
		if(z=="gentle fist")
			var/E=pick("gentle fist","gentle fist2")
			flick(E,src)
			var/random=pick(1,2)
			var/image/effect=image('palmshitnew.dmi',icon_state="[random]")
			M.overlays+=effect
			flick("hurt",M)
			sleep(5)
			M.overlays-=effect
			return

		if(z=="critical")
			var/image/effect=image('critical.dmi')
			M.overlays+=effect
			flick("hurt",M)
			sleep(5)
			M.overlays-=effect
			return
/*
		if(z=="dazed")
			var/image/effect=image('dazed.dmi')
			M.overlays+=effect
			flick("hurt",M)
			sleep(5)
			M.overlays-=effect
			return
*/
		var/random=pick(1,2,3,4,5,6)
		var/image/effect=image('hiteffect.dmi',icon_state="[random]")
		M.overlays+=effect

		flick("hurt",M)
		sleep(5)
		if(M)M.overlays-=effect



mob
	verb
		attack()
			set hidden=1
			set name = "Attack"
			if(!firstattack)
				firstattack=1
			if(src.doing||!src.canmove||!src.pk)//cant do jutsus
				return
			//src.attackz()	//rasengan
			src.defending=0
			Attack(src,src.targeted) //normal attack




mob
	var/lastpicked="punch1"
	var/summonnpc=0//this is to allow summons to do animations

proc
	Attack(mob/A,mob/B)//A= attacker B= defender
		if(!A.cool_atk())return// click once every attackrate secs pl0x

		flick(A.lastpicked,A)

		if(A.lastpicked=="punch1"&&!A.summonnpc)
			A.lastpicked=pick("punch2","kicknew")
		else if(!A.summonnpc)
			A.lastpicked=pick("punch1","kicknew")

		var/mob/M=B
		if(M)
			if(M in view(1,A.loc))
				A.Facedir(M)
				A.strengthadd(A.learningcurve)

				if(A.koed||M.koed)// if they are koed
					return

				if(A.jyuuken)
					var/damage2=rand(0.9,2)
					var/damage=50+(A.strengthmain+(A.strengthmain*2+A.reflexmain*0.5))
					A.attackolays(M,"gentle fist")

					////////////////////CRIT + DAZE////////////////////
					var/pick=pick(1,2,3,4,5,6,7,8,9,10)
					if(pick>=9)
						M.dizzy++
						A.attackolays(M,"dazed")
					if(pick<=2)
						damage=damage*2
						A.attackolays(M,"critical")
					////////////////////CRIT + DAZE////////////////////

					M.Dec_life(damage2,A,"Jyuuken")
					M.Dec_health(damage,A,"Taijutsu")// use Dec_health boi
					return



				if(A.teleattack&&A.gateson)
					A.teleattack(M)
					return

				else
					var/damage=25+(A.strengthmain+(A.strengthmain*2+A.reflexmain))
					A.attackolays(M,"punch")

					////////////////////CRIT + DAZE////////////////////
					var/pick=pick(1,2,3,4,5,6,7,8,9,10)
					if(pick>=9)
						M.dizzy++
						A.attackolays(M,"dazed")
					if(pick<=2)
						damage=damage*2
						A.attackolays(M,"critical")
					////////////////////CRIT + DAZE////////////////////

					M.Dec_health(damage,A,"Taijutsu")// use Dec_health boi
					return


		else
			for(var/mob/T in get_step(A,A.dir))
				if(T)
					A.Facedir(T)
					if(A.koed||T.koed)// if they are koed
						return

					A.strengthadd(A.learningcurve)
					if(A.jyuuken)
						var/damage2=rand(0.9,2)
						var/damage=50+(A.strengthmain+((A.strengthmain*2)/A.reflexmain*0.5))
						A.attackolays(T,"gentle fist")

						///////////////////CRIT + DAZE////////////////////
						var/pick=pick(1,2,3,4,5,6,7,8,9,10)
						if(pick>=9)
							M.dizzy++
							A.attackolays(M,"dazed")
						if(pick<=2)
							damage=damage*2
							A.attackolays(M,"critical")
						////////////////////CRIT + DAZE////////////////////

						T.Dec_life(damage2,A,"Jyuuken")
						T.Dec_health(damage,A,"Taijutsu")// use Dec_health boi
						return

					if(A.teleattack&&A.gateson)
						A.teleattack(T)
						return
					else
						var/damage=(A.strengthmain+((A.strengthmain*2)/A.reflexmain))

						////////////////////CRIT + DAZE////////////////////
						var/pick=pick(1,2,3,4,5,6,7,8,9,10)
						if(pick>=9)
							T.dizzy++
							A.attackolays(T,"dazed")
						if(pick<=2)
							damage=damage*2
							A.attackolays(T,"critical")
						////////////////////CRIT + DAZE////////////////////

						A.attackolays(T,"punch")
						if(T)T.Dec_health(damage,A,"Taijutsu")// use Dec_health boi


						return




