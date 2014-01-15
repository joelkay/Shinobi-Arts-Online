mob
	Login()
		..()
		src<<"<font color=blue><b>Welcome to the Casino testbed</font></b>"
		src.client.eye = src
		src.sight |= (SEE_MOBS|SEE_OBJS|SEE_TURFS)  // turn on several bits at once
		src.icon='ones.bmp'




mob
	verb
		set_Location()
			var/obj/tempa=new()
			tempa.icon=src.icon
			tempa.loc=src.loc
			src<<"<font color =blue>Obj placed at X=[tempa.x],Y=[tempa.y]+,Z=[tempa.z]"

			src<<"<b><font color =green>swap defaults: X=[src.map.x1],Y=[src.map.x1]+,Z=[src.map.x1]"
			src<<"<b><font color =green>swap loc: </b> src.loc = locate(src.map.x1+[x-1],src.map.y1+[y-1],src.map.z1)"