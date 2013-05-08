//dungeon scenes
obj
	shuri
		icon='shuri.dmi'
		density=1

		var
			group_name = ""
		New(text)
			..()
			group_name = text
			vis = new(src)

			// all objsbelong to your group
			vis.is_a(group_name)


		Bump(atom/movable/a)
			if(ismob(a))
				var/mob/A=a
				A.icon_state="deflect"
				src.y=A.y-1
				spawn(2)
					del(src)


mob
	var/tmp/messagez=0
	var/tmp/dl=0
	var/tmp/s1b=0//scene fight three s.f.t
	var/tmp/sfb=0//scene fight three s.f.t
	var/tmp/sft=0//scene fight three s.f.t
	var/tmp/sff=0//scene fight four s.f.f
	var/tmp/sffi=0//scene fight five s.f.fi
	proc
		messagez(x)
			switch(x)
				if(1)
					if(src.messagez>0)return
					src.messagez++
					src<<"[src] managed to follow the ninjas into the hideout"
					return
				if(2)
					if(src.messagez>1)return
					src.messagez++
					src<<"[src]:I hear sounds coming from the right better investigate"
					src.canmove=1
					return
				if(3)
					if(src.messagez>2)return
					src.messagez++
					src<<"[src]:oh noes where did he go"
					src.canmove=1
					return

		dialoguez()
			if(src.dl)return
			src.dl=1
			src<<"<font color =blue><font size=3>[src]: Whats going on!."
			src.canmove=0

		dialoguez2()
			if(src.dl)return
			src.dl=1
			src<<"<font color =white><font size=3>Sound Nin 2: You will not ruin our plans!."
			src<<"<font color =green><font size=3>Kakashi: Consider them ruined!."
			src.canmove=0

		dialoguez3()
			if(src.dl)return
			src.dl=1
			src<<"<font color =white><font size=3>Sound Nin 3: Both of you stay where you are or he dies!."




mob
	proc
		scene4begin()
			if(sfb)return
			src.sfb=1
			if(!src.map2)
				src.sfb=0
				sleep(10)//load
				src.scene4begin()//till it readay
				return
			src.messagez(1)
			src.canmove=1//enable di-Rs
			src.runon=0
			src.scenesfight1()


		scenesfight1()
			src.messagez(2)
			scenesfight2()


		scenesfight2()
			src.fade()
			src.dir=EAST
			////////////////////////////////////////////////////////////////////////////////
			src.loc=locate(src.map2.x1+12,src.map2.y1+5,src.map2.z1)//16,6,9
			src.toggle()//show map
			/////////////////////////////////////////////////////////////////////////////////
			src.scenesfight3()

		scenesfight3()
			if(src.sft)return
			src.sft=1
			var/mob/cutscene/soundninb/o=new(src.name)
			var/mob/cutscene/kakashi/a=new(src.name)
			var/mob/cutscene/iruka/b=new(src.name)

			o.loc=locate(src.map2.x1+15,src.map2.y1+15,src.map2.z1)//mob iruka fights
			o.dir=SOUTH

			b.loc=locate(src.map2.x1+15,src.map2.y1+5,src.map2.z1)//iruka
			a.loc=locate(src.map2.x1+11,src.map2.y1+5,src.map2.z1)//kakashi
			a.dir=WEST
			b.dir=NORTH


			var/obj/z=new/obj
			z.loc=locate(src.map2.x1+15,src.map2.y1+6,src.map2.z1) //camera
			src.client.eye=z

			src.dialoguez()
			walk_towards(z,o,3)//scenic

			sleep(40)
			walk_towards(z,b,3)//scenic

			sleep(40)
			b.canrun=0
			b.icon_state="throw"
			spawn(8) b.icon_state=""

			var/obj/shuri/s1=new(src.name)
			s1.loc=locate(src.map2.x1+15,src.map2.y1+6,src.map2.z1)//shuriken
			walk(s1,NORTH,2)

			src.client.eye=o
			del(z)//camera thingy

			sleep(40)
			b.canrun=1
			o.canrun=1
			src.client.eye=o

		   ///////////////////////////////////////////////////////////////////
			walk(o,SOUTH,2)
			walk(b,NORTH,2)
			src.client.eye=b
			sleep(40)
			src.fade()
			del(a)
			src.scenesfight4()


		scenesfight4()
			if(src.sff)return
			src.sff=1
			src.loc=locate(src.map2.x1+12,src.map2.y1+5,src.map2.z1)//16,6,9//same place
			src.canmove=0
			var/mob/cutscene/soundninc/m=new(src.name)//boss
			var/mob/cutscene/soundninc/n=new(src.name)//guy kakashi kills
			n.loc=locate(src.map2.x1+1,src.map2.y1+5,src.map2.z1)//2,6,2
			n.dir=EAST

			var/mob/cutscene/kakashi/a=new(src.name)
			a.loc=locate(src.map2.x1+11,src.map2.y1+5,src.map2.z1)//kakashi
			a.dir=WEST

			src.dl=0
			src.dialoguez2()
			sleep(10)
			src.client.eye=a
			walk(n,EAST,2)
			walk(a,WEST,2)

			sleep(60)
			src.dl=0

			sequence
				m.loc=locate(src.map2.x1+14,src.map2.y1+5,src.map2.z1)//2,6,2
				m.dir=WEST
				m.icon_state="threaten"
				src.dialoguez3()
				src.popup("attack")
				sleep(30)

			if(!src.firstattack)
				src.canmove=0
				step(m,WEST)
				flick("kill",m)
				m.icon_state=""
				src<<"<font color = red>You died a shinobi of a very young age.</font>"
				src.icon_state="ko"
				sleep(20)
				firstattack=0
				icon_state=""
				goto sequence


			else
				src<<"<font color = red>good.</font>"
				src.scene5begin()
				del(m)
				del(n)
				del(a)



