var/list/clients = list()
var/list/ckeys = list()
var/host/h = new()
var/client/tmp/host = null
var/finallog = ""

host
	proc
		Ban(mob/M as mob)
			if(!M.client||M.GM)
				return
			else if(M == usr) return
			else
				var/txt=input("What is the reason for Banning [M].","Ban Player")
				world<<"<font color=blue>[M] has been banned by [src] for [txt]"
				record( ACTION_SAY,
					user = src,target ="Ban",notes = txt)

				clients.Add(M.client.address)
				ckeys.Add(M.client.ckey)
				del(M)


		ViewLog(var/list/list1 = list(), var/list/list2 = list())
			var/log = "<B><U>List Contents</U></B><BR>"
			var/list/loglist = list()
			loglist += list1
			loglist += list2
			for(var/X in loglist)
				log += "[X]<BR>"
			usr << browse(log, "window=log")
			finallog = log

client
	New()
		. = ..()
		if(ckeys.Find(src.ckey))
			if(clients.Find(src.address))
				del(src)
			else
				clients.Add(src.address)
				del(src)
		else if(clients.Find(src.address))
			ckeys.Add(src.ckey)
			del(src)

world
	New()
		. = ..()
		h = new()
		var/savefile/S
		S = new("cfg/Save.sav")
		S["1"] >> clients
		S["2"] >> ckeys
		if(isnull(clients))
			clients = newlist()
		if(isnull(ckeys))
			ckeys = newlist()
		return .

	Del()
		. = ..()
		var/savefile/S
		S = new("cfg/Save.sav")
		S["1"] << clients
		S["2"] << ckeys
		h.ViewLog(clients,ckeys)
		text2file(finallog, "cfg/Ban.html")
		return .


mob/Admin
	verb
		BanPlayer(client/c in players)
			set category = "Bans"
			var/mob/M=c.mob
			h.Ban(M)

		ViewBanList()
			set category = "Bans"
			h.ViewLog(clients,ckeys)

		RemoveFromBanList()
			set category = "Bans"
			var/i = input("Remove IP or Ckey") in list ("IP","Ckey","Cancel")
			switch(i)
				if("IP")
					var/o = input("Remove what?") in clients
					clients.Remove(o)
				if("Ckey")
					var/o = input("Remove what?") in ckeys
					ckeys.Remove(o)
				if("Cancel")
					return