//////////////////////////////////////////////MOB CONTROL
//	Designed by Enfini-Desu(a.k.a Desu)		//
//	Credits not needed but appreciated		//
/////////////////////////////////////////////

////////How to use/////////////
//To control a mob, just set//
//src.controlled to the mob you//
//want controlled////////////
/////////////////////////////
mob/var/tmp/atom/movable/controlled

mob/Move(l,d)
	if(controlled)
		step(controlled,d)
	else return ..()



////////////////////////////////////////////////

mob/NPC
	Shadow_Clone
		name
		Village=""
		health=1
		Shadow_Clone=1
		owner

		New()
			..()
			spawn(150)
				DeleteShadow_Clone()


	KShadow_Clone
		name
		Village=""
		health=100
		Shadow_Clone=1
		owner

		New()
			..()
			spawn(150)
				DeleteShadow_Clone()



mob
	proc
		DeleteShadow_Clone()//manual kill
			if(src.client)return
			else
				del(src)

mob
	proc
		KillShadow_Clone()//manual kill
			for(var/mob/NPC/CShadow_Clone/C in world)
				if(!C.owner==src)continue
				if(C.Explode())
					del(C)//might be a special delete here

			for(var/mob/NPC/B in world)
				if(B.owner==src)
					flick("smoke2.dmi",B)
					B.targeted=null
					if(src.client)
						src.controlled=null
						src.client.eye=src
						src.bunsh=0
					B.DeleteShadow_Clone()



turf/Click()//this will make it so if you click the turf your pet will walk to it			//like in MJ
	for(var/mob/puppet1/F in view())
		if(F&&F.owner == usr)
			if(!usr.koed)
				walk_towards(F,src)
			else
				return

	for(var/mob/puppet1/D in view())
		if(D&&D.owner == usr)
			if(!usr.koed)
				walk_towards(D,src)
			else
				return

	for(var/mob/puppet2/E in view())
		if(E&&E.owner == usr)
			if(!usr.koed)
				walk_towards(E,src)
			else
				return



/*

mob
	verb
		Bunshatk()
			set hidden=1
			if(src.bunsh)
				for(var/mob/NPC/KShadow_Clone/K in range(20,src))
					if(K.owner == src&&!src.koed&&src.targeted&&!K.inloop)
						spawn()
							var/mob/D=src.targeted
							K.targeted=D
							walk_towards(K,D,2)
							K.attackloop()



mob/clone
	New()
		var/mob/M=src.owner
		src.icon=M
		src.overlays=M.overlays
		src.underlays=M
		var/locx=rand(src.x,10)
		var/locy=rand(src.y,10)


mob
	var/clonelimit=5

	verb
		summon()
			src.summonclones(src.clonelimit)

	proc
		summonclones(x)
			while(x)
				var/mob/clone/M=new/mob/clone
				M.owner=src
				x--//to reiterate it x times
*/

mob
	var/tmp/tajnum=0
	proc
		tajuu()
			set background=1
			var/num=src.tajnum
			var/i
			for(i=1,i<=num,i++)
				var/mob/NPC/KShadow_Clone/A = new /mob/NPC/KShadow_Clone
				flick('smoke2.dmi',A)
				var/x_loc=rand(1,8)
				var/y_loc=rand(1,8)
				A.loc = locate(src.x+x_loc, src.y+y_loc, src.z)
				A.dir = src.dir
				A.owner = src
				A.reflexmain = src.reflexmain
				A.dexteritymain = src.dexteritymain/6
				A.resistancemain = src.resistancemain/6
				A.strengthmain = src.strengthmain/6
				A.chakraforcemain = src.chakraforcemain/6
				A.agilitymain = src.agilitymain/6
				A.attackrate = src.attackrate
				A.name = src.name
				A.Village = src.Village
				A.icon=src.icon
				A.overlays = src.overlays
				A.name=src.name
				//A.Load_Overlays()// loads it all
				//A.Affirm_Icon()// loads it all
				src.doing=0






mob
	proc
		rasthrow()
			var/mob/M=src.targeted
			var/mob/NPC/KShadow_Clone/A = new /mob/NPC/KShadow_Clone
			var/mob/NPC/KShadow_Clone/B = new /mob/NPC/KShadow_Clone
			if(A)
				flick('smoke2.dmi',A)
				A.loc = locate(src.x, src.y, src.z)
				A.dir = src.dir
				A.owner = src
				A.name = src.name
				A.Village = src.Village
				A.icon=src.icon
				A.overlays = src.overlays
				A.name=src.name
				//A.Load_Overlays()// loads it all
				//A.Affirm_Icon()// loads it all
				A.overlays+='rasengan.dmi'
				src.doing=0
			if(B)
				flick('smoke2.dmi',B)
				B.loc = locate(src.x, src.y, src.z)
				B.dir = src.dir
				B.owner = src
				B.name = "[src.name]"
				B.Village = src.Village
				B.icon=src.icon
				B.overlays = src.overlays
				B.name=src.name
				//A.Load_Overlays()// loads it all
				//A.Affirm_Icon()// loads it all
				B.overlays+='rasengan.dmi'
				src.doing=0
				src.doing=0
			sleep(1)
			if(M)
				sleep(20)
				walk_towards(A,M,3)
				walk_towards(B,M,3)
				sleep(40)
				del(A)
				del(B)

