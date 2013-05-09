world
	hub="JeanSqribe.ShinobiArtsOnlineBuild"

buildable
	DEFAULT
		denseobj
			name = "dense"
			icon ='denseobj.dmi'
			icon_state ="default"//visible state
			build=/buildable/DEFAULT/denseobj
			density=1



buildable
	parent_type = /obj
	var/build
	var/clicked
	var/built=0

	Click()
		if(src.built)
			if(usr.build==src.build)return
			for(var/turf/T in src.loc)
				T.buildon()//new build
		else
			src.select()



	proc/select()
		var/icon/I = new(src.icon,src.icon_state)
		for(var/obj/preview/H in usr.previews)
			H.icon=I
			H.name=src.name
		usr.build=src.build


	proc/delz(num)
		if(num)//cut
			src.select()
		del(src)








mob
	var/mode="none"
	verb/switchmodes()
		set hidden=1
		if(src.mode=="build")
			src.mode="target"
		else
			src.mode="build"






mob/Build
	verb/layerincrease(var/O as obj in world)
		set name ="set layer"
		set category=null
		var/num=input(usr,"layer","Enter a number from 1-5") as num
		var/buildable/x=O
		src<<"[x.layer] -> [num]"
		x.layer=num
		var/buildable/found = x.type
		switch(alert(usr,"use this for all objs of the type:[x.type].","Set-All","Yes","No"))
			if("Yes")
				for(var/buildable/z in world)
					if(z.type==found&&z.built)
						z.layer=num


	verb/delete(var/O as obj|turf in world)
		set name ="delete"
		set category=null
		if(isturf(O))//pesky sitch
			del(O)
			return

		var/buildable/x=O
		x.delz()//delete protocol

	verb/deleteall(var/O as obj in world)
		set name ="delete_all"
		set category=null
		var/buildable/x=O
		var/buildable/found = x.type
		switch(alert(usr,"delete all [found] in the world?.","Set-All","Yes","No"))
			if("Yes")
				for(var/buildable/z in world)
					if(z.type==found&&z.built)
						z.delz()

	verb/copy(var/O as obj in world)
		set name ="copy"
		set category=null
		var/buildable/x=O
		x.select()//delete protocol

	verb/cut(var/O as obj in world)
		set name ="cut"
		set category=null
		var/buildable/x=O
		x.delz(1)

	verb/densitytoggle(var/O as obj in world)
		set name ="density-toggle"
		set category=null
		var/buildable/x=O
		if(x.density)
			x.density=0
			src<<"[x.density]"
			var/buildable/found = x.type
			switch(alert(usr,"use this for all objs of the type:[x.type].","Set-All","Yes","No"))
				if("Yes")
					for(var/buildable/z in world)
						if(z.type==found&&z.built)
							z.density=0
		else
			x.density=1
			src<<"[x.density]"
			var/buildable/found = x.type
			switch(alert(usr,"use this for all objs of the type:[x.type].","Set-All","Yes","No"))
				if("Yes")
					for(var/buildable/z in world)
						if(z.type==found&&z.built)
							z.density=1

	verb/info(var/O as obj in world)
		set name ="information"
		set category=null
		var/buildable/X=O
		src<<"[X.x],[X.y],[X.z],->[X.build]"


mob/var/gridon=0
mob
	verb
		togglemobd()
			set hidden=1
			if(src.density)
				winset(src,null,{"
				childtop.density.text = "Off";
				"})
				src.density=0

			else
				winset(src,null,{"
				childtop.density.text = "On";
				"})
				src.density=1

		mapgrid()
			set hidden=1
			if(!gridon)
				gridon=1
				winset(src,null,{"
				childtop.mapgrid.text = "On";
				"})
				var/swapmap/M=src.map
				M.BuildFilledRectangle(locate(M.x1+1,M.y1+1,M.z1),locate(M.x2-1,M.y2-1,M.z1),/area/mapgrid)

			else
				gridon=0
				winset(src,null,{"
				childtop.mapgrid.text = "Off";
				"})
				for(var/area/mapgrid/T in world)
					del(T)




area/mapgrid
	layer=999999
	icon='mapgrid.dmi'


mob/telemarker
	layer=999999
	icon='marker.dmi'


mob
	verb
		createmarker()
			set hidden=1
			var/namez
			namez=input(src,"name","Enter a name for this marker")
			var/mob/telemarker/X=new/mob/telemarker
			X.name="marker: [namez]"
			X.loc=src.loc

		teleport(var/mob/M in world)
			set hidden=1
			src.loc=M.loc
