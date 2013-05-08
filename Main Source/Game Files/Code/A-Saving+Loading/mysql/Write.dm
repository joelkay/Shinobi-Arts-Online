mob/duplicate//to delete a copy
	proc/prune(num)
		if(!num)//test, probably wont ever see this but hey
			if(debug)world.log<<"[src.client]:No sir, dont delete me"
		else
			del(src)
			//world.log<<"[src.client]:Duplicate deleted sir"
proc
	SaveSQL(mob/M,var/num=0)
		set background=1


		if(!M.cansql)//block edited files from getting uploaded to the server.
			if(debug)world<<"[M.name] is a corrupt save file"
			return

		/*
		var/mob/duplicate/M
		if(num)
			M=X.duplicate()//if they are closing game, create a copy of them to save in SQL
		else
			M=X
		*/

		var/SQLQuery
		SQLQuery+="UPDATE saves SET last_x='[M.last_x]', last_y='[M.last_y]', last_z='[M.last_z]'"
		SQLQuery+=",rpgname='[M.rpgname]', namefirst='[M.namefirst]', versionplayed='[M.versionplayed]', teamname='[M.teamname]' "
		SQLQuery+=",health='[M.health]', max_health='[M.max_health]', chakra='[M.chakra]', max_chakra='[M.max_chakra]' ,energy='[M.energy]' ,max_energy='[M.max_energy]' ,pk='[M.pk]', bingo='[M.bingo]',life='[M.life]',max_life='[M.max_life]',exp='[M.exp]',maxexp='[M.maxexp]'"
		SQLQuery+=",blevel='[M.blevel]', contribution='[M.contribution]', attribute_Points='[M.attribute_Points]', supplies='[M.supplies]', killmedalset='[M.killmedalset]', dummy='[M.dummy]', allowedswitch='[M.allowedswitch]'"
		SQLQuery+=",resistance='[M.resistance]', resistancemain='[M.resistancemain]', chakraforce='[M.chakraforce]', chakraforcemain='[M.chakraforcemain]', agility='[M.agility]', agilitymain='[M.agilitymain]', dexterity='[M.dexterity]', dexteritymain='[M.dexteritymain]'"
		SQLQuery+=",reflex='[M.reflex]', reflexmain='[M.reflexmain]', strength='[M.strength]', strengthmain='[M.strengthmain]', attackrate='[M.attackrate]', dizzyrate='[M.dizzyrate]', totaltime='[M.totaltime]', timesaved='[M.timesaved]'"
		SQLQuery+=",Savedx='[M.Savedx]', Savedy='[M.Savedy]', Savedz='[M.Savedz]', kills='[M.kills]', deaths='[M.deaths]', rank='[M.rank]', money='[M.money]', Chuunreset='[M.Chuunreset]'"
		SQLQuery+=",LeafS='[M.LeafS]', MistS='[M.MistS]', SandS='[M.SandS]', missingS='[M.missingS]', villagedone='[M.villagedone]', Village='[M.Village]', baseVillage='[M.baseVillage]', faction='[M.faction]', Clan='[M.Clan]', Clany='[M.Clany]'"
		SQLQuery+=",oldx='[M.oldx]', oldy='[M.oldy]', oldz='[M.oldz]', clicker='[M.clicker]', style='[M.style]', mute='[M.mute]', tempmute='[M.tempmute]', talkcool='[M.talkcool]', talktimes='[M.talktimes]', talkcooling='[M.talkcooling]'"
		SQLQuery+=",weaponinv='[M.weaponinv]', armorinv='[M.armorinv]', legarmorinv='[M.legarmorinv]', armarmorinv='[M.armarmorinv]', facearmorinv='[M.facearmorinv]', cloakinv='[M.cloakinv]', shoesinv='[M.shoesinv]', specialinv='[M.specialinv]'"
		SQLQuery+=",hair_type='[M.hair_type]', hair_red='[M.hair_red]', hair_green='[M.hair_green]', hair_blue='[M.hair_blue]', hair_color='[M.hair_color]', eye_r='[M.eye_r]', eye_g='[M.eye_g]', eye_b='[M.eye_b]'"
		SQLQuery+=",warkills='[M.warkills]', lee='[M.lee]', cantsave='[M.cantsave]', npcd='[M.npcd]', pointsg='[M.pointsg]', icon_name='[M.icon_name]', factionll='[M.factionll]', kage='[M.kage]', Orbshow='[M.Orbshow]'"
		SQLQuery+=",medpassive='[M.medpassive]', strpoints='[M.strpoints]', rfxpoints='[M.rfxpoints]', intpoints='[M.intpoints]', conpoints='[M.conpoints]', conr='[M.conr]', medr='[M.medr]', strr='[M.strr]', GM='[M.GM]'"
		SQLQuery+=" WHERE ckey='[ckey(M.key)]' AND name='[M.name]'"

		var/dbConnection/connector = new()
		var/dbconnection=connector.getConnection(connector.getDbi())

		if(dbconnection)
			var/DBQuery/resultset0 = connector.runQuery(dbconnection,"INSERT INTO `saves`  (ckey, name) VALUES('[ckey(M.key)]','[M.name]')")//if no row make a new one
			if(resultset0)
				if(debug) M <<"Player Row Ininitialised"
				resultset0.Close(); //free up and erase data.
			else
				if(!resultset0)
					resultset0.Close();
					if(debug)M << "ALL Failed."

			var/DBQuery/resultset2 = connector.runQuery(dbconnection,SQLQuery)
			if(resultset2)
				if(debug) world << "Player Save Complete"
				resultset2.Close() //free up and erase data.
				if(SaveLists(M))//save the mobs lists
					if(debug) world << "List Save Complete"


			else
				resultset2.Close()
				if(debug) world << "Failed."




proc
	SaveLists(var/mob/M)
		set background=1
		SaveSPreviews(M)
		SaveItems(M)
		SaveMacros(M)
		SaveSkills(M)
		SaveWeapons(M)
		return 1

	SaveItems(var/mob/M)
		set background=1
		//contents //2
		var/SQLQueryb=null
		if(M.contents.len)
			SQLQueryb+="UPDATE items SET Playername='[M.name]'"
			var/list/itemslist=list()
			for(var/obj/items/X in M.contents)
				itemslist.Add(X.listid)//give us the id's

			var/ib=0
			while(ib<itemslist.len)
				ib++
				sleep(1)
				if(itemslist[ib])
					SQLQueryb+=",[itemslist[ib]]='1'"//you have this
					if(debug)world<<"<font color=blue>Content id:[itemslist[ib]] value changed to 1 for [M.name]"
			SQLQueryb+=" WHERE Playername='[M.name]'"


		var/dbConnection/connector = new()
		var/dbconnection=connector.getConnection(connector.getDbi())

		if(dbconnection)

			if(SQLQueryb)
				var/DBQuery/resultset3 = connector.runQuery(dbconnection,"INSERT INTO `items`  (Playername) VALUES('[M.name]')")//if no row make a new one
				if(resultset3)
					if(debug) M <<"List2 Row Ininitialised"
					resultset3.Close(); //free up and erase data.
				else
					if(!resultset3)
						resultset3.Close();
						if(debug)M << "ALL Failed."

				var/DBQuery/resultset4 = connector.runQuery(dbconnection,SQLQueryb)//contents
				if(resultset4)
					if(debug) world << "List2 Save Complete"
					resultset4.Close() //free up and erase data.
				else
					resultset4.Close()
					if(debug) world << "Failed."

	SaveMacros(var/mob/M)
		set background=1
		//macro //4
		var/SQLQueryc=null
		if(M.macro.len)
			SQLQueryc+="UPDATE macro SET Playername='[M.name]'"
			var/ic=0
			while(ic<11)
				ic++
				sleep(1)
				if(M.macro["[ic]"])
					SQLQueryc+=",macro[ic]='[ M.macro["[ic]"] ]'"


					if(debug)world<<"<font color=blue>Macro[ic] = [ M.macro["[ic]"] ]"

			SQLQueryc+=" WHERE Playername='[M.name]'"

		var/dbConnection/connector = new()
		var/dbconnection=connector.getConnection(connector.getDbi())

		if(dbconnection)
			if(SQLQueryc)
				var/DBQuery/resultset7 = connector.runQuery(dbconnection,"INSERT INTO `macro`  (Playername) VALUES('[M.name]')")//if no row make a new one
				if(resultset7)
					if(debug) M <<"List4 Row Ininitialised"
					resultset7.Close(); //free up and erase data.
				else
					if(!resultset7)
						resultset7.Close();
						if(debug)M << "ALL Failed."

				var/DBQuery/resultset8 = connector.runQuery(dbconnection,SQLQueryc)//macro
				if(resultset8)
					if(debug) world << "List4 Save Complete"
					resultset8.Close() //free up and erase data.
				else
					resultset8.Close()
					if(debug) world << "Failed."


	SaveSkills(var/mob/M)
		set background=1
		//learnedskills //5 M.Learned_Skills
		var/SQLQueryd=null

		var/list/skills=list()
		for(var/Skill/A in M.contents)
			skills.Add(A)//give us the id's

		if(debug)world<<"<font color=red>Skills in contents:[skills.len]"
		if(skills.len)
			SQLQueryd+="REPLACE INTO savedskills (skillid,Playername,Skillname,level,uses,kills) VALUES"
			var/id=0
			while(id<skills.len)
				id++
				sleep(1)
				if(skills[id])//go through all skills
					var/Skill/S=skills[id]
					SQLQueryd+="('[M.name]:[S.name]','[M.name]','[S.name]','[S.level]','[S.uses]','[S.kills]')"
					if(id<skills.len) SQLQueryd+=","

					if(debug)world<<"<font color=blue>LearnedSkills[id] = [ skills[id] ]"

			SQLQueryd+=";"//because swag



		var/dbConnection/connector = new()
		var/dbconnection=connector.getConnection(connector.getDbi())

		if(dbconnection)
			if(SQLQueryd)
				var/DBQuery/resultset10 = connector.runQuery(dbconnection,SQLQueryd)//learnedskills
				if(resultset10)
					if(debug) world << "Skill Save Complete"
					resultset10.Close() //free up and erase data.
				else
					resultset10.Close()
					if(debug) world << "Failed."



	SaveWeapons(var/mob/M)
		set background=1
		//learnedweps //6 M.Learned_Weps
		var/SQLQuerye=null

		var/list/weps=list()
		for(var/Weapon/A in M.contents)
			weps.Add(A)//give us the id's

		if(debug)world<<"<font color=blue>Weapons in List: [weps.len]"

		if(weps.len)
			SQLQuerye+="REPLACE INTO savedweapons (skillid,Playername,Skillname,level,uses,kills) VALUES"
			var/id=0
			while(id<weps.len)
				id++
				sleep(1)
				if(weps[id])//go through all skills
					var/Weapon/S=weps[id]
					SQLQuerye+="('[M.name]:[S.name]','[M.name]','[S.name]','[S.level]','[S.uses]','[S.kills]')"
					if(id<weps.len) SQLQuerye+=","

					if(debug)world<<"<font color=blue>LearnedWeps[id] = [ weps[id] ]"

			SQLQuerye+=";"//because swag



		var/dbConnection/connector = new()
		var/dbconnection=connector.getConnection(connector.getDbi())

		if(dbconnection)
			if(SQLQuerye)
				var/DBQuery/resultset10 = connector.runQuery(dbconnection,SQLQuerye)//learnedskills
				if(resultset10)
					if(debug) world << "Weapon Save Complete"
					resultset10.Close() //free up and erase data.
				else
					resultset10.Close()
					if(debug) world << "Failed."


	SaveSPreviews(var/mob/M)
		set background=1
		//learnedweps //6 M.Learned_Weps

		var/dbConnection/connector = new()
		var/dbconnection=connector.getConnection(connector.getDbi())

		var/num=M.currentslot
		var/SQLQuery
		SQLQuery+="UPDATE savesettings SET slot[num]char='[M.name]'"
		SQLQuery+=" WHERE ckey='[ckey(M.key)]'"

		if(dbconnection)
			var/DBQuery/resultset11 = connector.runQuery(dbconnection,"INSERT INTO `savesettings`  (ckey) VALUES('[ckey(M.key)]')")//if no row make a new one
			if(resultset11)
				if(debug) M <<"slot[num]:[M.name] initiated"
				resultset11.Close(); //free up and erase data.
			else
				if(!resultset11)
					resultset11.Close();
					if(debug)M << "Failed."

			var/DBQuery/resultset12 = connector.runQuery(dbconnection,SQLQuery)//learnedweps
			if(resultset12)
				if(debug) world << "slot[num]:[M.name] saved"
				resultset12.Close() //free up and erase data.
			else
				resultset12.Close()
				if(debug) world << "Failed."























/*
LISTS TO BE CONVERTED
boughtskills[]
src.contents[]
screener[]
macro[]
Learned_Skills[]
Learned_Weps[]
*/