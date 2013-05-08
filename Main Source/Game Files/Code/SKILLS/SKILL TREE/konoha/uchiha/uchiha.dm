mob
	proc
		uchiha_bloodline()
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

			Stree_bloodline.first_link.command = "getskillu1";
			Stree_bloodline.second_link.command = "getskillu2";
			Stree_bloodline.third_link.command = "getskillu3";
			Stree_bloodline.fourth_link.command = "getskill";
			Stree_bloodline.ultimate_link.command = "getskillu4";


			default.menu= null
			"})
			winset(src, "Stree_bloodline.name", "image=marker.png")
			winset(src, "Stree_bloodline.first_link", "image=shari1st.png")
			winset(src, "Stree_bloodline.second_link", "image=shari2st.png")
			winset(src, "Stree_bloodline.third_link", "image=shari3st.png")
			winset(src, "Stree_bloodline.fourth_link", "image=marker.png")
			winset(src, "Stree_bloodline.ultimate_link", "image=mangekyoust.png")


	verb
//////////////////////////////////////////////////////////////////SKILLS BELOW//////////////////////////////////
		getskillu1()//first uchiha skill
			///////////////////////////////////////////////////////
			set hidden=1
			reqpoints=5
			sname="Sharingan 1"
			simage='shari1st.png'
			tech_obtained=/Skill/Sharingan_lvl1
			//tech_obtained2
			twoskillz=0
			sdesc={"This is the first clan skill of the Uchiha clan
				"}
			///////////////////////////////////////////////////////
			src.browseselectedskill()



		getskillu2()//second uchiha skill
			///////////////////////////////////////////////////////
			set hidden=1
			reqpoints=5
			sname="Sharingan 2"
			simage='shari2st.png'
			tech_obtained=/Skill/Sharingan_lvl2
			//tech_obtained2
			twoskillz=0
			///////////////////////////////////////////////////////
			src.browseselectedskill()



		getskillu3()//third uchiha skill
			///////////////////////////////////////////////////////
			set hidden=1
			reqpoints=5
			sname="Sharingan 3"
			simage='shari3st.png'
			tech_obtained=/Skill/Sharingan_lvl3
			//tech_obtained2
			twoskillz=0
			///////////////////////////////////////////////////////
			src.browseselectedskill()




		getskillu4()//last uchiha skill
			///////////////////////////////////////////////////////
			set hidden=1
			reqpoints=5
			sname="Mangekyou Sharingan"
			simage='mangekyoust.png'
			tech_obtained=/Skill/Mangekyo_Sharingan
			twoskillz=0
			///////////////////////////////////////////////////////
			src.browseselectedskill()