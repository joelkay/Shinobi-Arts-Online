

proc
	RetrievePage(page,type)
		switch(type)
			if("hub fans","fans") page = "http://byond.com/hub/[page]&command=view_fans"
			if("hub id","id", null) page = "http://byond.com/hub/[page]"
			if("member title","mtitle") page = "http://www.byond.com/members/?command=pager_popup_ajax&key=[page]"
			if("byond","byond games","byond players") page = "http://www.byond.com"
			if("text")  page = "http://byond.com/hub/[page]?format=text"
		var/list/http[]=world.Export(page)
		if(!http)
			CRASH("FAIL RETRIEVING [type] @ PAGE [page]")
		return file2text(http["CONTENT"])

	getHubID(hub)
		var
			p = RetrievePage(hub,"hub id")
			begin= findtext(p,"hub_attachment_")
		if(!begin)
			return
		var
			end = findtext(p,"{",begin)
			pid = copytext(p,begin+15,end-1)
		return pid

	getFans(hub)
		var/p = RetrievePage(hub,"hub fans")
		. = list()
		if(!findtext(p,"guild_member_list"))
			return
		var/pfans = copytext(p,findtext(p,"guild_member_list")+30, findtext(p,"bottom_space"))
		while(findtext(pfans,"\">"))
			var
				a = findtext(pfans, "\">")
				keyg
				m
			if(findtext(copytext(pfans, a, a+6), "<img"))
				pfans = copytext(pfans, a+9)
				a = findtext(pfans, "\">")
				m = 1
			var/b = findtext(pfans, "</a>", a)
			keyg = copytext(pfans, a+2, b)
			pfans = copytext(pfans, b+3)
			.[keyg] = (m? "MEMBER" : )

	getUserTitle(member)
		var/p = RetrievePage(member,"member title")
		if(!findtextEx(p, "user_info_table"))
			return
		var/ptitle = copytext(p, findtext(p, "\">", findtext(p,"?recipient"))+2, findtext(p, "</a></div>"))
		return ptitle

	getGamesLive()
		var/p = RetrievePage(,"byond games")
		var/a = copytext(p, findtext(p, "sort=live", findtext(p, "live_info\" "))+11, findtext(p, "Games Live")-1)
		return  a

	getPlayersOnline()
		var/p = RetrievePage(,"byond players")
		var/a = copytext(p, findtext(p, "live_info\">")+17, findtext(p, "People Online")-1)
		return a

	getImage(link)
		var/img[] = world.Export(link)
		if(findtext(img["CONTENT-TYPE"],"image"))
			return img["CONTENT"]
