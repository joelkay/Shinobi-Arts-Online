////////////////VARS////////////////
var/gravity=10
turf/var/nonjump=0//canjump into it
//////////////////////////////////////

mob/verb/testjump()
	Jump(src,null,5,gravity)


proc/Jump(mob/user,mob/target,height,velocity)
	if(!user)return

	if(target)
	//lion combo stuffz

	else

	//normal jump
		user.canmove=0//disable client controll
		user.jump(height,velocity)




mob/proc
	option_at_top()
		//some animations?
		src.icon_state=""
		src.canmove=1

	jump(height,velocity)
		set background=1
		var/i=0
		var/h=height
		//src.icon_state=""

		var/obj/jumpshadow/J=new/obj/jumpshadow
		J.loc=locate(src.y,src.x,src.z)

		while(h>0)
			var/t=step(src,NORTH)
			if(t)
				i++
				step(src,NORTH)
				J.icon_state="[i]"

			h--
			world<<"h=[h],i=[i]"
			sleep(velocity)


		if(h<=0)
			del(J)
			src.option_at_top()




obj
	jumpshadow
		icon='jshadow.dmi'
		icon_state="0"


