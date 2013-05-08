mob
	proc
		hyuuga_bloodline()
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

			Stree_bloodline.first_link.command = "getskillh1";
			Stree_bloodline.second_link.command = "getskillh2";
			Stree_bloodline.third_link.command = "getskillh3";
			Stree_bloodline.fourth_link.command = "getskill";
			Stree_bloodline.ultimate_link.command = "getskillh4";


			default.menu= null
			"})
			winset(src, "Stree_bloodline.name", "image=marker.png")
			winset(src, "Stree_bloodline.first_link", "image=byakugan1st.png")
			winset(src, "Stree_bloodline.second_link", "image=kaitenst.png")
			winset(src, "Stree_bloodline.third_link", "image=byakugan2st.png")
			winset(src, "Stree_bloodline.fourth_link", "image=marker.png")
			winset(src, "Stree_bloodline.ultimate_link", "image=64palmsst.png")


	verb
//////////////////////////////////////////////////////////////////SKILLS BELOW//////////////////////////////////
		getskillh1()//first hyuuga skill
			///////////////////////////////////////////////////////
			set hidden=1
			reqpoints=5
			sname="Byakugan"
			simage='byakugan1st.png'
			tech_obtained=/Skill/Byakugan
			//tech_obtained2
			twoskillz=0
			sdesc={"This is the first clan skill of the hyuuga clan
				"}
			///////////////////////////////////////////////////////
			src.browseselectedskill()



		getskillh2()//second hyuuga skill
			///////////////////////////////////////////////////////
			set hidden=1
			reqpoints=5
			sname="Kaiten"
			simage='kaitenst.png'
			tech_obtained=/Skill/Kaiten
			//tech_obtained2
			twoskillz=0
			///////////////////////////////////////////////////////
			src.browseselectedskill()



		getskillh3()//third hyuuga skill
			///////////////////////////////////////////////////////
			set hidden=1
			reqpoints=5
			sname="Jyuuken"
			simage='byakugan2st.png'
			tech_obtained=/Skill/Jyuuken
			twoskillz=0
			///////////////////////////////////////////////////////
			src.browseselectedskill()




		getskillh4()//last hyuuga skill
			///////////////////////////////////////////////////////
			set hidden=1
			reqpoints=5
			sname="sixty four palms"
			simage='64palmsst.png'
			tech_obtained=/Skill/sixtyfour_palms
			//tech_obtained2
			twoskillz=0
			///////////////////////////////////////////////////////
			src.browseselectedskill()