//////////////////////THIS LIBRARY HAS ALL THE SWAP MAP TOOLS + FEATURES TO BE USED IN ALL THE PROJECTS/////////////////////////////////////////////

//some testing verbs

mob
	verb
		TestPopup()

			var/mob/M = new/mob
			M.icon='title - chat.png'
			M.name="Steve"

			Apopup(src,"[M.name]",0,M)











//SOME TEMP VAS+PROC
var/players
var/debug
var/bm
var/wm
var/WARMAP
var/wr


mob
	var/spectating
	var/Savedx
	var/Savedy
	var/Savedz
	var/location
	var/mapgrid
	var/targeted
	var/swapmap/map
	var/swapmap/map2
	var/swapmap/map3

mob/proc/Createmap()


buildable
	parent_type = /obj
	var/build

buildable
	DEFAULT
		denseobj
			name = "dense"
			icon ='denseobj.dmi'
			icon_state ="invis"//invisible state
			build=/buildable/DEFAULT/denseobj
			density=1




turf/mapborder
	icon='turfy.dmi'
	density=1
	invisibility=101//make it invis
	opacity=1




