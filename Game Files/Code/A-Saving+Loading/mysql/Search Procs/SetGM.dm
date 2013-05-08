proc
	isGM(mob/M)//searches if the player is logged in a diff server, returns 1 if it finds it, 0 if it doenst.
		set background=1
		var/dbConnection/connector = new()
		var/dbconnection=connector.getConnection(connector.getDbi())

		if(dbconnection)
			var/DBQuery/resultset = connector.runQuery(dbconnection,"SELECT GM FROM `savesettings` WHERE `ckey` = '[ckey(M.key)]'")
			if(resultset.RowCount() > 0)
				while(resultset.NextRow())

					var/list/row_data = resultset.GetRowData()

					for(var/D in row_data)

						if(D=="GM")
							var/GM=row_data[D]

							if(debug)M<<"value: [GM]"

							if(GM==1)
								return 1
							else
								return 0



			else
				if(resultset) resultset.Close();
				if(debug) M << "No Results for [ckey(M.key)].";
				return 0

		else
			src << "Connection Failed.";
			return 0


proc
	setGM(mob/M,num)

		var/dbConnection/connector = new()
		var/dbconnection=connector.getConnection(connector.getDbi())

		if(dbconnection)
			var/DBQuery/resultset

			if(num)
				resultset = connector.runQuery(dbconnection,"UPDATE savesettings SET GM = '1' WHERE ckey='[ckey(M.key)]'")
			else
				resultset = connector.runQuery(dbconnection,"UPDATE savesettings SET GM = '0' WHERE ckey='[ckey(M.key)]'")

			if(resultset)
				if(debug) world << "GM Value: Okay"
				resultset.Close() //free up and erase data.

			else
				resultset.Close()
				if(debug) world << "GM Value: Failed."