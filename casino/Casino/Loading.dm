mob/proc/Loading(game)
	var/client/user = src.client
	client.UpdateResolution()

	var/Window/w = new
	w.user = user
	w.user.UpdateResolution()
	w.name = "Casino[game]"
	w.titlebar="false"
	w.w="316"; w.h="60"
	w.x="[round((w.user.scrwidth/2)-158,1)]"
	w.y="[round((w.user.scrheight/2)-30,1)]"
	w.Create()
	w.Update()

	sleep(1)

	var/Bar/b = new
	b.user = user
	b.name = "[game]bar"
	b.parent = "Casino[game]"
	b.setBounds(10,40,296,10)
	b.value = "0"
	b.bar_color = "#0000FF"
	b.border = "sunken"
	w.Controls.Add(b)

	var/Label/l = new
	l.user = user
	l.name = "[game]label"
	l.parent = "Casino[game]"
	l.setBounds(10,10,296,20)
	l.text = "Loading [game]: 0% Complete"
	w.Controls.Add(l)

	w.Update()

	for(var/i = 0, i <= 100, i++)
		sleep(0.1)
		b.value = i
		l.text = "Loading [game]: [i]% Complete"
		w.title = "Loading [game]: [i]% Complete"
		w.Update()

	for(var/i = 5, i > 0, i--)
		sleep(1)
		l.text = "Loading [game]: 100% Complete."
		w.Update()

	w.Remove()
