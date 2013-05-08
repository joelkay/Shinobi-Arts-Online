mob/Owner
	verb

		RebuildSQLTables()
			set category= "SQL"
			delete_save_tables()
			create_save_table()

		Debug()
			set category= "SQL"
			if(debug)
				debug=0
				src<<"Debug turned off"
			else
				debug=1
				src<<"Debug turned on"

		SaveinSQL()
			set category= "SQL"
			var/mob/M=src
			M.last_x=src.x
			M.last_y=src.y
			M.last_z=src.z
			SaveSQL(M)


		LoadinSQL()//inco-porate this
			set category= "SQL"
			LoadSQL(src)
