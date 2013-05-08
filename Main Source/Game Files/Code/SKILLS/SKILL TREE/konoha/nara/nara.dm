

mob
	proc
		nara_bloodline()
			winset(src,null,{"
			SKILLTREE.stree-child1.left = "Stree_bloodline";

			Stree_bloodline.link1.background-color = "blue";
			Stree_bloodline.link2.background-color = "blue";
			Stree_bloodline.link3.background-color = "blue";
			Stree_bloodline.link4.background-color = "blue";
			Stree_bloodline.link5.background-color = "blue";
			Stree_bloodline.link6.background-color = "blue";
			Stree_bloodline.link7.background-color = "blue";
			Stree_bloodline.link8.background-color = "blue";
			Stree_bloodline.link9.background-color = "blue";

			Stree_bloodline.first_link.command = "getskilln1";
			Stree_bloodline.second_link.command = "getskilln2";
			Stree_bloodline.third_link.command = "getskilln3";
			Stree_bloodline.fourth_link.command = "getskill";
			Stree_bloodline.ultimate_link.command = "getskilln4";


			default.menu= null
			"})
			winset(src, "Stree_bloodline.name", "image=marker.png")
			winset(src, "Stree_bloodline.first_link", "image=shadowposst.png")
			winset(src, "Stree_bloodline.second_link", "image=shadowstranglest.png")
			winset(src, "Stree_bloodline.third_link", "image=marker.png")
			winset(src, "Stree_bloodline.fourth_link", "image=marker.png")
			winset(src, "Stree_bloodline.ultimate_link", "image=shadowneedlest.png")


	verb
//////////////////////////////////////////////////////////////////SKILLS BELOW//////////////////////////////////
		getskilln1()//first nara skill
			///////////////////////////////////////////////////////
			set hidden=1
			reqpoints=5
			sname="Shadow Possesion"
			simage='shadowposst.png'
			tech_obtained=/Skill/Shadow_possesion
			tech_obtained=/Skill/Shadow_possesion_Cancel
			//tech_obtained2
			twoskillz=0
			sdesc={"This is the first clan skill of the nara clan
				"}
			///////////////////////////////////////////////////////
			src.browseselectedskill()



		getskilln2()//second nara skill
			///////////////////////////////////////////////////////
			set hidden=1
			reqpoints=5
			sname="Shadow NeckBind"
			simage='shadowstranglest.png'
			tech_obtained=/Skill/Shadow_NeckBind
			//tech_obtained2
			twoskillz=0
			///////////////////////////////////////////////////////
			src.browseselectedskill()



		getskilln3()//third nara skill
			///////////////////////////////////////////////////////
			set hidden=1
			reqpoints=5
			sname="blank_skill"
			simage='marker.png'
			tech_obtained=/Skill/
			//tech_obtained2
			twoskillz=0
			///////////////////////////////////////////////////////
			src.browseselectedskill()




		getskilln4()//last nara skill
			///////////////////////////////////////////////////////
			set hidden=1
			reqpoints=5
			sname="Shadow Needles"
			simage='shadowneedlest.png'
			tech_obtained=/Skill/Shadow_Needles
			twoskillz=0
			///////////////////////////////////////////////////////
			src.browseselectedskill()