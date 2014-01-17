//EXPORT GUIDE TO MYSQL SERVER
var/debug=0// TURN THIS TO 1 TO SEE ERROR MESSAGES E.T.C



var// my server
	my_database = "zadmin_sao"//server database for SAO
	my_server = "162.243.0.54"
	server_port = 3306
	my_username = "joelkay"
	my_password = "manezypy2"
	local_server=1


world
	New()
		..()
		if(world.address==my_server)//dont change the main server
			world.log << text("The main server has been initiated")//private worlds
			local_server=1

		else
			world.log << text("A private server has been initiated")
			local_server=0






dbConnection
	proc
		getDbi(databasename = my_database ,serverip = my_server,serverport = server_port)
			set background=1
			//database name can also be refered to as
			//the schema or inital catalog - i use one named byond.

			//server ip can be a host name. Set for localhost, only change if remote.

			//serverport is 3306. No need to set this unless you changed.

			var/dbi = "dbi:mysql:[databasename]:[serverip]:[serverport]"
			return dbi



		getConnection(dbi,username = my_username,password = my_password) //returns the connection or null.
			set background=1
			//world<<"[dbi],[username],[password]"

			var/DBConnection/dbcon = new()  //This is an instance of a connection object.
			                                         //See db.html for more info on callable functions
			dbcon.Connect(dbi,username,password)
			if(dbcon.IsConnected())

				if(debug)world.log << text("Connected to mysql using the dbi [].</font>",dbi)
				return dbcon

			//add logging here

			world.log << text("The connection to mysql failed using the dbi [].\n\nError Text: []</font>",dbi,dbcon.ErrorMsg())//need these for debugz
			return null


		runQuery(DBConnection/dbcon,querytext = null) //returns the set or null
			set background=1
			if(dbcon != null && dbcon.IsConnected() && querytext !=null) //check if we are connected, and if the query is not empty.

				//var/sanitised=dbcon.Quote(querytext)
				var/DBQuery/query = dbcon.NewQuery(querytext)
				//sanitise the query and pass it through
				if(debug) world<<"[querytext]"
				query.Execute()
				return query

			world.log << text("The mysql query has failed.\n\nError Text: []</font>",dbcon.ErrorMsg())//need these for debugz
			return null



/////////////////////////////////////////TABLE HANDLING PROCS////////////////////////////////

proc/view_save_table()
	var/dbConnection/connector = new()
	var/dbconnection=connector.getConnection(connector.getDbi())

	if(dbconnection)
		var/DBQuery/resultset = connector.runQuery(dbconnection,"SELECT * FROM `savesettings`")
		if(resultset.RowCount() > 0)
			while(resultset.NextRow())
				var/list/row_data = resultset.GetRowData()
				for(var/D in row_data)
					usr << "[D] = [row_data[D]]"

			resultset.Close(); //free up and erase data.


		else
			if(resultset) resultset.Close();
			if(debug) world<< "No Results.";





proc/delete_save_tables()
	var/dbConnection/connector = new()
	var/dbconnection=connector.getConnection(connector.getDbi())


	if(dbconnection)
		var/DBQuery/resultset = connector.runQuery(dbconnection,"DROP TABLE saves")
		if(resultset)
			if(debug) world<< "Done"

			resultset.Close(); //free up and erase data.

		else
			if(!resultset)
				resultset.Close();
				if(debug) world<< "Failed.";


		var/DBQuery/resultset2 = connector.runQuery(dbconnection,"DROP TABLE savesettings")
		if(resultset2)
			if(debug) world<< "Done"

			resultset2.Close(); //free up and erase data.

		else
			if(!resultset2)
				resultset2.Close();
				if(debug) world<< "Failed.";


		var/DBQuery/resultset3 = connector.runQuery(dbconnection,"DROP TABLE items")
		if(resultset3)
			if(debug) world<< "Done"

			resultset3.Close(); //free up and erase data.

		else
			if(!resultset3)
				resultset3.Close();
				if(debug) world<< "Failed.";


		var/DBQuery/resultset4 = connector.runQuery(dbconnection,"DROP TABLE macro")
		if(resultset4)
			if(debug) world<< "Done"

			resultset4.Close(); //free up and erase data.

		else
			if(!resultset4)
				resultset4.Close();
				if(debug) world<< "Failed.";



		var/DBQuery/resultset6 = connector.runQuery(dbconnection,"DROP TABLE savedweapons")
		if(resultset6)
			if(debug) world<< "Done"

			resultset6.Close(); //free up and erase data.

		else
			if(!resultset6)
				resultset6.Close();
				if(debug) world<< "Failed.";


		var/DBQuery/resultset7 = connector.runQuery(dbconnection,"DROP TABLE savedskills")
		if(resultset7)
			if(debug) world<< "Done"

			resultset7.Close(); //free up and erase data.

		else
			if(!resultset7)
				resultset7.Close();
				if(debug) world<< "Failed.";



proc/create_save_table()
	set background=1
	var/SQLQuery
	SQLQuery+="ALTER TABLE saves ADD ("
	SQLQuery+="last_x VARCHAR(30), last_y VARCHAR(30), last_z VARCHAR(30), rpgname VARCHAR(30), namefirst VARCHAR(30), versionplayed VARCHAR(30), teamname VARCHAR(30)"
	SQLQuery+=",health VARCHAR(30), max_health VARCHAR(30), chakra VARCHAR(30), max_chakra VARCHAR(30), energy VARCHAR(30), max_energy VARCHAR(30)"
	SQLQuery+=",pk VARCHAR(30), bingo VARCHAR(30), life VARCHAR(30), max_life VARCHAR(30), exp VARCHAR(30), maxexp VARCHAR(30)"
	SQLQuery+=",blevel INT(10), contribution VARCHAR(30), attribute_Points VARCHAR(30), supplies VARCHAR(30), killmedalset VARCHAR(30)"
	SQLQuery+=",dummy VARCHAR(30), allowedswitch VARCHAR(30), resistance VARCHAR(30), resistancemain VARCHAR(30), chakraforce VARCHAR(30)"
	SQLQuery+=",chakraforcemain VARCHAR(30), agility VARCHAR(30), agilitymain VARCHAR(30) , dexterity VARCHAR(30), dexteritymain VARCHAR(30)"
	SQLQuery+=",reflex VARCHAR(30), reflexmain VARCHAR(30), strength VARCHAR(30), strengthmain VARCHAR(30), attackrate VARCHAR(30)"
	SQLQuery+=",dizzyrate VARCHAR(30), totaltime VARCHAR(30), timesaved INT(30), Savedx VARCHAR(30), Savedy VARCHAR(30), Savedz VARCHAR(30), kills INT(10)"
	SQLQuery+=",deaths INT(10), rank VARCHAR(30), money VARCHAR(30), Chuunreset VARCHAR(30),LeafS VARCHAR(30), MistS VARCHAR(30), SandS VARCHAR(30)"
	SQLQuery+=",missingS VARCHAR(30), villagedone VARCHAR(30), Village VARCHAR(30), baseVillage VARCHAR(30), faction VARCHAR(30), Clan VARCHAR(30), Clany VARCHAR(30)"
	SQLQuery+=",oldx VARCHAR(30), oldy VARCHAR(30), oldz VARCHAR(30), clicker VARCHAR(30), style VARCHAR(30), mute VARCHAR(30), tempmute VARCHAR(30)"
	SQLQuery+=",talkcool VARCHAR(30), talktimes VARCHAR(30), talkcooling VARCHAR(30), weaponinv VARCHAR(30), armorinv VARCHAR(30), legarmorinv VARCHAR(30)"
	SQLQuery+=",armarmorinv VARCHAR(30), facearmorinv VARCHAR(30), cloakinv VARCHAR(30), shoesinv VARCHAR(30), specialinv VARCHAR(30)"
	SQLQuery+=",hair_type VARCHAR(30), hair_red VARCHAR(30), hair_green VARCHAR(30), hair_blue VARCHAR(30), hair_color VARCHAR(30)"
	SQLQuery+=",eye_r VARCHAR(30), eye_g VARCHAR(30), eye_b VARCHAR(30), warkills VARCHAR(30), lee VARCHAR(30)"
	SQLQuery+=",cantsave VARCHAR(30), npcd VARCHAR(30),  pointsg VARCHAR(30), icon_name VARCHAR(30), factionll VARCHAR(30)"
	SQLQuery+=",kage VARCHAR(30), Orbshow VARCHAR(30), medpassive VARCHAR(30), strpoints VARCHAR(30), rfxpoints VARCHAR(30), intpoints VARCHAR(30)"
	SQLQuery+=",conpoints VARCHAR(30), conr VARCHAR(30), medr VARCHAR(30), strr VARCHAR(30), GM VARCHAR(30))"

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




proc/create_list_table()
	set background=1
	create_items_table()
	create_macro_table()
	create_settings_table()
	create_skillsave_table()
	create_weaponsave_table()




proc/create_skillsave_table()
	set background=1
	//slist is a list of all skills in the game

	var/dbConnection/connector = new()
	var/dbconnection=connector.getConnection(connector.getDbi())

	if(dbconnection)
		var/DBQuery/resultset = connector.runQuery(dbconnection,"CREATE TABLE savedskills (skillid VARCHAR(60),Playername VARCHAR(20),Skillname VARCHAR(30),level INT(10),uses INT(10),kills INT(10),PRIMARY KEY(skillid) )")
		if(resultset)
			if(debug) world << "Skills Table Okay"
		else
			resultset.Close()
			if(debug) world << "Failed."



proc/create_weaponsave_table()
	set background=1
	//slist is a list of all skills in the game

	var/dbConnection/connector = new()
	var/dbconnection=connector.getConnection(connector.getDbi())

	if(dbconnection)
		var/DBQuery/resultset = connector.runQuery(dbconnection,"CREATE TABLE savedweapons (skillid VARCHAR(60),Playername VARCHAR(20),Skillname VARCHAR(30),level INT(10),uses INT(10),kills INT(10),PRIMARY KEY(skillid) )")
		if(resultset)
			if(debug) world << "Weapons Table Okay"
		else
			resultset.Close()
			if(debug) world << "Failed."


proc/create_items_table()//weapons table
	set background=1
	//slist is a list of all skills in the game
	var/list/items=initiateilist()//make sure
	var/i=1
	var/SQLQuery
	SQLQuery+="ALTER TABLE items ADD ("
	while(i<=items.len)//1 - 55 jutsu in the game
		var/obj/items/J = items[i]
		sleep(1)
		if(J)
			SQLQuery+="[J.listid] INT(10)"// its 1 or 0
			if(i<items.len)SQLQuery+=","//making sure to put a comma beside all values, minus the last one
			if(debug) world << "Item(A)[i]:[J] Okay"
		i++//continue looping
	SQLQuery+=")"

	var/dbConnection/connector = new()
	var/dbconnection=connector.getConnection(connector.getDbi())

	if(dbconnection)
		var/DBQuery/resultset = connector.runQuery(dbconnection,"CREATE TABLE items (Playername VARCHAR(30), PRIMARY KEY(Playername))")
		if(resultset)
			if(debug) world << "Items Table Okay"
		else
			resultset.Close()
			if(debug) world << "Failed."

		var/DBQuery/resultset2 = connector.runQuery(dbconnection,SQLQuery)
		if(resultset2)
			if(debug) world << "Phase2: Okay"
			resultset2.Close() //free up and erase data.
		else
			resultset2.Close()
			if(debug) world << "Failed."


proc/create_macro_table()
	set background=1
	var/dbConnection/connector = new()
	var/dbconnection=connector.getConnection(connector.getDbi())

	if(dbconnection)
		var/DBQuery/resultset = connector.runQuery(dbconnection,"CREATE TABLE macro (Playername VARCHAR(30), PRIMARY KEY(Playername))")//incase we use join later on
		if(resultset)
			if(debug) world << "GuideID Okay"
		else
			resultset.Close()
			if(debug) world << "Failed."

		var/SQLQuery
		SQLQuery+="ALTER TABLE macro ADD ("
		var/i=0
		while(i<11)// go through each macro slot
			sleep(2)
			i++
			SQLQuery+="macro[i] VARCHAR(30)"//store the macro
			if(i<11)SQLQuery+=","//making sure to put a comma beside all values, minus the last one
			if(debug) world << "macro[i] Okay"

		SQLQuery+=")"

		var/DBQuery/resultset2 = connector.runQuery(dbconnection,SQLQuery)
		if(resultset2)
			if(debug) src << "Phase2: Okay"
			resultset2.Close() //free up and erase data.
		else
			resultset2.Close()
			if(debug) src << "Failed."



proc/create_settings_table()
	set background=1
	var/dbConnection/connector = new()
	var/dbconnection=connector.getConnection(connector.getDbi())

	if(dbconnection)
		var/DBQuery/resultset = connector.runQuery(dbconnection,"CREATE TABLE savesettings (ckey VARCHAR(30),slot1char VARCHAR(30),slot2char VARCHAR(30),slot3char VARCHAR(30),loggedin INT(10),Kage VARCHAR(30),GM INT(10),Founder INT(10),PRIMARY KEY(ckey))")//incase we use join later on
		if(resultset)
			if(debug) world << "Save Settings Okay"
		else
			resultset.Close()
			if(debug) world << "Failed."


