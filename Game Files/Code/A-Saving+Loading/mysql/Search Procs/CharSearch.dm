proc
	CharSearch(var/txt)//searches the database for a certain name, returns 1 if it finds it, 0 if it doenst.
		set background=1
		var/dbConnection/connector = new()
		var/dbconnection=connector.getConnection(connector.getDbi())

		if(dbconnection)
			var/DBQuery/resultset = connector.runQuery(dbconnection,"SELECT name FROM `saves` WHERE `name` = '[txt]'")

			if(resultset.RowCount() > 0)
				if(debug)	src << "Found Results for [txt].";
				resultset.Close(); //free up and erase data.
				return 1

			else
				if(resultset) resultset.Close();
				if(debug) src << "No Results for [txt].";
				return 0
		else
			src << "Connection Failed.";
			return 0