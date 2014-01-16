mob
	var/tmp
		cutscenebunshin=0
		bunshinattacks=0


mob/cutscene/tempBunshin
	cutscenebunshin=1
	icon='iruka.dmi'



mob
//////////////////////////////////////////////////////////////////////////////
	Dec_health(x,mob/attker,jname) //always pass all damaging effects through here, then defensive abilities can edit the x value
		if(cutscenebunshin)
			attker.bunshinattacks++
			spawn(2) del(src)
		..()