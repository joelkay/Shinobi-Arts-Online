
//SOME TEMP VAS+PROC
var/players
var/debug
var/bm
var/wm
var/WARMAP
var/wr


mob
	var/spectating
	var/mapgrid
	var/targeted



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
