mob/var/tmp/list/undos=list()//undoing backwards

mob/var/tmp/undonum=0//number for the assoc lists


mob
	proc
		undoAdd(buildable/o)//when an object is created, this is called
			src.undonum++//1st number?
			src.undos["[src.undonum]"]=o




mob
	verb
		controlz() //ctrl-z
			set hidden=1
			if(!src.undonum) return
			var/buildable/X=src.undos["[src.undonum]"]
			if(X)
				X.delz()
				src.undonum--




