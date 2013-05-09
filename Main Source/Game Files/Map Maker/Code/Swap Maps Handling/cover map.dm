var/swapmaps=1
area
	var/number
	blackolay
		layer=FLOAT_LAYER
		name="SAO"

		New()
			..()
			var/num=swapmaps++
			name="SwapMap:[num]"
			number=num

proc/AreaUpdate()
	for(var/area/blackolay/A in world)
		if(A.contents.len<=0)
			swapmaps--
			del(A)


proc/covermap(map)
	var/swapmap/M=map
	M.BuildFilledArea(locate(M.x1,M.y1,M.z1),locate(M.x2,M.y2,M.z1),/area/blackolay)

	for(var/mob/X in world)
		if(!X.client)continue
		X.toggle()//hide it



mob
	var/list/blackolays=list()
	proc
		toggle()
			for(var/area/blackolay/Q in world)
				var/image/coverimage = image('blackoverlay.dmi',Q,"")	// remove coverimage of the icon
				src << coverimage
				blackolays.Add(coverimage)//for deleting
				src.uncovermap()//uncover map they are in


		uncover(num)
			for(var/area/blackolay/Q in world)
				if(Q.name=="SwapMap:[num]")
					for(var/I in blackolays)
						if(I in Q) del(I)
					//world << "[Q] should be visible" bug testing purposes







mob
	proc
		checkarea()
			var/area/A = src.loc
			while(A && !istype(A))
				A = A.loc
			if(A)
				//src<<"youre in [A]" for bug testing purposes
				return A.number

		uncovermap()
			var/d=checkarea()
			src.uncover(d)


mob/Owner
	verb
		show_areas_t()
			set category="SwapMaps"
			for(var/area/A in world)
				world<<"[A],has [A.contents.len] contents"

		checkarea_t()
			set category="SwapMaps"
			var/area/A = src.loc
			while(A && !istype(A))
				A = A.loc
			if(A)
				src<<"youre in [A]" //for bug testing purposes
				return A.number

		uncovermap_t()
			set category="SwapMaps"
			var/d=checkarea()//uncover test
			src.uncover(d)






swapmap
	proc/BuildFilledArea(turf/T1,turf/T2,item)
		if(!Contains(T1) || !Contains(T2)) return
		var/turf/T=T1
		var/area/A= new item
		// pick new corners in a block()-friendly form
		T1=locate(min(T1.x,T2.x),min(T1.y,T2.y),min(T1.z,T2.z))
		T2=locate(max(T.x,T2.x),max(T.y,T2.y),max(T.z,T2.z))
		for(T in block(T1,T2))
			A.contents+=T


