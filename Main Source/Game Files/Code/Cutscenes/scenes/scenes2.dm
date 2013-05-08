/*var/mobs = 0
mob/New()
    ..()
    world << "mob.new = [src]"
    mobs++
mob/Del()
    mobs--
    world << "mob.del = [src]"
    ..()
mob/Stat()
    stat("mobs:", mobs)
*/

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

	Move()
		if(src.canrun)
			src.icon_state="Run"//when they are allowed

		..()

	iruka
		icon='iruka.dmi'


		Bump(atom/movable/a)

			if(istype(a,/obj/bump))//delete them for next scene
				if(src.owner)
					var/mob/M=src.owner
					M.client.eye=M//middle guy
					M.scene3begin()
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

	proc
		scene1begin2()//to move about
			src.location = "scene1"
			src.loc=locate(src.map.x1+19,src.map.y1+27,src.map.z1)//20,28,2

	proc
		scene1begin()
			src.location = "scene1"
			src.canmove=0//stop di-Rs
			src<<"<font color=blue>Meowww"
			src.loc=locate(src.map.x1+19,src.map.y1+27,src.map.z1)//20,28,2
			/////////////////////////////////////////////////////////////////
			src.client.eye=src
			src.toggle()//show map
			src.inscenario=1//so they move like an npc
			/////////////////////////////////////////////////////////////////
			var/obj/x=new/obj
			x.loc=locate(src.map.x1+19,src.map.y1+19,src.map.z1) //20,20,2
			walk_towards(src,x,2)
			sleep(20)
			src.dir=WEST
			x.loc=locate(src.map.x1+8,src.map.y1+19,src.map.z1) //9,20,2
			src<<"[src]: Come here kitty...."
			sleep(20)
			src<<"[src]:Man I'm sick of these Stupid D-rank search missions...."
			sleep(30)
			src.scene2begin()

		scene2begin()
			src<<"[src]:What the hell...."
			src.dir=NORTH
			var/mob/cutscene/soundnina/m=new(src.name)
			var/mob/cutscene/soundninc/n=new(src.name)
			var/mob/cutscene/soundninc/o=new(src.name)

			var/mob/cutscene/iruka/a=new(src.name)
			var/mob/cutscene/kakashi/b=new(src.name)

			n.owner=src
			a.owner=src

			src.client.eye=n//chaser

			var/obj/x=new/obj
			var/obj/bump/x1=new/obj/bump
			x.loc=locate(src.map.x1+29,src.map.y1+20,src.map.z1) //1st mob
			x1.loc=locate(src.map.x1+28,src.map.y1+20,src.map.z1)//bumps this

			var/obj/y=new/obj
			var/obj/bump/y1=new/obj/bump
			y.loc=locate(src.map.x1+29,src.map.y1+21,src.map.z1) //2nd mob
			y1.loc=locate(src.map.x1+28,src.map.y1+21,src.map.z1)//bumps this

			var/obj/z=new/obj
			var/obj/bump/z1=new/obj/bump
			z.loc=locate(src.map.x1+29,src.map.y1+22,src.map.z1) //3rd mob
			z1.loc=locate(src.map.x1+28,src.map.y1+22,src.map.z1)//bumps this

			var/obj/bump/l1=new/obj/bump
			l1.loc=locate(src.map.x1+28,src.map.y1+19,src.map.z1)//bumps this


			m.loc=locate(src.map.x1+3,src.map.y1+20,src.map.z1)
			n.loc=locate(src.map.x1+2,src.map.y1+21,src.map.z1)
			o.loc=locate(src.map.x1+3,src.map.y1+22,src.map.z1)


			spawn()walk_towards(m,x,2)
			spawn()walk_towards(n,y,2)
			spawn()walk_towards(o,z,2)

			spawn(18)
				src.client.eye=a
				a.loc=locate(src.map.x1+2,src.map.y1+21,src.map.z1)
				b.loc=locate(src.map.x1+3,src.map.y1+22,src.map.z1)

				src<<"<font color =white>Kakashi: Comeon Iruka keep up we dont want to lose them.."
				spawn(2) src<<"<font color =white>Iruka: Right.."
				spawn()walk_towards(a,y,2)
				spawn()walk_towards(b,z,2)


		scene3begin()
			src.inscenario=0//so they move like a player now
			src<<"[src]: Two Jounins from leaf i wonder whats happening.. i should go find out.."
			src.popup("move")
			walk(src,0)//cancel all auto movement





