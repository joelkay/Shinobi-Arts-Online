mob/var/popupvalue=0
mob/var/popupcomplete=0//initiation purposes
mob/var/tmp/list/temp[50]
mob/var/tmp/windows=0


///////////////////////////Examples

mob
	verb
		BasicTest()
			set category="Apopup"
			Apopup(usr,"Hello, this is window:[windows+1]")//generic text


		YesNo()
			set category = "Apopup"
			var/ans=Apopup(src,"Yes or No?",1)

			if(ans)//then its a yes
				Apopup(src,"Yes")//generic text
			if(!ans)//then its a no
				Apopup(src,"No")//generic texta


		YesNotype2()
			set category = "Apopup"

			if(Apopup(src,"Yes or No?",1))
				Apopup(src,"Yes")//generic text

			else
				Apopup(src,"No")//generic text




//////////////////////////////////VERBS/Handling


mob/verb/toggleApopup()
	set hidden=1
	toggleApop()



mob/proc/toggleApop()
	if(!popupcomplete)//havent completed the popup yet
		popupcomplete=1
		if(windows>0)
			var/Window/tempr = temp[windows]
			tempr.Remove()
			world<<"Removed Window:[windows]"
			windows--
			return

	else
		if(windows>0)
			var/Window/tempr = temp[windows]
			tempr.Remove()
			world<<"Removed Window:[windows]"
			windows--
			return



proc/Apopup(mob/M, msg as text, yesno=0) // caller: text: type
	if(!M)return
	M.popupcomplete=0
	M.ApopupTest(yesno,msg)

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



////////////////////////////////DYNAMIC INTERFACE




mob/proc/ApopupTest(var/type,var/msg)

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
	w.Create()
	w.Update()

	var/Label/H = new(client, "popup-title[windows]", "Apopup[windows]")
	H.setBounds(0,0,352,16)
	H.is_visible = "true"
	H.border = "sunken"
	H.text="Apopup[windows]"
	H.anchor1 = "0,0"
	H.anchor2 = "100,11"
	H.parentobj = w
	w.Controls.Add(H)

	var/Label/l = new(client, "popup-label[windows]", "Apopup[windows]")
	l.setBounds(0,16,352,108)
	l.is_visible = "true"
	l.text=msg
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
			j.text="OK"
			j.command="okApopup"
			j.border = "sunken"
			j.anchor1 = "43,85"
			j.anchor2 = "58,100"
			j.parentobj = w
			w.Controls.Add(j)



	temp[windows]=w
	world<<"Windows:[windows],  temp[windows]=[w]"
	w.Update()









