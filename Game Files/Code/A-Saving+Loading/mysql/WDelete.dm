//this is for deleting files from the server
/*
DELETE FROM Customers
WHERE CustomerName='Alfreds Futterkiste' AND ContactName='Maria Anders'


proc/delete_playersave_table()
	set background=1

	var/dbConnection/connector = new()
	var/dbconnection=connector.getConnection(connector.getDbi())

	if(dbconnection)
		var/DBQuery/resultset1 = connector.runQuery(dbconnection,"CREATE TABLE saves( ckey VARCHAR(30),name VARCHAR(30),PRIMARY KEY(ckey,name))")
		if(resultset1)
			if(debug) world<<"Phase 1 complete"
			resultset1.Close(); //free up and erase data.
		else
			if(!resultset1)
				resultset1.Close();
				if(debug) world<< "Phase 1 Failed."


		var/DBQuery/resultset2 = connector.runQuery(dbconnection,SQLQuery)
		if(resultset2)
			if(debug) world<< "Phase 2 complete"
			resultset2.Close() //free up and erase data.

			create_list_table()// create list table
		else
			resultset2.Close()
			if(debug) world<< "Failed."

*/