

//swapmap.BuildInTurfs(list/turfs,item)

client


	var/tmp

		select[]=list()  // list of selected units
		imageslist[]=list()  // list of selection images
		turf/start  // grid start
		turf/end  //grid end


	Click()
		..()
		//if(usr.mode=="build") return//other modes
		// if there is a selection box, select!
		if(start)

			endGrid()

		..()

	MouseDown(object,location)
		if(usr.mode=="build") return//other modes

		// if nothing is selected, draw the grid
		if(!select.len)

			src.drawGrid(location,location)

		//..()

	MouseUp(object,location)
		if(usr.mode=="build") return//other modes
		// if there is a selection box, select!
		if(start)

			endGrid()

		..()

	MouseDrag(src_object,over_object,src_location,over_location)
		if(usr.mode=="build") return//other modes
		// if there is a grid started, expand it
		if(start)

			drawGrid(start,over_location)

		..()

	proc/drawGrid(s,e)

		if(!isloc(s,e)) //if mouse is not at a valid loc return
			return

		// if there is no start location, set it
		if(!start)

			start = s

		end = e // current mouse location

		// delete old grid
		for(var/image/i in src.imageslist)

			del(i)

		// vars set to the difference between 2 corners of box
		var/xd = end.x-start.x
		var/yd = end.y-start.y

		// 4 corners of grid are given are displayed to the user
		src.imageslist += new/image ('Selecting.dmi',locate(start.x,start.y,start.z),"2")
		src.imageslist += new/image ('Selecting.dmi',end,"2")
		src.imageslist += new/image ('Selecting.dmi',locate(start.x,start.y+yd,start.z),"2")
		src.imageslist += new/image ('Selecting.dmi',locate(start.x+xd,start.y,start.z),"2")

		for(var/image/i in src.imageslist)

			src << i

	proc/endGrid()

		var

			// variables used to determine selection area
			max_X=max(start.x,end.x)
			min_X=min(start.x,end.x)
			max_Y=max(start.y,end.y)
			min_Y=min(start.y,end.y)

		// selection box is deleted
		for(var/image/i in src.imageslist)

			del(i)


		var/swapmap/M=usr.map
		M.BuildFilledRectanglenew(locate(min_X,min_Y,start.z),locate(max_X,max_Y,start.z))//build the object plz


		start = null
		end = null



swapmap

	proc/BuildFilledRectanglenew(turf/T1,turf/T2)
	//	if(!Contains(T1) || !Contains(T2)) return
		var/turf/T=T1
		// pick new corners in a block()-friendly form
		T1=locate(min(T1.x,T2.x),min(T1.y,T2.y),min(T1.z,T2.z))
		T2=locate(max(T.x,T2.x),max(T.y,T2.y),max(T.z,T2.z))
		for(T in block(T1,T2))
			T.buildon()









/*		// turfs in box are checked for units
		for(var/turf/t in block(locate(min_X,min_Y,1),locate(max_X,max_Y,1)))

			// if you want to enable selecting more then one unit per turf, use a for() loop
			var/mob/unit/m = locate() in t

			if(m)

				// a unit was found at this location, select it
				var/image/i = new('Selecting.dmi',m,"1")
				select+=m
				src.imageslist+=i
				src << i



	turf
	MouseDrag(typeb,unused,location)
		if(usr.mode!="build")//other modes
			typeb = usr.build
			new typeb(location)
		else
			return


*/