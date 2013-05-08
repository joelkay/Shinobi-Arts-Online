mob
	proc/Facedir(mob/x)
		if(src.stunned||src.ko||!x)
			return
		var/north=0
		var/east=0
		var/sevx = abs(x.x-src.x)
		var/sevy = abs(x.y-src.y)

		if(x.x > src.x)
			east=1
		else
			east=2
		if(x.y>src.y)
			north=1
		else
			north=2
		if(east==1 && north==1)
			if(sevx>sevy)
				src.dir=EAST
			else
				src.dir=NORTH
		if(east==0 && north==1)
			src.dir=NORTH
		if(east==2 && north==1)
			if(sevx>sevy)
				src.dir=WEST
			else
				src.dir=NORTH
		if(east==1 && north==0)
			src.dir=EAST
		if(east==2 && north==0)
			src.dir=WEST
		if(east==0 && north ==2)
			src.dir=SOUTH
		if(east==1 && north==2)
			if(sevx>sevy)
				src.dir=EAST
			else
				src.dir=SOUTH
		if(east==2 && north==2)
			if(sevx>sevy)
				src.dir=WEST
			else
				src.dir=SOUTH


