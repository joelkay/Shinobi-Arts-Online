//Default control, for defining defaults in all controls

Control
	var/name = ""
	var/Control/parentobj
	var/client/user

	New(var/client/user, var/name, var/parent)

		/*
		if(user==null)
			world << "<FONT COLOR='#CC0000'>DIL: Major Error</FONT>"
			world << "------ [copytext("[src.type]",2)].New(User, Name, Parent)"
			world << "------ <FONT COLOR='#0000FF'>User Not specified."
			return

		if(name==null)
			world << "<FONT COLOR='#CC0000'>DIL: Major Error</FONT>"
			world << "------ [copytext("[src.type]",2)].New(User, Name, Parent)"
			world << "------ <FONT COLOR='#0000FF'>Name not specified."
			return

		if(parent==null)
			world << "<FONT COLOR='#CC0000'>DIL: Major Error</FONT>"
			world << "------ [copytext("[src.type]",2)].New(User, Name, Parent)"
			world << "------ <FONT COLOR='#0000FF'>Parent not specified."
			return
		*/

		src.user = user
		src.name = name
		src.parent = parent
	var
		isControl=1                 //Is control boolean, as opposed to a window.
		ctype="control"             //Type of control, set individually per control. Constant value
		preexisting=0               //Preexisting, used for preexistant interface controls
		anchor1="none"              //First Anchor, defaulting to none
		anchor2="none"              //Second Anchor, defaulting to none
		is_visible="true"           //visibility of the control.
		is_transparent="false"      //transparancy of the control
		border="none"               //border of the control
		flash="0"                   //flash of the control. Unknown usage.
		text_color="#000000"        //text color for the control
		background_color="#F0F0F0"  //control's background color.
		is_default="false"          //if the control is the default control of that type.
		is_disabled="false"         //if the control is disabled (greyed out) or not
		focus="false"               //if the control having the client's focus
		drop_zone="false"           //if you can drag and drop items here
		right_click=""              //command on right click
		font_family=""              //font for the control
		font_size="0"               //size of the control's font
		font_style=""               //style of the control's font
		on_size=""                  //command activated by rezising the control
		parent=""                   //parent of the control
		x=0                         //X value of the control
		y=0                         //Y value of the control
		w=0                         //Width value of the control
		h=0                         //Height value of the control
	proc/GetDefaultParams()
		var/list/params = new
		params["type"]=ctype
		params["parent"]=parent
		params["pos"]="[x],[y]"
		params["size"]="[w]x[h]"
		params["anchor1"]=anchor1
		params["anchor2"]=anchor2
		params["is-visible"]=is_visible
		params["is-transparent"]=is_transparent
		params["border"]=border
		params["flash"]=flash
		params["text-color"]=text_color
		params["background-color"]=background_color
		params["is-default"]=is_default
		params["is-disabled"]=is_disabled
		params["focus"]=focus
		params["drop-zone"]=drop_zone
		params["right-click"]=right_click
		params["font-family"]=font_family
		params["font-size"]=font_size
		params["font-style"]=font_style
		params["on-size"]=on_size
		return params
	proc/GetParams()
		var/list/params = GetDefaultParams()
		return params
	proc/Update()
		var/list/params = GetParams()
		winset(user, GPCN(), list2params(params))
	proc/Hide()
		winset(user, GPCN(), "is-visible=false")
	proc/Show()
		winset(user, GPCN(), "is-visible=true")
	proc/Remove()
		winset(user, GPCN(), "parent=none")
	proc/GetExistingParams(var/client/user, var/controlID)
		//Dummy proc, will complete later.
	proc/GPCN()
		return "[parent].[name]"
	//Updating Procs to be added here.
	proc/IsDefaultValue(var/Control/c, var/paran)
		var/retv = 0
		var/Control/c2 = new(c.user, "temp", "window")
		if(c.vars[paran] == c2.vars[paran]) retv = 1
		else retv = 0
		del(c2)
		return retv

//Window class for controlling dynamic windows
Window
	parent_type = /Control/
	isControl=0
	ctype="window"
	var/created=0
	var
		list/Control/Controls = new
		can_minimize="true"; can_resize="true"
		is_minimized="false"; is_maximized="false"
		alpha="255"; statusbar="false"
		transparent_color="none"; can_close="true"
		title=""; titlebar="true"; icon=""
		image=""; image_mode="stretch"
		keep_aspect="false"; macro=""; menu=""
		on_close=""; can_scroll="none"; is_pane="false"
	GetParams()
		var/list/params = GetDefaultParams()
		params["parent"]="window"
		params["can-minimize"]=can_minimize
		params["can-resize"]=can_resize
		params["is-maximized"]=is_maximized
		params["is-maximized"]=is_maximized
		params["alpha"]=alpha
		params["statusbar"]=statusbar
		params["transparent-color"]=transparent_color
		params["can-close"]=can_close
		params["title"]=title
		params["titlebar"]=titlebar
		params["icon"]=icon
		params["image"]=image
		params["image-mode"]=image_mode
		params["keep-aspect"]=keep_aspect
		params["macro"]=macro
		params["menu"]=menu
		params["on-close"]=on_close
		params["can-scroll"]=can_scroll
		params["is-pane"]=is_pane
		return params
	proc/Create()
		winclone(user,"window","[name]")
		winset(user,"[name]","is-visible=false")
		created=1
	Update()
		if(!created) Create()
		var/list/params = GetParams()
		winset(user, "[name]", list2params(params))
		for(var/Control/c in Controls)
			c.Update()
	Remove()
		for(var/Control/c in Controls)
			winset(user, c.name, "parent=none")
		winset(user, src.name, "parent=none")
	GPCN()
		return "[name]"

//Other controls
Label
	parent_type = /Control/
	ctype="label"
	var
		text=""
		align="center"
		text_wrap="false"
		image=""
		image_mode="stretch"
		keep_aspect="false"
	GetParams()
		var/list/params = GetDefaultParams()
		params["text"]=text
		params["align"]=align
		params["text-wrap"]=text_wrap
		params["image"]=image
		params["image-mode"]=image_mode
		params["keep-aspect"]=keep_aspect
		return params
	Update()
		var/list/params = GetParams()
		winset(user, "[parent].[name]", list2params(params))

Button
	parent_type = /Control/
	ctype="button"
	var
		is_flat="false"
		is_checked="false"
		group=""
		button_type="pushbutton"
		text=""
		image=""
		command=""
	GetParams()
		var/list/params = GetDefaultParams()
		params["is-flat"] = is_flat
		params["is-checked"] = is_checked
		params["group"] = group
		params["button-type"] = button_type
		params["text"] = text
		params["image"] = image
		params["command"] = command
		return params


Input
	parent_type = /Control/
	ctype="input"
	background_color = "#FFFFFF"
	var
		multi_line="false"
		is_password="false"
		no_command="false"
		text=""
		command=""
	GetParams()
		var/list/params = GetDefaultParams()
		params["multi-line"] = multi_line
		params["is-password"] = is_password
		params["no-command"] = no_command
		params["text"] = text
		params["command"] = command
		return params

Output
	parent_type = /Control/
	ctype="output"
	background_color = "#FFFFFF"
	var
		style
		max_lines
		link_color
		visited_color
		image
		enable_http_images
	GetParams()
		var/list/params = GetDefaultParams()
		params["style"]=style
		params["max-lines"]=max_lines
		params["link-color"]=link_color
		params["visited-color"]=visited_color
		params["image"]=image
		params["enable-http-images"]=enable_http_images
		return params

Browser
	parent_type = /Control/
	ctype="browser"
	background_color = "#FFFFFF"
	var
		show_history="false"
		show_url="false"
		use_title="false"
		auto_format="true"
		on_show=""
		on_hide=""
	GetParams()
		var/list/params = GetDefaultParams()
		params["show-history"]=show_history
		params["show-url"]=show_url
		params["use-title"]=use_title
		params["auto-format"]=auto_format
		params["on-show"]=on_show
		params["on-hide"]=on_hide
		return params
Map
	parent_type = /Control/
	ctype="map"
	background_color = "#000000"
	var
		view_size="0"
		style=""
		text_mode="false"
		icon_size="0"
		on_show=""
		on_hide=""
	GetParams()
		var/list/params = GetDefaultParams()
		params["view-size"]=view_size
		params["style"]=style
		params["text-mode"]=text_mode
		params["icon-size"]=icon_size
		params["on-show"]=on_show
		params["on-hide"]=on_hide
		return params

Info
	parent_type = /Control/
	ctype="info"
	var
		multi_line="true"
		highlight_color="#00FF00"
		tab_text_color="none"
		tab_background_color="none"
		allow_html="false"
		tab_font_family=""
		tab_font_size="0"
		tab_font_style=""
		on_show=""
		on_hide=""
		on_tab=""
	GetParams()
		var/list/params = GetDefaultParams()
		params["multi-line"]=multi_line
		params["highlight-color"]=highlight_color
		params["tab-text-color"]=tab_text_color
		params["tab-background-color"]=tab_background_color
		params["allow-html"]=allow_html
		params["tab-font-family"]=tab_font_family
		params["tab-font-size"]=tab_font_size
		params["tab-font-style"]=tab_font_style

		params["on-show"]=on_show
		params["on-hide"]=on_hide
		params["on-tab"]=on_tab
		return params

Child
	parent_type = /Control/
	ctype="child"
	var
		lock="none"
		is_vert="false"
		splitter="50"
		show_splitter="true"
		right="none"
		left="none"
	GetParams()
		var/list/params = GetDefaultParams()
		params["lock"]=lock
		params["is-vert"]=is_vert
		params["splitter"]=splitter
		params["show-splitter"]=show_splitter
		params["right"]=right
		params["left"]=left
		return params

Tab
	parent_type = /Control/
	ctype="tab"
	var
		multi_line="true"
		current_tab=""
		on_tab=""
		tabs=""
	GetParams()
		var/list/params = GetDefaultParams()
		params["multi-line"]=multi_line
		params["current-tab"]=current_tab
		params["on-tab"]=on_tab
		params["tabs"]=tabs
		return params

Grid
	parent_type = /Control/
	ctype="grid"
	background_color = "#FFFFFF"
	var
		cells="0x0"
		cell_span="1x1"
		is_list="false"
		show_lines="both"
		style=""
		line_color="#C0C0C0"
		link_color="#0FF"
		visited_color="#F0F"
		current_cell="0x0"
		show_names="true"
		small_icons="false"
		enable_http_images="false"
	GetParams()
		var/list/params = GetDefaultParams()
		params["cells"]=cells
		params["cell-span"]=cell_span
		params["is-list"]=is_list
		params["show-lines"]=show_lines
		params["style"]=style
		params["line-color"]=line_color
		params["link-color"]=link_color
		params["visited-color"]=visited_color
		params["current-cell"]=current_cell
		params["show-names"]=show_names
		params["small-icons"]=small_icons
		params["enable-http-images"]=enable_http_images
		return params

Bar
	parent_type = /Control/
	ctype="bar"
	var
		width="10"
		dir="east"
		angle1="0"
		angle2="0"
		bar_color="none"
		is_slider="false"
		value="0"
		on_change=""
	GetParams()
		var/list/params = GetDefaultParams()
		params["width"]=width
		params["dir"]=dir
		params["angle1"]=angle1
		params["angle2"]=angle2
		params["bar-color"]=bar_color
		params["is-slider"]=is_slider
		params["value"]=value
		params["on_change"]=on_change
		return params

//proc/GetScreenRes(var/mob/user)
client/proc/UpdateResolution(var/force=0)
	set background = 1
	if(scrwidth != 0 && scrheight != 0 && force == 0) return
	var/Window/w = new(src, "hidden", "window")
	w.is_visible="false"
	w.setSize(500, 250)
	w.Create(); w.Update()
	sleep(1)
	var/Browser/b = new(src, "resodet", "hidden")
	b.is_visible="true"; b.parentobj = w
	b.setSize(500, 250)
	b.border="sunken";
	w.Controls.Add(b); b.Update()
	var/updating=1
	src<<output({"<script type='text/Javascript'> document.location.href = 'byond://?action=resol&width=' + screen.width+'&height='+screen.height; </script>"},"resodet")
	//
	sleep(1)
	var/times=0
	while(updating)
		sleep(1)
		times++
		if(times>=50 || updating==0) //limit of 10 seconds or if update stops
			break
	//world<<"Times: [times]"
	w.Remove() //Garbage Collection, Also seemingly restores previous window's focus

client/var/scrwidth=0; client/var/scrheight=0; client/var/updating=0
client
	Topic(t)
		var/nlist[] = params2list(t)
		if(nlist["action"] && (nlist["action"] == "resol"))//If action exists & is set to assign resolution
			scrwidth=text2num(nlist["width"])//assigns width to mob
			scrheight=text2num(nlist["height"])//same here (with height)
			updating=0

mob/Login()
	client.UpdateResolution()
	..()
