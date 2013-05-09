mob
	var/tmp/list/followers=list()
	var/tmp/mapmode=1
	verb
		load()
			set hidden=1
			var/name
			name=input(src,"name","Enter Name of Map to Load")
			world<<"loading [name]"
			src.map = SwapMaps_Load("Maps/[name]")
			if(!src.map)
				world<<"[name] not found"
				return
			var/swapmap/M=src.map
			M.BuildRectangle(locate(M.x1,M.y1,M.z1),locate(M.x2,M.y2,M.z1),/turf/mapborder)
			src.loc = locate(M.x1+1,M.y1+1,M.z1) //locate them.
			mname=name
			winset(src,null,{"
			default.is-maximized="true";
			fulls.is-disabled="false";
			televerbs.is-disabled="false";
			commandz.is-disabled="false";
			defaulta.default_main.left = "mapbox";
			defaulta.default_right.left = "childright";
			defaulta.default_top.left = "childtop";
			childtop.label2.text = "[mname]";
			childtop.label5.text = "[current]";
			"})
			src.client.Resolution()
			src.mapmode=1
			for(var/mob/D in src.followers)
				D.loc=src.loc
			world<<"[mname] loaded"




mob
	var/markers=1
	verb
		togglemarkersave()
			set hidden=1
			if(markers)
				markers=0
				return
			else
				markers=1

		savemapp()
			set hidden=1
			if(gridon)
				gridon=1//stop them accidentaly putting it on
				src<<"removing the grid for you"
				for(var/area/mapgrid/M in world)
					del(M)
				winset(src,null,{"
				childtop.mapgrid.text = "Off";
				"})

			if(markers)
				src<<"removing teleport points"
				for(var/mob/telemarker/T in world)
					del(T)

			switch(src.mapmode)
				if(1)
					src.map.Save()
					world<<"[mname] saved"
					gridon=0//they can put it back now
				if(2)
					src.savemap()
					world<<"player house saved"
					gridon=0//they can put it back now


mob
	verb
		send(mob/m in view(src),F as file)//send the map between ppls
			set category = null
			switch(alert(m,"[src] is trying to send you [F].  Do you accept the file?","**File Transfer**","Yes","No"))
				if("Yes")
					alert(src,"[m] accepted the file","**File Accepted**")
					m<<ftp(F)
				if("No")
					alert(src,"[m] declined the file","**File Declined**")


		join()
			set hidden=1
			var/mob/m=HOST
			if(!m)
				alert(src,"wait for the host to get on and load a map")
				return
			src.map = m.map
			src.loc = locate(m.x,m.y,m.z) //locate them.
			winset(src,null,{"
			winset(src,null,{"
			default.is-maximized="true";
			fulls.is-disabled="false";
			televerbs.is-disabled="false";
			commandz.is-disabled="false";
			defaulta.default_main.left = "mapbox";
			defaulta.default_right.left = "childright";
			defaulta.default_top.left = "childtop";
			childtop.label2.text = "[mname]";
			childtop.label5.text = "[current]";

			"})
			m.followers+=src
			src.client.Resolution()


		reload()
			set hidden=1
			winset(src,null,{"
			defaulta.default_main.left = "load";
			defaulta.default_right.left = "load2";
			childtop.version.text = "SAO BUILD:v([version])";
			childtop.button1.is-visible = "true";
			childtop.button2.is-visible = "true";
			childtop.button3.is-visible = "true";
			childtop.ren.is-visible = "true";
			childtop.del.is-visible = "true";
			childtop.gridlabel.is-visible = "true";
			childtop.mapgrid.is-visible = "true";
			"})

		rename()
			set hidden=1
			if(!mname)return
			var/newname
			newname=input(src,"name","Enter a New Name for this Map.")
			var/z=SwapMaps_Find("Maps/[newname]")
			if(z)
				switch(alert(src,"[newname] already exists continue.","Replace","Yes","No"))
					if("No")
						alert("aborted.")
						return
					else
						var/x=("Maps/[newname]")
						fdel(x)

			var/F=("Maps/[mname]")
			SwapMaps_DeleteFile(F)
			world<<"[mname] is being renamed to [newname]"
			src.map.SetID("Maps/[newname]")
			src.map.Save()
			mname=newname

			winset(src,null,{"
			childtop.label2.text = "[mname]";
			childtop.label5.text = "[current]";
			"})

			for(var/mob/D in src.followers)
				D.loc=src.loc
				winset(D,null,{"
			childtop.label2.text = "[mname]";
			childtop.label5.text = "[current]";
			"})


		deelete()
			set hidden=1
			if(!mname)return
			var/F=("Maps/[mname]")
			SwapMaps_DeleteFile(F)
			world<<"Deleted [mname]"
			mname="none"
			winset(src,null,{"
			defaulta.default_main.left = "load";
			defaulta.default_right.left = "load2";
			childtop.version.text = "SAO BUILD:v([version])";
			childtop.button1.is-visible = "true";
			childtop.button2.is-visible = "true";
			childtop.button3.is-visible = "true";
			childtop.ren.is-visible = "true";
			childtop.del.is-visible = "true";
			childtop.gridlabel.is-visible = "true";
			childtop.mapgrid.is-visible = "true";
			childtop.label2.text = "[mname]";
			childtop.label5.text = "[current]";
			"})
			src.loc=null
			for(var/mob/D in src.followers)
				D.loc=src.loc
				winset(D,null,{"
			defaulta.default_main.left = "load3";
			defaulta.default_right.left = "load2";
			load3.hostname.text = "[Host]";
			load3.templatename.text = "[mname]";
			childtop.version.text = "SAO BUILD:v([version])";
			childtop.label2.text = "[mname]";
			childtop.label5.text = "[current]";
			"})


		ListMaps()
			set hidden = 1
			var/html = {"
<html>
<style type="text/css">
body
{
	background-color: #000000;
	color: #ffffff;
}
</style>"}
			var/filelist = flist("map_Maps/")
			if(length(filelist) != 0)
				html+="<font size = 6><font color=green><center>Maps</center></font><font size = 5><br>"
				html += "<center>"
				for(var/m in filelist)
					html+= m
					html+="<br>"
				html += "</center>"
			else
				html+="<center>No maps in the folder!</center>"
			src<<browse(html,"window=savefilelist;can_close=1;can_minimize=0;can_resize=0")



		ChangeIcon(arg as icon)
			set hidden=1
			src.icon = arg




