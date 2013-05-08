mob/var/popupvalue=0
mob/var/popupcomplete=1//initiation purposes

mob/verb/toggleApopup()
	set hidden=1
	toggleApop()

mob/proc/toggleApop()
	if(popupcomplete)
		winset(src,null,{"
		Apopup.is-visible = "true";
		"})
		popupcomplete=0//havent completed the popup
		popupvalue=0//default no answer

	else
		winset(src,null,{"
		Apopup.is-visible = "false";
		Apopup.popup-yes.is-visible = "false";
		Apopup.popup-no.is-visible = "false";
		Apopup.popup-ok.is-visible = "false";
		"})
		popupcomplete=1//completed the popup


proc/Apopup(mob/M,msg as text,yesno=0)//caller/text/yes or no
	if(!M)return
	M.toggleApop()
	if(!yesno)//generic
		winset(M,null,{"
		Apopup.popup-ok.is-visible = "true";
		Apopup.popup-text.text = "[msg]";
		"})

	else
		winset(M,null,{"
		Apopup.popup-yes.is-visible = "true";
		Apopup.popup-no.is-visible = "true";
		Apopup.popup-text.text = "[msg]";
		"})
		while(M&&!M.popupcomplete)
			sleep(5)//wait for answer

		return M.popupvalue//the value it gives



mob/verb/yesApopup()//caller/text/yes or no
	set hidden=1
	toggleApop()
	popupvalue=1


mob/verb/noApopup()//caller/text/yes or no
	set hidden=1
	toggleApop()
	popupvalue=0




///////////////////////////Examples
/*
Apopup(src,text)//generic text

ans=Apopup(src,text,1)
if(ans)//then its a yes
if(!ans)//then its a no

mob
	verb
		testpopup()
			var/ans=Apopup(src,"Yo",1)
			if(ans)//then its a yes
				src<<"1"
			if(!ans)//then its a no
				src<<"0"

*/
