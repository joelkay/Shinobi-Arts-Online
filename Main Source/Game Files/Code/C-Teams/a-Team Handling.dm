var/list/Teams = list()

world
	New()
		spawn() Load_Teams()
		..()

proc
	Load_Teams()
		var/savefile/s=new("Savefiles/Teams/list.sav")
		s["Teams"] >> Teams
		if(!Teams)
			Teams=new



	Save_Teams()
		var/savefile/s=new("Savefiles/Teams/list.sav")
		s["Teams"] << Teams
