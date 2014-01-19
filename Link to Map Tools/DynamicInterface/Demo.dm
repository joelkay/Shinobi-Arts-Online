#define DEBUG
mob/verb/ApopupTest()
	var/client/user = src.client
	client.UpdateResolution()

	var/Window/w = new
	w.user = user
	w.user.UpdateResolution()
	w.name = "Apopup"
	w.w="352"; w.h="150"
	w.x="[round((w.user.scrwidth/2)-158,1)]"
	w.y="[round((w.user.scrheight/2)-30,1)]"

	w.alpha=255
	w.can_minimize="false"
	w.can_resize="false"
	w.titlebar="false"
	w.Create()
	w.Update()

	var/Label/H = new(client, "popup-title", "Apopup")
	H.setBounds(0,0,352,16)
	H.is_visible = "true"
	H.border = "sunken"
	H.image="popuptitle.png"
	H.text="Shinobi Arts Online"
	H.anchor1 = "0,0"
	H.anchor2 = "100,11"
	H.parentobj = w
	w.Controls.Add(H)

	var/Label/l = new(client, "popup-label", "Apopup")
	l.setBounds(0,16,352,108)
	l.is_visible = "true"
	l.text="Text"
	l.border = "sunken"
	l.anchor1 = "0,11"
	l.anchor2 = "100,83"
	l.parentobj = w
	w.Controls.Add(l)

	var/Button/i = new(client, "popup-yes", "Apopup")
	i.setBounds(19,127,53,23)
	i.is_visible = "true"
	i.text="Yes"
	i.border = "sunken"
	i.anchor1 = "5,85"
	i.anchor2 = "20,100"
	i.parentobj = w
	w.Controls.Add(i)

	var/Button/j = new(client, "popup-ok", "Apopup")
	j.setBounds(153,127,51,23)
	j.is_visible = "true"
	j.text="OK"
	j.border = "sunken"
	j.anchor1 = "43,85"
	j.anchor2 = "58,100"
	j.parentobj = w
	w.Controls.Add(j)

	var/Button/k = new(client, "popup-no", "Apopup")
	k.setBounds(289,127,52,22)
	k.is_visible = "true"
	k.text="No"
	k.border = "sunken"
	k.anchor1 = "82,85"
	k.anchor2 = "97,100"
	k.parentobj = w
	w.Controls.Add(k)

	w.Update()



mob/verb/ProgressWindowTest()
	var/client/user = src.client
	client.UpdateResolution()

	var/Window/w = new
	w.user = user
	w.user.UpdateResolution()
	w.name = "progressbarwindow"
	w.w="316"; w.h="60"
	w.x="[round((w.user.scrwidth/2)-158,1)]"
	w.y="[round((w.user.scrheight/2)-30,1)]"
	w.Create()
	w.Update()

	sleep(1)

	var/Bar/b = new
	b.user = user
	b.name = "progressbar"
	b.parent = "progressbarwindow"
	b.setBounds(10,40,296,10)
	b.value = "0"
	b.bar_color = "#0000FF"
	b.border = "sunken"
	w.Controls.Add(b)

	var/Label/l = new
	l.user = user
	l.name = "progresslabel"
	l.parent = "progressbarwindow"
	l.setBounds(10,10,296,20)
	l.text = "Progress: 0% Complete"
	w.Controls.Add(l)

	w.Update()

	for(var/i = 0, i <= 100, i++)
		sleep(0.1)
		b.value = i
		l.text = "Progress: [i]% Complete"
		w.title = "Progress: [i]% Complete"
		w.Update()

	for(var/i = 50, i > 0, i--)
		sleep(1)
		l.text = "Progress: 100% Complete. Closing in [i/10] seconds"
		w.Update()

	w.Remove()

mob/verb/TestResolutionUpdate()
	client.UpdateResolution(1)
	src<<"W:[client.scrwidth], H:[client.scrheight]"

mob/var/list/WorkingProcs = list("setPos(x,y)", "none")

mob/verb/TestRGB(var/txt as text)
	src << isRGB(txt)
