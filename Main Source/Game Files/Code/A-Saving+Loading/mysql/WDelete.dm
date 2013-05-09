proc//deletes a character from the server
	Delete(var/mob/M,var/name,var/slot)
		set background=1

		if(delete_playersave_table(name,"saves","name"))
			//then go to the next delete
			if(delete_playersave_table(name,"savedskills","Playername"))

				if(delete_playersave_table(name,"savedweapons","Playername"))

					if(delete_playersave_table(name,"macro","Playername"))

						if(delete_playersave_table(name,"items","Playername"))


							if(save_player_settings(M,name,slot))//this updates the save settings table
								return 1// everything was succesfull

							else
								return 0//delete failed

						else
							return 0//delete failed
					else
						return 0//delete failed

				else
					return 0//delete failed
			else
				return 0//delete failed

		else
			return 0//delete failed






//this is for deleting files from the save tables
proc/delete_playersave_table(var/name,var/table,var/field)
	set background=1

	var/dbConnection/connector = new()
	var/dbconnection=connector.getConnection(connector.getDbi())

	if(dbconnection)
		var/DBQuery/resultset1 = connector.runQuery(dbconnection,"DELETE FROM [table] WHERE [field]='[name]'")
		if(resultset1)
			if(debug) world<<"Phase [table] complete"
			resultset1.Close(); //free up and erase data.
			return 1
		else
			if(!resultset1)
				resultset1.Close();
				if(debug) world<< "Phase [table] Failed."
				return 0

	else return 0



//this is to save the settings
proc/save_player_settings(var/mob/M,var/char,var/num)
	set background=1
	//learnedweps //6 M.Learned_Weps
	var/dbConnection/connector = new()
	var/dbconnection=connector.getConnection(connector.getDbi())

	var/SQLQuery
	SQLQuery+="UPDATE savesettings SET slot[num]char='NULL'"
	SQLQuery+=" WHERE ckey='[ckey(M.key)]'"

	if(dbconnection)
		var/DBQuery/resultset11 = connector.runQuery(dbconnection,"INSERT INTO `savesettings`  (ckey) VALUES('[ckey(M.key)]')")//if no row make a new one
		if(resultset11)
			if(debug) M <<"slot[num]:[char] initiated"
			resultset11.Close(); //free up and erase data.
		else
			if(!resultset11)
				resultset11.Close();
				if(debug)M << "Failed."
				return 0

		var/DBQuery/resultset12 = connector.runQuery(dbconnection,SQLQuery)//learnedweps
		if(resultset12)
			if(debug) world << "slot[num]:[char] deleted"
			resultset12.Close() //free up and erase data.
			return 1

		else
			resultset12.Close()
			if(debug) world << "Failed."
			return 0

	else return 0


