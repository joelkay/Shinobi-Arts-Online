mob
	verb

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
			var/filelist = flist("SAO_HOST_FILES/Playersnew/")
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
			var/C = "SAO_HOST_FILES/Playersnew/"
			fcopy(C,"SAO_HOST_FILES/Playersnew_backup/")
			src<<"\[[time2text(,"Month DD, YYYY hh:mm:ss")]\] All savefiles have been backed up!"


		Wipe_Savefiles()
			set category = "Saves"
			switch(alert("Do you want to delete every savefile on the data server?","","Yes","No"))
				if("Yes")
					fdel("SAO_HOST_FILES/Playersnew/")
					src<<"\[[time2text(,"Month DD, YYYY hh:mm:ss")]\] All savefiles have been wiped!"
				else
					return

		Wipe_Backup_Savefiles()
			set category = "Saves"
			switch(alert("Do you want to delete every backup savefile on the server? You might need to use these as backups","","Yes","No"))
				if("Yes")
					fdel("SAO_HOST_FILES/Playersnew_backup/")
					src<<"\[[time2text(,"Month DD, YYYY hh:mm:ss")]\] All backup savefiles have been wiped!"
				else
					return

		Load_Backups()
			set category = "Saves"
			switch(alert("Do you want to loadup backups? This may cause a rollback","","Yes","No"))
				if("Yes")
					fdel("SAO_HOST_FILES/Playersnew/")
					sleep(20)
					var/C = "SAO_HOST_FILES/Playersnew_backup/"
					fcopy(C,"SAO_HOST_FILES/Playersnew/")
					src<<"\[[time2text(,"Month DD, YYYY hh:mm:ss")]\] All backup files have been loaded!"
				else
					return

		Delete_Savefile()
			set category = "Saves"
			var/filelist = flist("SAO_HOST_FILES/Playersnew/")
			if(length(filelist) == 0)
				src<<"<font color = red>There are no savefiles on the data server!</font>"
			var/delete = input("Whose savefile do you wish to delete?") in filelist + list("Cancel")
			if(delete == "Cancel") return
			else
				src<<"\[[time2text(,"Month DD, YYYY hh:mm:ss")]\] [delete] has been removed from the Data server"

				fdel("SAO_HOST_FILES/Playersnew/[delete]")