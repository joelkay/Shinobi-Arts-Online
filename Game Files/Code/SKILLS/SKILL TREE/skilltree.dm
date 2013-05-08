mob
	var/intree=0
	proc
		SkillTree()
			set hidden=1
			if(src.intree)
				src.SkillTreeR()
				return
			src.intree=1
			winshow(src,"SKILLTREE",1)
			///////////////////////////////
			var/a=src.attribute_Points
			winset(src,null,{"
			attributeslabel.text="[a]";
			"})
			//////////////////////////////////

		SkillTreeR()
			set hidden=1
			//src.Show_Radar()//add huds e.t.c
			winshow(src,"SKILLTREE",0)
			src.intree=0

	verb
		Skilltree()
			set hidden=1
			SkillTree()