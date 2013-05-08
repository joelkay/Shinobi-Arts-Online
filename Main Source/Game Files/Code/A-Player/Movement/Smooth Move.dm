mob
	Move()
		if(src.hyuugablob||src.inmove)
			return

		spawn()
			if(src.inwater)
				src.WATER()

			if(src.defending)
				src.defending=0

			src.incircle=0
			//src.inwater=0
			//src.canregen=1//regen should take over right

		if(!src.dizzy&&!src.canceled)//kags with armor cant run
			src.icon_state="Run"
			src.runon=1
			src.energy-=1
			src.movespeed=0//speed up
			return ..()
		else
			src.icon_state=""
			src.runon=0
			src.movespeed=1//speed down
			src.agilityadd(src.learningcurve)
			return ..()

atom
	var/owner


mob
	Bump(atom/movable/M)
		if(isobj(M))
			var/obj/O=M
			if(O.owner==src)
				src.loc=O.loc

		if(istype(M,/mob))

			if(src.inscenes)
				var/mob/A=M
				var/mob/F=src
				F.loc=A.loc

			if(src.inchuun)
				var/mob/B=M
				var/mob/G=src
				G.loc=B.loc


			if(src.chidorion)
				view()<<"[src] hit [M] with chidori!"
				src.icon_state="chidorihit"
				src.overlays-='chidorihold.dmi'
				src.chidori()
				if(M) src.loc=M.loc



			if(src.rasenganon)
				view()<<"[src] hit [M] with rasengan!"
				src.icon_state="rasenganatk"
				src.overlays-='rasengan.dmi'
				src.rasengan()
				if(M) src.loc=M.loc


		else
			..()



mob
	proc
		WATER()
			if(watercool)return
			if(!src.inwater)return
			if(src.chakra<0)
				src.health =0
				src.Death(src)
				src.watercool=1//avoid spam death
				watercool(src)
			else
				src.chakra-=5




mob
	var/watercool
	proc
		watercool(mob/M)
			if(!M.watercool)
				return
			M.watercool=1
			spawn(30)
				M.watercool=0
