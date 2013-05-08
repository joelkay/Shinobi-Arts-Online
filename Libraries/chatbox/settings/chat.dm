client
	command_text = "chat-say \""
// chatbox settings

chatbox
	screen_loc = "1:19,1:17"

	maptext_height = 300
	maptext_width = 250

	maxlines = 50
	chatlines = 9

	font_family = "Times New Roman"
	font_color = "#FFFFFF"

	text_shadow = "#222d"

chatbox_gui
	icon = 'chatbox_gui.dmi'

	background
		icon = 'chatbox_bg.dmi'
		screen_loc = "1:16,1:16 to 8:15,7"
		mouse_opacity = 0

	start
		icon_state = "start"
		screen_loc = "9:16,7:28"

	up
		icon_state = "up"
		screen_loc = "9:16,7:16"

	down
		icon_state = "down"
		screen_loc = "9:16,2"

	end
		icon_state = "end"
		screen_loc = "9:16,1:19"


	worldchat
		icon_state = "wchat"
		screen_loc = "1:16,1"

	saychat
		icon_state = "schat"
		screen_loc = "2:16,1"

	villagechat
		icon_state = "vchat"
		screen_loc = "3:16,1"

	privatemessage
		icon_state = "pm"
		screen_loc = "4:16,1"


mob

	// chatbox creation

	Login()
		..()
		spawn(2)
			if(client)
				client.chatbox_build() // build the chatbox
				client.chatlog = "outputwindow.output" // set chatlog
				client.chatlog_record("\b\[ This is your chatlog ]") // enter a text into your chatlog
				world<< "[name] has logged in..", "yellow") // notify world






mob
	proc
		_chat_pm()
			var/client/G = input("Who do you wish to message?") in players + list("Cancel")
			if(G == "Cancel") return

			var/txt = input("Private Message") as text

			var/mob/guy=G.mob
			src<< "\[to: [guy.name]\] [txt]."
			_message(guy, "\[from: [name]\] [txt]."

		_chat_say()

			var/txt = input("Say") as text

			_message(view(src,6), "[name]: [txt]")

		_chat_world()

			var/txt = input("World Chat") as text

			world<< "[name]: [txt]", rgb(50,250,100))

		_chat_village()

			var/txt = input("Village Chat") as text

			for(var/mob/M in src.faction)
				M<< "[name]: [txt]", rgb(50,250,100))

			src<< "[name]: [txt]", rgb(50,250,100))

mob
	verb
	// chatbox

		clear_chatbox()
			set category = "chatbox"
			if(client)
				client.chatbox_clear()

		hide_chatbox()
			set category = "chatbox"
			if(client)
				client.chatbox_show(0)

		show_chatbox()
			set category = "chatbox"
			if(client)
				client.chatbox_show()
