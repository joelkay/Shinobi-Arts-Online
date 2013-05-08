proc
	CheckTime(mob/M)//searches the database for a certain name, returns 1 if it finds it, 0 if it doenst.
		set background=1
		var/dbConnection/connector = new()
		var/dbconnection=connector.getConnection(connector.getDbi())

		if(dbconnection)
			var/DBQuery/resultset = connector.runQuery(dbconnection,"SELECT timesaved FROM `saves` WHERE `name` = '[M.name]'")
			if(resultset.RowCount() > 0)
				while(resultset.NextRow())

					var/list/row_data = resultset.GetRowData()

					for(var/D in row_data)

						if(D=="timesaved")
							var/timeplayed=text2num(row_data[D])

							if(debug)M<<"value: [timeplayed]"

							M.sqlversion=timeplayed



			else
				if(resultset) resultset.Close();
				if(debug) M << "No Results for [M.name].";
				return 0
		else
			src << "Connection Failed.";
			return 0