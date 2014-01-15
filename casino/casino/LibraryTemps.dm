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

proc/Apopup(var/a,var/b)

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
