mob/player/New()
	if(!istype(src,/mob/NPC))
		spawn()src.regeneration()

	..()


mob/AI
	Move()
		if(!src.canmove)
			return//dont move
		if(src.hyuugablob||src.inmove)
			return

		if(src.defending)
			src.defending=0

		src.canregen=1//regen should take over right?
		if(!src.dizzy&&!src.canceled)//kags with armor cant run
			src.icon_state="Run"
			src.runon=1
			src.movespeed=0//speed up
			return ..()

		else
			src.icon_state=""
			src.movespeed=1//speed down
			src.runon=0
			return ..()
