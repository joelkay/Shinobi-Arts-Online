mob/var/baselected=0
obj
	basepale
		icon='basepale.dmi'
		name=""
		Click()
			usr.icon_name="basepale"
			usr.Affirm_Icon()


	basewhite
		icon='basewhite.dmi'
		name=""
		Click()
			usr.icon_name="basewhite"
			usr.Affirm_Icon()


	baseblack
		name=""
		icon='baseblack.dmi'
		Click()
			usr.icon_name="baseblack"
			usr.Affirm_Icon()

obj
	hairtypes

		hair1
			icon='h1preview.dmi'//for char select
			Click()
				usr.hair_type=1
				usr.Load_Overlays()


		hair2
			icon='h2preview.dmi'
			Click()
				usr.hair_type=2
				usr.Load_Overlays()

		hair3
			icon='h3preview.dmi'
			Click()
				usr.hair_type=3
				usr.Load_Overlays()



		hair4
			icon='h4preview.dmi'
			Click()
				usr.hair_type=4
				usr.Load_Overlays()

/*
		hair5
			icon='hair5.dmi'
			Click()
				usr.hair_type=5
				usr.Load_Overlays()
				usr.Load_Overlays()



		hair6
			icon='hair6.dmi'
			Click()
				usr.hair_type=6
				usr.Load_Overlays()
				usr.Load_Overlays()
				usr.hairselected=1
		hair7
			icon='hair7.dmi'
			Click()
				usr.hair_type=7
				usr.Load_Overlays()
				usr.Load_Overlays()
				usr.hairselected=1
		hair8
			icon='hair8.dmi'
			Click()
				usr.hair_type=8
				usr.Load_Overlays()
				usr.Load_Overlays()
				usr.hairselected=1

		hair9
			icon='hair9.dmi'
			Click()
				usr.hair_type=9
				usr.Load_Overlays()
				usr.Load_Overlays()
				usr.hairselected=1


		hair10
			icon='hair10.dmi'
			Click()
				usr.hair_type=10
				usr.Load_Overlays()
				usr.Load_Overlays()


		hair11
			icon='hair11.dmi'
			Click()
				usr.hair_type=11
				usr.Load_Overlays()
				usr.Load_Overlays()


*/







	haircolor
		var
			r=0
			g=0
			b=0
		icon='haircolors.dmi'
		haircolor1
			icon_state="0,1"
			r=0
			g=0
			b=0
		haircolor2
			icon_state="1,1"
			r=194
			g=194
			b=194
		haircolor3
			icon_state="2,1"
			r=236
			g=236
			b=236
		haircolor4
			icon_state="3,1"
			r=61
			g=39
			b=0
		haircolor5
			icon_state="4,1"
			r=90
			g=57
			b=0
		haircolor6
			icon_state="5,1"
			r=121
			g=78
			b=3
		haircolor7
			icon_state="6,1"
			r=171
			g=129
			b=1
		haircolor8
			icon_state="7,1"
			r=212
			g=161
			b=6
		haircolor9
			icon_state="8,1"
			r=221
			g=188
			b=8
		haircolor10
			icon_state="9,1"
			r=239
			g=208
			b=0
		haircolor11
			icon_state="0,0"
			r=144
			g=71
			b=12
		haircolor12
			icon_state="1,0"
			r=201
			g=92
			b=4
		haircolor13
			icon_state="2,0"
			r=201
			g=64
			b=4
		haircolor14
			icon_state="3,0"
			r=148
			g=49
			b=6
		haircolor15
			icon_state="4,0"
			r=81
			g=25
			b=1
		haircolor16
			icon_state="5,0"
			r=248
			g=141
			b=3
		haircolor17
			icon_state="6,0"
			r=247
			g=228
			b=122
		haircolor18
			icon_state="7,0"
			r=4
			g=99
			b=153
		haircolor19
			icon_state="8,0"
			r=180
			g=78
			b=238
		haircolor20
			icon_state="9,0"
			r=4
			g=204
			b=140
		haircolor21
			icon_state="10,0"
			r=253
			g=135
			b=179
		Click()
			..()
			var/mod=0.5//intensity
			usr.hair_red=round(src.r*mod)
			usr.hair_blue=round(src.b*mod)
			usr.hair_green=round(src.g*mod)
			usr.Load_Overlays()

		haircolor_rgb
			icon='charcreate.dmi'
			icon_state="rgb"
			Click()
				usr.hair_red=input(usr,"how much red do you want in your hair?") as num
				usr.hair_green=input(usr,"how much green do you want in your hair?") as num
				usr.hair_blue=input(usr,"how much blue do you want in your hair?") as num
				usr.Load_Overlays()






mob/proc
	Affirm_Icon()
		if(src.icon_name=="basewhite")
			src.icon='basewhite.dmi'

		if(src.icon_name=="baseblack")
			src.icon='baseblack.dmi'

		if(src.icon_name=="basepale")
			src.icon='basepale.dmi'




mob/proc
	Load_Overlays()
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
/*

			if(5)
				h1i='hair5.dmi'
				pixel_yoff=0

			if(6)
				h1i='hair6.dmi'
				pixel_yoff=4
			if(7)
				h1i='hair7.dmi'
				pixel_yoff=4
			if(8)
				h1i='hair8.dmi'
				pixel_yoff=4
			if(9)
				h1i='hair9.dmi'
				pixel_yoff=4

			if(10)
				h1i='hair10.dmi'
				pixel_yoff=0
			if(11)
				h1i='hair11.dmi'
				pixel_yoff=0

*/

		if(src)//removed .client for login
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


mob/proc/Get_Hair_RGB()
	src.hair_red=input("How much Red do you want in your hair (1-150)") as num
	src.hair_green=input("How much Green do you want in your hair (1-150)") as num
	src.hair_blue=input("How much Blue do you want in your hair (1-150)") as num
	if(src.hair_red>150)
		src.hair_red=150
	if(src.hair_blue>150)
		src.hair_blue=150
	if(src.hair_green>150)
		src.hair_green=150


mob
	proc
		GoCust()
			src.client.eye=locate("GoCust")
			src.Load_Overlays()

