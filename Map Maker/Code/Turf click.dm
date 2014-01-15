mob/var/build = /buildable/DEFAULT/wall

client
	mouse_pointer_icon='object.dmi'

turf
	Click()
		buildon()

	proc
		buildon()
			if(!check()) return//duplicates
			var/buildable/o = new usr.build(src);
			src <<"[o]"  //credit to some lib or demo i found..
			o.built=1
			usr.undoAdd(o)//incase wna del



	proc
		check()
			var/buildable/found = locate(usr.build) in src
			if(found) // If an object of the same type is found.
				return 0 // Prevent the movement.
			else
				return 1