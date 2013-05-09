//LOADING DATA
proc
	LoadSQL(mob/M)
		var/dbConnection/connector = new()
		var/dbconnection=connector.getConnection(connector.getDbi())

		if(dbconnection)
			var/DBQuery/resultset = connector.runQuery(dbconnection,"SELECT * FROM `saves` WHERE `ckey` = '[ckey(M.key)]' AND name='[M.name]'")
			if(resultset.RowCount() > 0)
				while(resultset.NextRow())
					var/list/row_data = resultset.GetRowData()

					for(var/D in row_data)
						switch(D)
							if("name")
								M.name=row_data[D]
								if(debug) world <<"name: [row_data[D]]"

							if("last_x")
								M.last_x=text2num(row_data[D])
								if(debug) M<<"x: [row_data[D]]"

							if("last_y")
								M.last_y=text2num(row_data[D])
								if(debug) M<<"y: [row_data[D]]"

							if("last_z")
								M.last_z=text2num(row_data[D])
								if(debug) M<<"z: [row_data[D]]"

							if("rpgname")
								M.rpgname=row_data[D]
								if(debug) M<<"rpgname: [row_data[D]]"

							if("namefisrt")
								M.namefirst=row_data[D]
								if(debug) M<<"namefirst: [row_data[D]]"

							if("versionplayed")
								M.versionplayed=text2num(row_data[D])
								if(debug) M<<"versionplayed: [row_data[D]]"

							if("teamname")
								M.teamname=row_data[D]
								if(debug) M<<"teamname: [row_data[D]]"
							//PASS ONE

							if("health")
								M.health=text2num(row_data[D])
								if(debug) M<<"health: [row_data[D]]"

							if("max_health")
								M.max_health=text2num(row_data[D])
								if(debug) M<<"max_health: [row_data[D]]"

							if("chakra")
								M.chakra=text2num(row_data[D])
								if(debug) M<<"chakra: [row_data[D]]"

							if("max_chakra")
								M.max_chakra=text2num(row_data[D])
								if(debug) M<<"max_chakra: [row_data[D]]"

							if("energy")
								M.energy=text2num(row_data[D])
								if(debug) M<<"energy: [row_data[D]]"

							if("max_energy")
								M.max_energy=text2num(row_data[D])
								if(debug) M<<"max_energy: [row_data[D]]"

							if("pk")
								M.pk=text2num(row_data[D])
								if(debug) M<<"pk: [row_data[D]]"

							if("bingo")
								M.bingo=text2num(row_data[D])
								if(debug) M<<"bingo: [row_data[D]]"

							if("life")
								M.life=text2num(row_data[D])
								if(debug) M<<"life: [row_data[D]]"

							if("max_life")
								M.max_life=text2num(row_data[D])
								if(debug) M<<"max_life: [row_data[D]]"

							if("exp")
								M.exp=text2num(row_data[D])
								if(debug) M<<"exp: [row_data[D]]"

							if("maxexp")
								M.maxexp=text2num(row_data[D])
								if(debug) M<<"maxexp: [row_data[D]]"
							//PASS TWO

							if("blevel")
								M.blevel=row_data[D]
								if(debug) M<<"blevel: [row_data[D]]"

							if("contribution")
								M.contribution=text2num(row_data[D])
								if(debug) M<<"contribution: [row_data[D]]"

							if("attribute_Points")
								M.attribute_Points=text2num(row_data[D])
								if(debug) M<<"attributepoints: [row_data[D]]"

							if("killmedalset")
								M.killmedalset=text2num(row_data[D])
								if(debug) M<<"killmedalset: [row_data[D]]"

							if("dummy")
								M.dummy=text2num(row_data[D])
								if(debug) M<<"dummy: [row_data[D]]"

							if("allowedswitch")
								M.allowedswitch=text2num(row_data[D])
								if(debug) M<<"allowedswitch: [row_data[D]]"
							//PASS THREE
							if("resistance")
								M.resistance=text2num(row_data[D])
								if(debug) M<<"resistance: [row_data[D]]"

							if("resistancemain")
								M.resistancemain=text2num(row_data[D])
								if(debug) M<<"resistancemain: [row_data[D]]"

							if("chakraforce")
								M.chakraforce=text2num(row_data[D])
								if(debug) M<<"chakraforce: [row_data[D]]"

							if("chakraforcemain")
								M.chakraforcemain=text2num(row_data[D])
								if(debug) M<<"chakraforcemain: [row_data[D]]"

							if("agility")
								M.agility=text2num(row_data[D])
								if(debug) M<<"agility: [row_data[D]]"

							if("agilitymain")
								M.agilitymain=text2num(row_data[D])
								if(debug) M<<"agilitymain: [row_data[D]]"
							if("dexterity")
								M.dexterity=text2num(row_data[D])
								if(debug) M<<"dexterity: [row_data[D]]"
							if("dexteritymain")
								M.dexteritymain=text2num(row_data[D])
								if(debug) M<<"dexteritymain: [row_data[D]]"
							//PASS FOUR

							if("reflex")
								M.reflex=text2num(row_data[D])
								if(debug) M<<"reflex: [row_data[D]]"
							if("reflexmain")
								M.reflexmain=text2num(row_data[D])
								if(debug) M<<"reflexmain: [row_data[D]]"
							if("strength")
								M.strength=text2num(row_data[D])
								if(debug) M<<"strength: [row_data[D]]"
							if("strengthmain")
								M.strengthmain=text2num(row_data[D])
								if(debug) M<<"strengthmain: [row_data[D]]"
							if("attackrate")
								M.attackrate=text2num(row_data[D])
								if(debug) M<<"attackrate: [row_data[D]]"
							if("dizzyrate")
								M.dizzyrate=text2num(row_data[D])
								if(debug) M<<"dizzyrate: [row_data[D]]"
							if("totaltime")
								M.totaltime=text2num(row_data[D])
								if(debug) M<<"totaltime: [row_data[D]]"

							if("timesaved")
								M.timesaved=text2num(row_data[D])
								if(debug) M<<"timesaved: [row_data[D]]"
							//PASS FIVE

							if("Savedx")
								M.Savedx=text2num(row_data[D])
								if(debug) M<<"Savedx: [row_data[D]]"

							if("Savedy")
								M.Savedy=text2num(row_data[D])
								if(debug) M<<"Savedy: [row_data[D]]"

							if("Savedz")
								M.Savedz=text2num(row_data[D])
								if(debug) M<<"Savedz: [row_data[D]]"

							if("kills")
								M.kills=row_data[D]//changed row data to an int value
								if(debug) M<<"kills: [row_data[D]]"

							if("deaths")
								M.deaths=row_data[D]
								if(debug) M<<"deaths: [row_data[D]]"

							if("rank")
								M.rank=row_data[D]
								if(debug) M<<"rank: [row_data[D]]"

							if("money")
								M.money=text2num(row_data[D])
								if(debug) M<<"money: [row_data[D]]"
							if("Chuunreset")
								M.Chuunreset=text2num(row_data[D])
								if(debug) M<<"Chuunreset: [row_data[D]]"
							//PASS SIX

							if("LeafS")
								M.LeafS=text2num(row_data[D])
								if(debug) M<<"LeafS: [row_data[D]]"
							if("MistS")
								M.MistS=text2num(row_data[D])
								if(debug) M<<"MistS: [row_data[D]]"
							if("SandS")
								M.SandS=text2num(row_data[D])
								if(debug) M<<"SandS: [row_data[D]]"
							if("missingS")
								M.missingS=text2num(row_data[D])
								if(debug) M<<"missingS: [row_data[D]]"
							if("villagedone")
								M.villagedone=text2num(row_data[D])
								if(debug) M<<"villagedone: [row_data[D]]"
							if("Village")
								M.Village=row_data[D]
								if(debug) M<<"Village: [row_data[D]]"
							if("baseVillage")
								M.baseVillage=row_data[D]
								if(debug) M<<"baseVillage: [row_data[D]]"
							if("faction")
								M.faction=row_data[D]
								if(debug) M<<"faction: [row_data[D]]"
							if("Clan")
								M.Clan=row_data[D]
								if(debug) M<<"Clan: [row_data[D]]"
							if("Clany")
								M.Clany=text2num(row_data[D])
								if(debug) M<<"Clany: [row_data[D]]"
							//PASS SEVEN

							if("oldx")
								M.oldx=text2num(row_data[D])
								if(debug) M<<"oldx: [row_data[D]]"
							if("oldy")
								M.oldy=text2num(row_data[D])
								if(debug) M<<"oldy: [row_data[D]]"
							if("oldz")
								M.oldz=text2num(row_data[D])
								if(debug) M<<"oldz: [row_data[D]]"
							if("clicker")
								M.clicker=text2num(row_data[D])
								if(debug) M<<"clicker: [row_data[D]]"
							if("style")
								M.style=text2num(row_data[D])
								if(debug) M<<"style: [row_data[D]]"
							if("Village")
								M.Village=text2num(row_data[D])
								if(debug) M<<"Village: [row_data[D]]"
							if("mute")
								M.mute=text2num(row_data[D])
								if(debug) M<<"mute: [row_data[D]]"
							if("tempmute")
								M.tempmute=text2num(row_data[D])
								if(debug) M<<"tempmute: [row_data[D]]"
							if("talkcool")
								M.talkcool=text2num(row_data[D])
								if(debug) M<<"talkcool: [row_data[D]]"
							if("talktimes")
								M.talktimes=text2num(row_data[D])
								if(debug) M<<"talktimes: [row_data[D]]"
							if("talkcooling")
								M.talkcooling=text2num(row_data[D])
								if(debug) M<<"talkcooling: [row_data[D]]"
							//PASS EIGHT

							if("weaponinv")
								M.weaponinv=row_data[D]
								if(debug) M<<"nextvar: [row_data[D]]"
							if("armorinv")
								M.armorinv=row_data[D]
								if(debug) M<<"nextvar: [row_data[D]]"
							if("legarmorinv")
								M.legarmorinv=row_data[D]
								if(debug) M<<"nextvar: [row_data[D]]"
							if("armarmorinv")
								M.armarmorinv=row_data[D]
								if(debug) M<<"nextvar: [row_data[D]]"
							if("facearmorinv")
								M.facearmorinv=row_data[D]
								if(debug) M<<"nextvar: [row_data[D]]"
							if("cloakinv")
								M.cloakinv=row_data[D]
								if(debug) M<<"nextvar: [row_data[D]]"
							if("shoesinv")
								M.shoesinv=row_data[D]
								if(debug) M<<"nextvar: [row_data[D]]"
							if("specialinv")
								M.specialinv=row_data[D]
								if(debug) M<<"nextvar: [row_data[D]]"
							//PASS NINE


							if("hair_type")
								M.hair_type=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							if("hair_red")
								M.hair_red=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							if("hair_green")
								M.hair_green=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							if("hair_blue")
								M.hair_blue=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							if("hair_color")
								M.hair_color=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							if("eye_r")
								M.eye_r=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							if("eye_g")
								M.eye_g=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							if("eye_b")
								M.eye_b=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							//PASS TEN


							if("warkills")
								M.warkills=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							if("lee")
								M.lee=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							if("cantsave")
								M.cantsave=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							if("npcd")
								M.npcd=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							if("pointsg")
								M.pointsg=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							if("icon_name")
								M.icon_name=row_data[D]
								if(debug) M<<"nextvar: [row_data[D]]"
							if("factionll")
								M.factionll=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							if("kage")
								M.kage=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							if("Orbshow")
								M.Orbshow=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							//PASS ELEVEN

							if("medpassive")
								M.medpassive=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							if("strpoints")
								M.strpoints=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							if("rfxpoints")
								M.rfxpoints=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							if("intpoints")
								M.intpoints=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							if("conpoints")
								M.conpoints=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							if("conr")
								M.conr=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							if("medr")
								M.medr=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							if("strr")
								M.strr=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							//FINAL PASS

				resultset.Close(); //free up and erase data.
				return 1//success

			else

				if(resultset) resultset.Close();
				if(debug)world << "No Results.";
				return 0//fail


	LoadLists(mob/M)
		var/dbConnection/connector = new()
		var/dbconnection=connector.getConnection(connector.getDbi())

		if(dbconnection)
			var/DBQuery/resultset = connector.runQuery(dbconnection,"SELECT * FROM `contents` WHERE `name` = '[M.name]'")
			if(resultset.RowCount() > 0)
				while(resultset.NextRow())
					var/list/row_data = resultset.GetRowData()

					for(var/D in row_data)
						if(debug) world<<"[D] = [row_data[D]]"



proc
	LoadSQLSettings(mob/M)
		var/dbConnection/connector = new()
		var/dbconnection=connector.getConnection(connector.getDbi())

		if(dbconnection)
			var/DBQuery/resultset = connector.runQuery(dbconnection,"SELECT * FROM `savesettings` WHERE `ckey` = '[ckey(M.key)]'")
			if(resultset.RowCount() > 0)
				while(resultset.NextRow())
					var/list/row_data = resultset.GetRowData()

					for(var/D in row_data)
						switch(D)
							if("slot1char")
								if(row_data[D]!="NULL")
									M.slot1char=row_data[D]
									if(debug) M<<"slot1char: [row_data[D]]"

							if("slot2char")
								if(row_data[D]!="NULL")
									M.slot2char=row_data[D]
									if(debug) M<<"slot2char: [row_data[D]]"

							if("slot3char")
								if(row_data[D]!="NULL")
									M.slot3char=row_data[D]
									if(debug) M<<"slot3char: [row_data[D]]"
				return 1//success

			else

				if(resultset) resultset.Close();
				if(debug)world << "No Results.";
				return 0//fail



proc
	LoadSQLPreviews(var/mob/M,var/slotchar)
		var/dbConnection/connector = new()
		var/dbconnection=connector.getConnection(connector.getDbi())

		if(dbconnection)
			var/DBQuery/resultset = connector.runQuery(dbconnection,"SELECT * FROM `saves` WHERE `name` = '[slotchar]'")
			if(resultset.RowCount() > 0)
				while(resultset.NextRow())
					var/list/row_data = resultset.GetRowData()

					for(var/D in row_data)
						switch(D)
							if("name")
								M.name=row_data[D]
								if(debug) world <<"name: [row_data[D]]"

							if("icon_name")
								M.icon_name=row_data[D]
								if(debug) world <<"icon_name: [row_data[D]]"

							if("weaponinv")
								M.weaponinv=row_data[D]
								if(debug) world <<"nextvar: [row_data[D]]"
							if("armorinv")
								M.armorinv=row_data[D]
								if(debug) world <<"nextvar: [row_data[D]]"
							if("legarmorinv")
								M.legarmorinv=row_data[D]
								if(debug) world <<"nextvar: [row_data[D]]"
							if("armarmorinv")
								M.armarmorinv=row_data[D]
								if(debug) world <<"nextvar: [row_data[D]]"
							if("facearmorinv")
								M.facearmorinv=row_data[D]
								if(debug) world <<"nextvar: [row_data[D]]"
							if("cloakinv")
								M.cloakinv=row_data[D]
								if(debug) world <<"nextvar: [row_data[D]]"
							if("shoesinv")
								M.shoesinv=row_data[D]
								if(debug) world <<"nextvar: [row_data[D]]"
							if("specialinv")
								M.specialinv=row_data[D]
								if(debug) world <<"nextvar: [row_data[D]]"

							if("hair_type")
								M.hair_type=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							if("hair_red")
								M.hair_red=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							if("hair_green")
								M.hair_green=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							if("hair_blue")
								M.hair_blue=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							if("hair_color")
								M.hair_color=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							if("eye_r")
								M.eye_r=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							if("eye_g")
								M.eye_g=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"
							if("eye_b")
								M.eye_b=text2num(row_data[D])
								if(debug) M<<"nextvar: [row_data[D]]"

				return 1//success

			else

				if(resultset) resultset.Close();
				if(debug)world << "No Results.";
				return 0//fail




mob/proc
	setupdownload(var/slot1,var/slot2,var/slot3)
		set background=1
		if(LoadSQLSettings(src))//download ish
			var/savefile/F=new("Savefiles/[src.key]/previews/settings.sav")
			F["slot1char"] << slot1char
			F["slot2char"] << slot2char
			F["slot3char"] << slot3char

			var/mob/A=new/mob
			var/mob/B=new/mob
			var/mob/C=new/mob
			if(debug) world<<"world [slot1char] = [slot1]"//if(slot1char && slot1char!=slot1)
			if(slot1char)// if its a new character, download its settings and previews. Otherwise wait for update through save
				if(LoadSQLPreviews(A,slot1char))
					A.Loadprelays()
					src.PreviewA=A

			if(slot2char)//if(slot2char && slot2char!=slot2) if its a new character, download its settings and previews. Otherwise wait for update through save
				if(LoadSQLPreviews(B,slot2char))
					B.Loadprelays()
					src.PreviewB=B

			if(slot3char)//if(slot3char && slot3char!=slot3) if its a new character, download its settings and previews. Otherwise wait for update through save
				if(LoadSQLPreviews(C,slot3char))
					C.Loadprelays()
					src.PreviewC=C




/*
var/savefile/a=new("Savefiles/[src.key]/previews/1.sav")
					a["name"]<< A.name
					a["icon_name"] << A.icon_name
					a["weapon"] << A.weaponinv
					a["armor"] << A.armorinv
					a["legarmor"] << A.legarmorinv
					a["armarmor"] << A.armarmorinv
					a["facearmor"] << A.facearmorinv
					a["cloak"] << A.cloakinv
					a["shoes"] << A.shoesinv
					a["special"] << A.specialinv
					a["hair_type"] << A.hair_type
					a["hair_red"] << A.hair_red
					a["hair_green"] << A.hair_green
					a["hair_blue"] << A.hair_blue
					a["hair_color"] << A.hair_color



//boughtskills //1
		var/SQLQuery1
		SQLQuery1+="UPDATE boughtskills SET"
		var/i=0
		while(i<M.boughtskills.len)
			SQLQuery1+="listid='[i]'"
		 	SQLQuery1+="listvalue='[M.boughtskills[i]]'"
		SQLQuery1+="WHERE name='[M.name]'"


		//contents //2
		var/SQLQuery2
		SQLQuery2+="UPDATE contents SET"
		var/i2=0
		while(i2<M.contents.len)
			SQLQuery2+="listid='[i]'"
		 	SQLQuery2+="listvalue='[M.contents[i]]'"
		SQLQuery2+="WHERE name='[M.name]'"


		//macro //4
		var/SQLQuery4
		SQLQuery4+="UPDATE macro SET"
		var/i4=0
		while(i4<M.macro.len)
			SQLQuery4+="listid='[i]'"
		 	SQLQuery4+="listvalue='[M.macro[i]]'"
		SQLQuery4+="WHERE name='[M.name]'"

		//learnedskills //5
		var/SQLQuery5
		SQLQuery5+="UPDATE learnedskills SET"
		var/i5=0
		while(i5<M.learnedskills.len)
			SQLQuery5+="listid='[i]'"
		 	SQLQuery5+="listvalue='[M.learnedskills[i]]'"
		SQLQuery5+="WHERE name='[M.name]'"

		//learnedweps //6
		var/SQLQuery6
		SQLQuery6+="UPDATE learnedweps SET"
		var/i6=0
		while(i6<M.learnedweps.len)
			SQLQuery6+="listid='[i]'"
		 	SQLQuery6+="listvalue='[M.learnedweps[i]]'"
		SQLQuery6+="WHERE name='[M.name]'"

*/
