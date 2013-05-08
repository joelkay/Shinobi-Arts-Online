/*
		-label3-label4-thirdlink xxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxx
name-label1-firstlinkxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx------label7-label8-ultimate link
xxxxxxxxxxxxxxxxxxxxxxx
		-label5-secondlink-label6-fourthlinkx

*/


//stree-child1
//stree-child2
//streebrowser

//link1-9 //progresss

//bloodline//

mob
	verb
		generatebloodlineb()
			set hidden=1
			src.generatebloodline()
mob
	proc
		generatebloodline()//bloodlines
			if(src.Clan=="Uchiha")
				src.uchiha_bloodline()//uchiha one
			if(src.Clan=="Hyuuga")
				src.hyuuga_bloodline()//uchiha one
			if(src.Clan=="Nara")
				src.nara_bloodline()//uchiha one

mob
	var/reqpoints
	var/sname
	var/tech_obtained=/Skill/
	var/tech_obtained2=/Skill/
	var/twoskillz
	var/simage
	var/sdesc//descrribez
	var/list/boughtskills = list()
	verb

		buyskill()
			set hidden=1
			//////////////////////////////////////////////////////////////////////////////////////////////////
			if(!sname || sname in boughtskills) return

			if(usr.attribute_Points < reqpoints)
				Apopup(src,"You need [reqpoints] skill points for this!")
				return
			else
				switch (alert("Obtain [sname] for [reqpoints] points?","Skill Obtain","Yes","No"))
					if("Yes")
						Apopup(src,"You have obtained [sname]!")
						usr.attribute_Points = max(0, usr.attribute_Points - reqpoints)// incase it goes negative >_>
						//add the lines somehow
						//////////////////////////////////////
						var/a=src.attribute_Points
						winset(src,null,{"
						attributeslabel.text="[a]";
						"})
						/////////////////////////////////////
						usr.boughtskills.Add(sname)
						usr.contents += new tech_obtained
						if(twoskillz)
							usr.contents += new tech_obtained2
						usr.UpdateSkills()//update inventory.
						sname=null//reset

					if("No")
						return

	proc
		browseselectedskill()
			var/Main = {"
			<html>
			<body><STYLE>BODY {background: black; color: white}</STYLE>
			<b> Jutsu </b>:[sname]
			<IMG CLASS=icon SRC=\ref[simage]>
			<br>
			<br>
			this skill costs: [reqpoints] skill points
			<br>
			[sdesc]
			</body>
			</html>
			"}
			usr << browse(Main,"window=skilltreebrowser;[htmlop]")//User Browses The Main Menu Window






