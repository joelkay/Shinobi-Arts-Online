proc
	isFounder(mob/M)//searches if the player is logged in a diff server, returns 1 if it finds it, 0 if it doenst.
		set background=1
		var/dbConnection/connector = new()
		var/dbconnection=connector.getConnection(connector.getDbi())

		if(dbconnection)
			var/DBQuery/resultset = connector.runQuery(dbconnection,"SELECT Founder FROM `savesettings` WHERE `ckey` = '[ckey(M.key)]'")
			if(resultset.RowCount() > 0)
				while(resultset.NextRow())

					var/list/row_data = resultset.GetRowData()

					for(var/D in row_data)

						if(D=="Founder")
							var/Founder=row_data[D]

							if(debug)M<<"Founder: [Founder]"

							return Founder



			else
				if(resultset) resultset.Close();
				if(debug) M << "No Results for [ckey(M.key)].";
				return 0

		else
			src << "Connection Failed.";
			return 0


proc
	setFounder(mob/M,num)

		var/dbConnection/connector = new()
		var/dbconnection=connector.getConnection(connector.getDbi())

		if(dbconnection)
			var/DBQuery/resultset

			if(num)
				resultset = connector.runQuery(dbconnection,"UPDATE savesettings SET Founder = '1' WHERE ckey='[ckey(M.key)]'")
			else
				resultset = connector.runQuery(dbconnection,"UPDATE savesettings SET Founder = '0' WHERE ckey='[ckey(M.key)]'")

			if(resultset)
				if(debug) world << "Founder Value: Okay"
				resultset.Close() //free up and erase data.
				return 1

			else
				resultset.Close()
				if(debug) world << "Founder Value: Failed."
				return 0