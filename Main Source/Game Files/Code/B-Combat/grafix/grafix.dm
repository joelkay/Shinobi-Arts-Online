obj
	effect
		layer= MOB_LAYER+5
		density=0
	undereffect
		layer= MOB_LAYER-1
		density=0
proc/Blood(dx,dy,dz)
	spawn()
		var/obj/o=new/obj/effect(locate(dx,dy,dz))
		o.icon='blood.dmi'
		var/r=rand(1,7)
		flick("[r]",o)
		var/obj/x=new/obj/undereffect(locate(dx,dy,dz))
		spawn(9)
			del(o)
			if(!x)return
			x.icon='blood.dmi'
			var/v=rand(1,7)
			x.icon_state="l[v]"
			spawn(600)
				del(x)

obj/Fire

	f1
		icon='katon.dmi'
		icon_state="1"
		density=0
		layer=MOB_LAYER+1
	f2
		icon='katon.dmi'
		icon_state="2"
		density=0
		layer=MOB_LAYER+1
	f3
		icon='katon.dmi'
		icon_state="3"
		density=0
		layer=MOB_LAYER+1
	f4
		icon='katon.dmi'
		icon_state="4"
		density=0
		layer=MOB_LAYER+1
	f5
		icon='katon.dmi'
		icon_state="5"
		density=0
		layer=MOB_LAYER+1
	f6
		icon='katon.dmi'
		icon_state="6"
		density=0
		layer=MOB_LAYER+1
	f7
		icon='katon.dmi'
		icon_state="7"
		density=0
		layer=MOB_LAYER+1
	f8
		icon='katon.dmi'
		icon_state="8"
		density=0
		layer=MOB_LAYER+1
	f9
		icon='katon.dmi'
		icon_state="9"
		density=0
		layer=MOB_LAYER+1
proc/Fire(dx,dy,dz,mag,dur)
	var/list/xlist=new
	if(mag==1)
		xlist+= new/obj/Fire/f1(locate(dx-1,dy+mag,dz))
		xlist+= new/obj/Fire/f2(locate(dx-1,dy,dz))
		xlist+= new/obj/Fire/f3(locate(dx-1,dy-1,dz))
		xlist+= new/obj/Fire/f4(locate(dx,dy+1,dz))
		xlist+= new/obj/Fire/f5(locate(dx,dy,dz))
		xlist+= new/obj/Fire/f6(locate(dx,dy-1,dz))
		xlist+= new/obj/Fire/f7(locate(dx+1,dy+mag,dz))
		xlist+= new/obj/Fire/f8(locate(dx+1,dy,dz))
		xlist+= new/obj/Fire/f9(locate(dx+1,dy-mag,dz))

	if(mag>=2)

		xlist+= new/obj/Fire/f5(locate(dx-1,dy-1,dz))
		xlist+= new/obj/Fire/f5(locate(dx+1,dy-1,dz))
		xlist+= new/obj/Fire/f5(locate(dx-1,dy+1,dz))
		xlist+= new/obj/Fire/f5(locate(dx+1,dy+1,dz))
		xlist+= new/obj/Fire/f5(locate(dx,dy-1,dz))
		xlist+= new/obj/Fire/f5(locate(dx+1,dy,dz))
		xlist+= new/obj/Fire/f5(locate(dx-1,dy,dz))
		xlist+= new/obj/Fire/f5(locate(dx,dy+1,dz))


		xlist+= new/obj/Fire/f4(locate(dx,dy+2,dz))
		xlist+= new/obj/Fire/f1(locate(dx-1,dy+2,dz))
		xlist+= new/obj/Fire/f7(locate(dx+1,dy+2,dz))

		xlist+= new/obj/Fire/f1(locate(dx-2,dy+1,dz))
		xlist+= new/obj/Fire/f2(locate(dx-2,dy,dz))
		xlist+= new/obj/Fire/f3(locate(dx-2,dy-1,dz))

		xlist+= new/obj/Fire/f3(locate(dx-1,dy-2,dz))
		xlist+= new/obj/Fire/f6(locate(dx,dy-2,dz))
		xlist+= new/obj/Fire/f9(locate(dx+1,dy-2,dz))

		xlist+= new/obj/Fire/f7(locate(dx+2,dy+1,dz))
		xlist+= new/obj/Fire/f8(locate(dx+2,dy,dz))
		xlist+= new/obj/Fire/f9(locate(dx+2,dy-1,dz))

		xlist+= new/obj/Fire/f5(locate(dx,dy,dz))


	spawn()
		sleep(dur)
		for(var/obj/vv in xlist)
			del(vv)

proc/AOE(xx,xy,xz,radius,healthdamage,duration,mob/attacker,wo,stun)
	var/obj/M=new/obj(locate(xx,xy,xz))
	var/i=duration
	while(i>0)
		i-=10
		for(var/mob/O in oview(radius,M))
			spawn()
				O.Dec_health(healthdamage,attacker,"AOE")

		sleep(10)
	del(M)