mob/var/ingame=0
mob
	Login()
		src<<"<font color=blue><b>Welcome to the Casino</font></b>"
		..()
		src.client.eye = src
		src.sight |= (SEE_MOBS|SEE_OBJS|SEE_TURFS)  // turn on several bits at once


	Move()
		if(ingame)
			return
		..()



mob
	verb
		ChangeCardColor()
			set category="Debug"
			if(CardBack=='blue_cardbackfront.dmi')
				CardBack='red_cardbackfront.dmi'
				src<<"Changed to Red deck"
			else
				CardBack='blue_cardbackfront.dmi'
				src<<"Changed to Blue deck"

		ChangeCasinoFloor()
			set category="Debug"
			if(CASINO=="Maps/casino")
				CASINO="Maps/casinograss"
				src<<"Changed to grass"
			else
				CASINO="Maps/casino"
				src<<"Changed to wooden floor"


mob/Debug
	verb
		get_Location()
			var/obj/tempa=new()
			tempa.icon=src.icon
			tempa.loc=src.loc
			src<<"<font color =blue>Obj placed at X=[tempa.x],Y=[tempa.y]+,Z=[tempa.z]"

			src<<"<b><font color =green>swap defaults: X=[src.map.x1],Y=[src.map.x1]+,Z=[src.map.x1]"
			src<<"<b><font color =green>swap loc: </b> src.loc = locate(src.map.x1+[x-1],src.map.y1+[y-1],src.map.z1)"


		Get_Scores()
			set category = "BlackJack_debug"
			var/score=Get_Score(src.Hand,src,1)
			var/score2=Get_Score(src.Dealer,src)

			src<<"You:[score]."
			src<<"Dealer:[score2]."
