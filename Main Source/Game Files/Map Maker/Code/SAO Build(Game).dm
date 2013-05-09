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
