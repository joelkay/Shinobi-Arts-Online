////////////////////////////////////////////////////////////////////////
mob
	Bump(atom/movable/a)
		..()
		if(istype(a,/obj/bump))//delete them for next scene
			scene4begin()

	Login()
		..()
		// The vis object contains the mob's groups and views.
		// Groups are visibility groups that you're a memeber of,
		// views are the groups you can see. The vis object needs
		// to be instantiated for this functionality to be used.
		vis = new(src)
		vis.is_a(src.name)//this creates double mobs?
		vis.can_see(src.name)//make them see their instance




mob/var
	inscenario=0
mob/cutscene
	var/canrun=1
	density=1
	var
		group_name = ""
	New(text)
		..()
		group_name = text
		vis = new(src)

		// all mobs belong to your group
		vis.is_a(group_name)


	iruka
		icon='iruka.dmi'


		Bump(atom/movable/a)

			if(istype(a,/obj/bump))//delete them for next scene
				if(src.owner)
					var/mob/M=src.owner
					M.client.eye=M//middle guy
					scene3begin(M)
					del(src)//next scene




	kakashi
		icon='kakashi.dmi'

		Bump(atom/movable/a)
			if(istype(a,/obj/bump))//delete them for next scene
				del(src)

	soundnina
		icon='sound nin1.dmi'

		Bump(atom/movable/a)
			if(istype(a,/obj/bump))//delete them for next scene
				del(src)





	soundninb
		icon='sound nin2.dmi'//iruka
		Bump(atom/movable/a)
			if(istype(a,/obj/bump))//delete them for next scene
				del(src)

			if(istype(a,/mob))
				var/mob/A=a
				walk(A,0)
				walk(src,0)
				A.loc=src.loc
				src.loc=null
				A.icon_state="clash"
				spawn(20)
					A.icon_state=""
					src.icon_state="ko"
					src.loc=A.loc






	soundninc
		icon='sound nin3.dmi'//kakashi

		Bump(atom/movable/a)
			if(istype(a,/obj/bump))//delete them for next scene
				del(src)


			if(istype(a,/mob))
				var/mob/A=a
				walk(A,0)
				walk(src,0)
				A.loc=src.loc
				src.loc=null
				A.icon_state="punchscene"
				spawn(41)
					A.icon_state=""
					src.icon_state="ko"
					src.loc=A.loc





obj
	bump
		icon='denseobj.dmi'
		density=1

obj
	bump2
		icon='denseobj.dmi'
		density=1



mob
	var
		s1b2=0//scene1 prep done
		s1b1=0//scene1 done
		s2b=0//scene2 done
		s3b=0//scene3 done



proc
	scene1begin2(mob/M)//to move about
		if(M.s1b2)return
		M.s1b2=1
		M.location = "scene1"
		M.loc=locate(M.map.x1+19,M.map.y1+27,M.map.z1)//20,28,2

		if(M.vis.can_see(M.name))//show them their instance stuff
			M.vis.is_a(M.name)


	scene1begin(mob/M)
		if(M.s1b1)return
		M.s1b1=1

		M.location = "scene1"
		M.canmove=0//stop di-Rs

		var/mob/cat=new/mob
		cat.icon='cat.dmi'
		var/mob/preview=new/mob
		preview.icon='baseface.dmi'

		var/iconName = "popup[ckey(cat)]_flattened.dmi"
		// Copy the file to the rsc manually
		var/icon/b = fcopy_rsc(getFlatIcon(cat))
		// Send the icon to src's local cache
		src<<browse_rsc(b, iconName)

		var/iconName2 = "popup[ckey(preview)]_flattened.dmi"
		// Copy the file to the rsc manually
		var/icon/c = fcopy_rsc(getFlatIcon(preview))
		// Send the icon to src's local cache
		src<<browse_rsc(c, iconName2)



		M.loc=locate(M.map.x1+19,M.map.y1+27,M.map.z1)//20,28,2
		/////////////////////////////////////////////////////////////////
		M.client.eye=M
		M.toggle()//show map
		M.inscenario=1//so they move like an npc
		Apopup(M,"Meowww",0,cat)

		/////////////////////////////////////////////////////////////////
		var/obj/x=new/obj
		x.loc=locate(M.map.x1+19,M.map.y1+19,M.map.z1) //20,20,2
		walk_towards(M,x,2)
		sleep(20)
		M.dir=WEST
		x.loc=locate(M.map.x1+8,M.map.y1+19,M.map.z1) //9,20,2
		//////////////////////////////////////////////////////////////////

		Apopup(M,"[M]: Come here kitty....",0,preview)
		sleep(5)
		Apopup(M,"[M]:Man I'm sick of these Stupid D-rank search missions....",0,preview)
		sleep(5)
		scene2begin(M,preview)


	scene2begin(mob/M,mob/preview)
		if(M.s2b)return
		M.s2b=1
		Apopup(M,"[M]:What the hell....",0,preview)
		M.dir=NORTH
		var/mob/cutscene/soundnina/m=new(M.name)
		var/mob/cutscene/soundninc/n=new(M.name)
		var/mob/cutscene/soundninc/o=new(M.name)

		var/mob/cutscene/iruka/a=new(M.name)
		var/mob/cutscene/kakashi/b=new(M.name)

		n.owner=M
		a.owner=M

		M.client.eye=n//chaser

		var/obj/x=new/obj
		var/obj/bump/x1=new/obj/bump
		x.loc=locate(M.map.x1+29,M.map.y1+20,M.map.z1) //1st mob
		x1.loc=locate(M.map.x1+28,M.map.y1+20,M.map.z1)//bumps this

		var/obj/y=new/obj
		var/obj/bump/y1=new/obj/bump
		y.loc=locate(M.map.x1+29,M.map.y1+21,M.map.z1) //2nd mob
		y1.loc=locate(M.map.x1+28,M.map.y1+21,M.map.z1)//bumps this

		var/obj/z=new/obj
		var/obj/bump/z1=new/obj/bump
		z.loc=locate(M.map.x1+29,M.map.y1+22,M.map.z1) //3rd mob
		z1.loc=locate(M.map.x1+28,M.map.y1+22,M.map.z1)//bumps this

		var/obj/bump/l1=new/obj/bump
		l1.loc=locate(M.map.x1+28,M.map.y1+19,M.map.z1)//bumps this


		m.loc=locate(M.map.x1+3,M.map.y1+20,M.map.z1)
		n.loc=locate(M.map.x1+2,M.map.y1+21,M.map.z1)
		o.loc=locate(M.map.x1+3,M.map.y1+22,M.map.z1)


		spawn()walk_towards(m,x,2)
		spawn()walk_towards(n,y,2)
		spawn()walk_towards(o,z,2)

		var/mob/irukap=new/mob
		irukap.icon='irukaface.dmi'

		var/mob/kakaship=new/mob
		kakaship.icon='kakashiface.dmi'

		var/iconName = "popup[ckey(irukap)]_flattened.dmi"
		// Copy the file to the rsc manually
		var/icon/q = fcopy_rsc(getFlatIcon(irukap))
		// Send the icon to src's local cache
		src<<browse_rsc(q, iconName)

		var/iconName2 = "popup[ckey(kakaship)]_flattened.dmi"
		// Copy the file to the rsc manually
		var/icon/c = fcopy_rsc(getFlatIcon(kakaship))
		// Send the icon to src's local cache
		src<<browse_rsc(c, iconName2)

		spawn(18)
			M.client.eye=a
			a.loc=locate(M.map.x1+2,M.map.y1+21,M.map.z1)
			b.loc=locate(M.map.x1+3,M.map.y1+22,M.map.z1)

			Apopup(M,"Kakashi: Comeon Iruka keep up we dont want to lose them..",0,kakaship)
			Apopup(M,"Iruka: Right..",0,irukap)

			spawn()walk_towards(a,y,2)
			spawn()walk_towards(b,z,2)


	scene3begin(mob/M)
		if(M.s3b)return
		M.s3b=1
		var/mob/preview=new/mob
		preview.icon='baseface.dmi'

		var/iconName2 = "popup[ckey(preview)]_flattened.dmi"
		// Copy the file to the rsc manually
		var/icon/c = fcopy_rsc(getFlatIcon(preview))
		// Send the icon to src's local cache
		src<<browse_rsc(c, iconName2)


		M.inscenario=0//so they move like a player now
		Apopup(M,"[M]: Two Jounins from leaf i wonder whats happening.. i should go find out..",0,preview)
		popup(M,"move")
		walk(M,0)//cancel all auto movement






