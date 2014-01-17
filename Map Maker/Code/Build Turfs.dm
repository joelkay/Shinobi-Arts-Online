var/current="template1"
var/mname="template1"

/turf/icon='turfy2.dmi'

world
	New()
		swapmaps_mode=SWAPMAPS_TEXT
		..()
		var/z=SwapMaps_Load("Maps/[current]")
		if(z) return
		else
			Template()



proc
	Template()
		var/swapmap/d = new("Maps/template1",40,40,1)	//If there isn't a map we create a new one that is 60x60 tiles

		d.BuildFilledRectangle(locate(d.x1+26,d.y1+1,d.z1),\
		                         locate(d.x1+38,d.y1+15,d.z1),\
		                         /turf/Grass)	//We build a filled rectangle from 26,1 to 38,15

		d.BuildRectangle(locate(d.x1+25,d.y1,d.z1),\
		                   locate(d.x1+39,d.y1+14,d.z1),\
		                   /turf/Wall)	  //We build a rectangle from 25,0 to 39,14

		new/turf/Ladder(locate(d.x1+32,d.y1+7,d.z1))

		d.Save()
		world<<"Templates created."


client
	perspective=EDGE_PERSPECTIVE

turf
	Grass
		icon='cutscene.dmi'
		icon_state = "grass"

	Tile
		icon='cutscene.dmi'
		icon_state = "tile"

	Wall
		icon='cutscene.dmi'
		icon_state = "wall"
		density = 1

	Ladder
		icon='cutscene.dmi'
		icon_state = "ladder"
		layer=9999

	mapborder
		icon='turfy.dmi'
		density=1
		layer=9999







mob
	verb
		Say(T as text)
			set hidden =1
			world << "[usr]: [T]"





