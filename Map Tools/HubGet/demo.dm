
mob/verb
	Show_Fans(hub as text)
		var/list/fans = getFans(hub)
		src << "These are the fans of [hub]."
		for(var/x in fans)
			src << "[x]" + ((fans[x]=="MEMBER")? " (MEMBER)" : "")
		src << "There are [fans.len] fans."

	Show_HubID(hub as text)
		src << "[hub]'s ID is : [getHubID(hub)]"

	Show_User_Title(member as text)
		src << "[member]'s BYOND title is: [getUserTitle(member)]"

	Show_Games_Live()
		src << "There are [getGamesLive()] games live on BYOND!"

	Show_Players_Online()
		src << "There are [getPlayersOnline()] players online on BYOND!"

	Show_Image(msg as text)
		src << "[msg] -> \..."
		src << getImage(msg)
