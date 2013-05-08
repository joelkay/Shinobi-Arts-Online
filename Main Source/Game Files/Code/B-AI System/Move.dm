mob/player/New()
	if(!istype(src,/mob/NPC))
		spawn()src.regeneration()

	..()


mob/AI
	Move()
		if(src.mdelay>world.time||!src.canmove)
			return//dont move
		src.mdelay = world.time+src.movedelay//set new value
		if(src.hyuugablob||src.inmove)
			return

		if(src.defending)
			src.defending=0

		src.canregen=1//regen should take over right?
		if(!src.dizzy&&!src.canceled)//kags with armor cant run
			src.icon_state="Run"
			src.runon=1
			src.movedelay=1//speed up
			return ..()

		else
			src.icon_state=""
			src.movedelay=3//speed down
			src.runon=0
			return ..()
