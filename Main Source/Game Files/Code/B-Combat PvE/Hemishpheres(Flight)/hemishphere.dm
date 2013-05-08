mob/var/hemis=1//lower hemis
obj/var/hemis=1//lower hemis
turf/var/hemis=1//lower hemis

obj
	Bump(atom/A)
		if(!A:hemis==src.hemis)
			return
		else
			..()
mob
	Bump(atom/A)
		if(!A:hemis==src.hemis)
			return
		else
			..()


mob
	proc
		hemisphere(num)

			switch(num)
				if(1)
					src.hemis=1

				if(2)
					src.hemis=0
