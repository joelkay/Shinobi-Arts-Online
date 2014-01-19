mob/var/popupvalue=0
mob/var/popupcomplete=0//initiation purposes
mob/var/tmp/list/temp[50]
mob/var/tmp/windows=0



mob/proc/CreatePopup(var/type,var/msg,var/mob/Face)

	windows++//allow multi popups

	var/client/user = src.client
	client.UpdateResolution()

	var/Window/w = new
	w.user = user
	w.user.UpdateResolution()
	w.name = "Apopup[windows]"
	w.w="352"; w.h="150"
	w.x="[round((w.user.scrwidth/2)-158,1)]"
	w.y="[round((w.user.scrheight/2)-30,1)]"

	w.alpha=255
	w.can_minimize="false"
	w.can_resize="false"
	w.titlebar="false"
	w.is_pane="true"
	w.background_color="#808041"
	w.is_transparent="true"
	w.transparent_color="#808041"
	w.Create()
	w.Update()

	var/Label/H = new(client, "popup-title[windows]", "Apopup[windows]")
	H.setBounds(0,0,352,16)
	H.is_visible = "true"
	H.background_color="#808040"
	H.border = "sunken"
	H.image="\ref['title - chat.png']"
	H.anchor1 = "0,0"
	H.anchor2 = "100,11"
	H.parentobj = w
	w.Controls.Add(H)

	if(Face)
		var/iconName = "popup[ckey(Face.name)]_flattened.dmi"
		// Copy the file to the rsc manually
		var/icon/b = fcopy_rsc(getFlatIcon(Face))
		// Send the icon to src's local cache
		src<<browse_rsc(b, iconName)

		var/Label/f = new(client, "popup-faceicon[windows]", "Apopup[windows]")
		f.setBounds(0,16,56,108)
		f.is_visible = "true"
		f.background_color="#808040"
		f.image="\ref[b]"
		f.border = "sunken"
		f.anchor1 = "0,11"
		f.anchor2 = "16,83"
		f.parentobj = w
		w.Controls.Add(f)

		var/Label/l = new(client, "popup-label[windows]", "Apopup[windows]")
		l.setBounds(56,16,300,108)
		l.is_visible = "true"
		l.background_color="#808040"
		l.text=msg
		l.text_wrap="true"
		l.border = "sunken"
		l.anchor1 = "16,11"
		l.anchor2 = "100,83"
		l.parentobj = w
		w.Controls.Add(l)

	else

		var/Label/l = new(client, "popup-label[windows]", "Apopup[windows]")
		l.setBounds(0,16,352,108)
		l.is_visible = "true"
		l.background_color="#808040"
		l.text=msg
		l.text_wrap="true"
		l.border = "sunken"
		l.anchor1 = "0,11"
		l.anchor2 = "100,83"
		l.parentobj = w
		w.Controls.Add(l)


	switch(type)
		if(1)//yes or no
			var/Button/i = new(client, "popup-yes[windows]", "Apopup[windows]")
			i.setBounds(19,127,53,23)
			i.is_visible = "true"
			i.background_color="#808040"
			i.text="Yes"
			i.command="yesApopup"
			i.border = "sunken"
			i.anchor1 = "5,85"
			i.anchor2 = "20,100"
			i.parentobj = w
			w.Controls.Add(i)

			var/Button/k = new(client, "popup-no[windows]", "Apopup[windows]")
			k.setBounds(289,127,52,22)
			k.is_visible = "true"
			k.background_color="#808040"
			k.text="No"
			k.command="noApopup"
			k.border = "sunken"
			k.anchor1 = "82,85"
			k.anchor2 = "97,100"
			k.parentobj = w
			w.Controls.Add(k)

		else

			var/Button/j = new(client, "popup-ok[windows]", "Apopup[windows]")
			j.setBounds(153,127,51,23)
			j.is_visible = "true"
			j.background_color="#808040"
			j.text="OK"
			j.command="okApopup"
			j.border = "sunken"
			j.anchor1 = "43,85"
			j.anchor2 = "58,100"
			j.parentobj = w
			w.Controls.Add(j)



	w.Update()
	temp[windows]=w



mob/verb/toggleApopup()
	set hidden=1
	toggleApop()



mob/proc/toggleApop()
	if(!popupcomplete)//havent completed the popup yet
		popupcomplete=1
		if(windows>0)
			var/Window/tempr = temp[windows]
			tempr.Remove()
			windows--
			return

	else
		if(windows>0)
			var/Window/tempr = temp[windows]
			tempr.Remove()
			windows--
			return



proc/Apopup(mob/M, msg as text, yesno=0, mob/Face) // caller: text: type: icon
	if(!M)return
	M.popupcomplete=0
	M.CreatePopup(yesno,msg,Face)

	while(M&&!M.popupcomplete)
		sleep(5)//wait for answer

	return M.popupvalue//the value it gives



mob/verb/okApopup()//when you press OK
	set hidden=1
	toggleApop()
	popupvalue=1

mob/verb/yesApopup()//when you press Yes
	set hidden=1
	toggleApop()
	popupvalue=1


mob/verb/noApopup()//when you press No
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

