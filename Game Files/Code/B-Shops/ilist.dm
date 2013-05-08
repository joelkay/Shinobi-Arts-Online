var/list/ilist=list()
var/list/ilistA=list()
var/list/ilistB=list()





proc
	initiateilist()
		ilist=new
//////////RATON/////////////
		ilist += newlist(/obj/items/Headband)
		ilist += newlist(/obj/items/legarmor/Casual,/obj/items/armors/Black)//obj/items/legarmor/Orange,/obj/items/armors/Blue)
		//ilist+=newlist(/obj/items/armors/Red,/obj/items/armors/White,/obj/items/armors/Brown,/obj/items/Suits/Black)
		//ilist+=newlist(/obj/items/fourthsuit,/obj/items/Armorfang)

		return ilist