mob/proc
	Loadprelays()
		if(src.icon_name=="basewhite")
			src.icon='basewhite.dmi'

		if(src.icon_name=="baseblack")
			src.icon='baseblack.dmi'

		if(src.icon_name=="basepale")
			src.icon='basepale.dmi'

		var/L[0]
		var/h1i
		var/pixel_yoff=0
		switch(src.hair_type)
			if(1)
				h1i='hair1.dmi'//real hairs loaded
				pixel_yoff=0

			if(2)
				h1i='hair2.dmi'
				pixel_yoff=0
			if(3)
				h1i='hair3.dmi'
				pixel_yoff=0

			if(4)
				h1i='hair4.dmi'
				pixel_yoff=0



		if(h1i)
			h1i+=rgb(src.hair_red,src.hair_green,src.hair_blue)

			//var/image/h1=image(h1i,layer=FLOAT_LAYER-12,pixel_y=pixel_yoff)
			var/image/h1=image(h1i,pixel_y=pixel_yoff)
			L+= h1

		if(specialinv)L+=specialinv
		if(armorinv)L+=armorinv
		if(legarmorinv)L+=legarmorinv
		if(armarmorinv)L+=armarmorinv
		if(facearmorinv)L+=facearmorinv
		if(cloakinv)L+=cloakinv
		if(weaponinv)L+=weaponinv
		if(shoesinv)L+=shoesinv

		src.overlays=L
