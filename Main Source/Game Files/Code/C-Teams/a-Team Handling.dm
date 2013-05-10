var/list/Teams = list()
world
	New()
		Teams=new/list()
		Load_Teams()
		..()

proc
	Load_Teams()
		var/savefile/s=new("Savefiles/Teams/list.sav")
		s["Teams"] >> Teams



	Save_Teams()
		var/savefile/s=new("Savefiles/Teams/list.sav")
		s["Teams"] << Teams
