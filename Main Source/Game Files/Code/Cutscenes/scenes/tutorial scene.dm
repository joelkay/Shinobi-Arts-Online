mob
	var/cantwander=0
	var/tmp
		tutorial1=1// starts at 1 and loops through
		tutorial2=0
		tutorial3=0
		tutorial4=0
		tutorial5=0
		done=0
		doneall=0




mob/NPC/Tutorial
	icon = 'baseblack.dmi'// change it boi
	//legarmor=/obj/items/legarmor/brown
	//armor=/obj/items/armors/black
	//shoes=/obj/items/Sandalsa
	//hair_type=1
	cantwander=1
	var/temp=0
	health = 9999999999999999999999999
/*	Click()
		if(usr.doneall)
			usr.exittut()
			usr.doneall=0//reset
			return
		if(usr.tutorial1)//introduction
			usr.tuttwo()
			if(usr.spoken==1)
				usr.gettutarea()
				usr.showmacros()// activate macros
				usr<<"<font color=green>You will now go into the optimised tutorial which will answer all your questions..."
				usr.tutorial1=0
				usr.tutorial2=1
				return
			else
				usr.showmacros()// activate macros
				usr.contents += new /Skill/Shadow_Clone
				usr.contents += new /Skill/Transformation_Technique
				usr.contents += new /Skill/Body_Replacement_Technique
				usr.contents += new /Skill/Body_Flicker
				usr.gettutarea()
				usr.spoken=1
				usr<<"<font color=green>You will now go into the optimised tutorial which will answer all your questions..."
				usr.tutorial1=0
				usr.tutorial2=1
				return

		if(usr.tutorial2)//skill tree
			usr.tutthree()
			usr.tutorial1=0
			usr.tutorial2=0
			usr.tutorial3=1
			return

		if(usr.tutorial3)//skill tree
			usr.tutfour()
			usr.tutorial1=0
			usr.tutorial2=0
			usr.tutorial3=0
			usr.tutorial4=1
			return
		if(usr.tutorial4)//
			usr.tutfive()
			usr.tutorial1=0
			usr.tutorial2=0
			usr.tutorial3=0
			usr.tutorial4=0
			usr.tutorial5=1
			return
		if(usr.tutorial5)//
			usr.tutsix()
			usr.tutorial1=1
			usr.tutorial2=0
			usr.tutorial3=0
			usr.tutorial4=0
			usr.tutorial5=0
			usr.doneall=1
			return
			//reset them


*/


mob
	proc
		gettutarea()
			for(var/obj/tutenter/D in world)
				if(!D.occupied)
					src.loc=D.loc
					D.occupied=1
					D.occupier=src
					src.initiatetut()

		initiatetut()
			var/mob/NPC/Tutorial/I = new/mob/NPC/Tutorial
			I.temp=1
			I.Move(locate(src.x+1, src.y, src.z))


		exittut()
			for(var/mob/NPC/Tutorial/T in view(src))
				if(T.temp)
					del(T)
			for(var/obj/tutenter/D in world)
				if(D.occupier==src)
					D.occupied=0
					D.occupier=null
					if(src.Village=="Leaf")
						src.loc = locate("LeafAcademyStart")//where they start -> tut room
					if(src.Village=="Sand")
						src.loc = locate("SandAcademyStart")//where they start -> tut room
					if(src.Village=="Mist")
						src.loc = locate("MistAcademyStart")//where they start -> tut room
					src<<"<font color=green>You have succesfully completed the tutorial.."
					return







obj/tutenter
	icon='enter.dmi'
	invisibility=100
	var/occupied=0
	var/tmp/occupier




mob
	proc
		gexam()
			if(!usr.rank=="Student") return
			usr.rank="Genin"
			world<<"[usr.name] has passed the genin exam."
			//world<<"<font color=blue>[usr.name] got the medal Genin!</font>"
			//world.SetMedal("Genin", usr)// medal for genin ?
			var/obj/items/Headband/B = new/obj/items/Headband
			B.loc = usr
			if(usr.Village=="Leaf")
				Leaf_Orb(0.1)
				usr.contribution+=0.1
			if(usr.Village=="Sand")
				Sand_Orb(0.1)
				usr.contribution+=0.1
			if(usr.Village=="Mist")
				Mist_Orb(0.1)
				usr.contribution+=0.1

		//usr.done=1//make it so the guy is done
		/*
			if(usr.done)
				if(usr.Village=="Leaf")// spawn points
					usr.loc = locate(41, 30, 4)
				if(usr.Village=="Sand")
					usr.loc=locate(11,39,16)
				if(usr.Village=="Mist")
					usr.loc=locate(42,36,18)
		*/