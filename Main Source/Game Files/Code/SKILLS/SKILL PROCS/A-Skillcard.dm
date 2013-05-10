mob
	var
		chosen=0
		bunsh=0
		tmp/num=1




obj
	skills
		layer=9



Skill
	parent_type = /obj/

	var
		chakracost=0//chakra cost
		sindex=""//skill it performs
		sealtime=0//time to perform
		supplies=0//supplies it takes
		tmp/clicked=0
		tmp/cooldown=0//temp/dynamic cooldown
		maxcooldown=0//constant number
		reqs=0//needs a requirement
		reqsdef=""//define requirement
		percent=0//percent of chakra used
		uses=0//uses
		kills=0//kills
		level=0//level
		nextlevel=10//uses left till next level...default of 10 at start.
		rank="D"//rank
		procedure=""//this is the proc it runs under E.g katon skills run under "Katon"


	mouse_drag_pointer ='drag.dmi'

	MouseDrop(obj/over_object,src_location,over_location,src_control,over_control,params)

		if(istype(over_object,/obj/Macros))
			for(var/obj/Macros/A in usr.client.screen)
				if(A==over_object)
					A.overlays+=image('skills.dmi',icon_state = src.icon_state)
					usr.macro["[A.number]"]=src.type//assoc list starting from one etc...
					A.copied=src.type


		else
			return



////////////////////////////////MACRO CODE ABOVE///////////////////////////////////////////////

	proc
		clicker()
			var/waittime=2//ammount of seconds you should wait before being able to click

			if(usr.kalled||usr.doing)
				if(debug)usr<<output("cooled[usr.kalled] doing[usr.doing]", "combatlog")
				return// click once every 3 secs pl0x

			usr.looop=world.time+(waittime*10)
			usr.cool_skill()
			if(debug)usr<<output("(clicker) Executed: cooled[usr.kalled] doing[usr.doing]", "combatlog")

			if(clicked)
				if(world.time<cooldown)// if the ting is cooling lyk
					var/time=(cooldown-world.time)/10
					usr<<output("You have to wait [round(time)] seconds to use this skill again", "combatlog")
					return

			src.clicked=1

			if(!usr.pk)
				usr<<"You are in a non pk zone"
				src.clicked=0

				return


			else
				if(usr.chakra>src.chakracost&&src.canbedone())
					cooldown=world.time+(maxcooldown*10)
					src.chakracost()//work out the costs
					usr.chakra-=src.chakracost//edit

					///////////////////////////////EXECUTE//////////////////////////////////
					spawn()	usr.hseals(src)//proc to exicute jutsu     <<-- execute jutsu
					///////////////////////////////EXECUTE/////////////////////////////////////

					uses++

					spawn() src.levelcheck()
					spawn() src.whileloop()




				else if(usr.chakra<chakracost)
					usr<<output("Not enough chakra [usr.chakra]/[chakracost]", "combatlog")
					usr.doing=0
					src.clicked=0

					return




	Click()
		clicker()




	proc
		whileloop()
			set background=1
			var/mob/M=usr


			if(cooldown<=world.time&&M)//check if hes still online

				src.clicked=0//can use this skill again
				usr.UpdateSkills()//this is for icons i guess that overlay refresh ever 10 secs

			else
				spawn(10) whileloop()//reiterate



	proc
		canbedone()
			var/mob/M=usr
			var/d=src.reqs
			if(!d)
				return 1

			if(d in M.requirements)//check if they are legible
				return 1//go ahead

			else
				M << output("[src.name]: [src.reqsdef]", "combatlog")
				return 0//cant do jutsu/waste exp



		chakracost()
			if(src.percent)
				var/mob/M =usr
				var/cost=src.percent/100 * M.max_chakra
				src.chakracost=cost


		levelcheck()
			if(level>=50)//max level of 50
				return
			if(uses>=nextlevel)

				src<<"<font color=blue>[src] Leveled Up.</font>"
				src.nextlevel+=((usr.blevel)+20)
				src.level++

				if(level==1)
					usr.client.screen+=new/obj/levels/one

				if(level==5)
					usr.client.screen+=new/obj/levels/five

				if(level==10)
					usr.client.screen+=new/obj/levels/ten

				if(level==15)
					usr.client.screen+=new/obj/levels/fifteen

				if(level==30)
					usr.client.screen+=new/obj/levels/thirty

				if(level==50)
					usr.client.screen+=new/obj/levels/fifty
					src<<"<font color=blue>[src] has been mastered to S rank level.</font>"
					src.rank="S"

				spawn(20)
					for(var/obj/levels/H in usr.client.screen)
						del(H)











