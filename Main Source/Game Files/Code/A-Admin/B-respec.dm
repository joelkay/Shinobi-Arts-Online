mob
	proc
		finalise()
			///////////////////////////////////////TEST MODE/////////////////////////////////////////////////
			if(!src.initiated)
				spawn() src.JutsuTest()//all jutsus...
				src.initiated=1
				src.pk=1//hit ppl

			src.CharacterFixes()


mob

	proc
		CharacterFixes()
			if(src)//true
				for(var/Skill/S in src.contents)
					del(S)

				if(!src.contents.len)
					src.contents=new
				src.contents += new /Skill/Shadow_Clone
				src.contents += new /Skill/Transformation_Technique
				src.contents += new /Skill/Body_Replacement_Technique
				src.contents += new /Skill/Body_Flicker
				jdone=0
				src.JutsuTest()
				//src<<"Fixed Savefile."


mob
	var/tmp/jdone=0
	proc
		JutsuTest()
			if(jdone)return
			src<<"TEST MODE: You have received all the jutsus available to your character. to acces them look in the skills tab.."
			jdone=1
			if(!src.contents.len)
				src.contents=new

			src.contents += new/Weapon/Sword
			var/list/liststart=StarterList(src)
			for(var/Skill/X in liststart)
				src.contents += X.duplicate()//so they dont overun e.t.c

			src.UpdateSkills()
