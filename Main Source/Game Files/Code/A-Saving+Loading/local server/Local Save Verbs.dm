var/mainserver=1//Main
var/debugmode=0//to find bugs.
mob
	Login()
		..()
		if(src.key in Allowed)
			//for(var/mob/M in world)
				//if(M == src) continue
				//M<<"\[[time2text(,"Month DD, YYYY hh:mm:ss")]\] [src.key] Has logged into data Server"

			src<<"<center><font size = 3><font color = blue><b>Welcome to The data Server!</b></font></font></center>."
			if(world.port)
				src<<"<center>Server hosted at [world.address]:[world.port]</center>."
			else
				src<<"<center>Server hosted is currently not hosting</center>."



mob/Owner
	verb
		Host_Data_Server()
			set category = "Saves"
			if(!world.port)
				var/portnumber = input("Host Data server on what port?") as num|null
				world.OpenPort(portnumber)
				src<<"Data server now hosting on [world.port]</font>."
			else
				src<<"<font color = red>Data server is already hosting on port [world.port]!</font>."

		Stop_Hosting_Data_Server()
			set category = "Saves"
			if(world.port)
				world.OpenPort("none")
				src<<"Data server has stopped hosting."
			else
				src<<"<font color = red>Data server is already not hosting!</font>."

		Delete_Savefile()
			set category = "Saves"
			var/filelist = flist("Savefiles/")
			if(length(filelist) == 0)
				src<<"<font color = red>There are no savefiles on the data server!</font>."
			var/delete = input("Whose savefile do you wish to delete?") in filelist + list("Cancel")
			if(delete == "Cancel") return
			else
				src<<"\[[time2text(,"Month DD, YYYY hh:mm:ss")]\] [delete] has been removed from the Data server."

				fdel("Savefiles/[delete]")

		Change_Port()
			set category = "Saves"
			if(world.port)
				var/changeport = input("What do you want to change the port to?") as num
				world.OpenPort(changeport)
				src<<"The port has been changed to [world.port]."

		List_Savefiles()
			set category = "Saves"
			var/html = {"
<html>
<style type="text/css">
body
{
	background-color: #000000;
	color: #ffffff;
}
</style>"}
			var/filelist = flist("Savefiles/")
			if(length(filelist) != 0)
				html+="<font size = 6><center>Save Files</center></font><br>"
				html += "<center>"
				for(var/m in filelist)
					html+= m
					html+="<br>"
				html += "</center>"
			else
				html+="<center>No savefiles in data server!</center>"
			src<<browse(html,"window=savefilelist;can_close=1;can_minimize=0;can_resize=0")


		Back_Up_Savefiles()
			set category = "Saves"
			var/C = "Savefiles/"
			fcopy(C,"Savefiles_backup/")
			src<<"\[[time2text(,"Month DD, YYYY hh:mm:ss")]\] All savefiles have been backed up!."


		Wipe_Savefiles()
			set category = "Saves"
			switch(alert("Do you want to delete every savefile on the data server?","","Yes","No"))
				if("Yes")
					fdel("Savefiles/")
					src<<"\[[time2text(,"Month DD, YYYY hh:mm:ss")]\] All savefiles have been wiped!."
				else
					return

		Wipe_Backup_Savefiles()
			set category = "Saves"
			switch(alert("Do you want to delete every backup savefile on the server? You might need to use these as backups","","Yes","No"))
				if("Yes")
					fdel("Savefiles_backup/")
					src<<"\[[time2text(,"Month DD, YYYY hh:mm:ss")]\] All backup savefiles have been wiped!."
				else
					return

		Load_Backups()
			set category = "Saves"
			switch(alert("Do you want to loadup backups? This may cause a rollback","","Yes","No"))
				if("Yes")
					fdel("Savefiles/")
					sleep(20)
					var/C = "Savefiles_backup/"
					fcopy(C,"Savefiles/")
					src<<"\[[time2text(,"Month DD, YYYY hh:mm:ss")]\] All backup files have been loaded!."
				else
					return
		De_Bug_Saves()
			set category= "Saves"
			if(!debugmode)
				debugmode=1
				src<<"Debug mode turned on.."
				return
			else
				src<<"Debug mode turned off.."
				debugmode=0
