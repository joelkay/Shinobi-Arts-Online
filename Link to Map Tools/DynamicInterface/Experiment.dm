
var/list/HexChars = list("0",
"1", "2", "3", "4", "5", "6",
"7", "8", "9", "A", "B", "C",
"D", "E", "F", "a", "b", "c",
"d", "e", "=f")

proc/isRGB(var/text)
	if(lentext(text) != 7 && lentext(text) != 4) return 0
	if(copytext(text, 1, 2) != "#") return 0
	for(var/i = 2, i <= lentext(text), i++)
		if(copytext(text,i,i+1) in HexChars)
			continue
		else
			return 0
	return 1

Control/var/AutoUpdate=1
Control/proc
	setAU(var/NAU)
		if(NAU=="" || NAU=="false" || NAU=="0" || NAU==0) AutoUpdate=0
		else AutoUpdate=1
	getPos()
		return "[x],[y]"
	setPos(var/nx, var/ny)
		var/ERR
		if(!isnum(nx))
			world << "DIL: Minor Error"
			world << "[copytext("[src.type]",2)].setPos(NewX, NewY)"
			world << "NewX must be numerical."
			ERR=1
		if(!isnum(ny))
			world << "DIL: Minor Error"
			world << "[copytext("[src.type]",2)].setPos(NewX, NewY)"
			world << "NewY must be numerical."
			ERR=1
		if(!ERR)
			x=nx
			y=ny
			if(AutoUpdate) winset(user, GPCN(), "pos=[x],[y]")
	getX()
		return x
	setX(var/nx)
		if(!isnum(nx))
			world << "DIL: Minor Error"
			world << "[copytext("[src.type]",2)].setX(NewX)"
			world << "NewX must be numerical."
			return
		x=nx
		if(AutoUpdate) winset(user, GPCN(), "pos=[x],[y]")
	getY()
		return y
	setY(var/ny)
		if(!isnum(ny))
			world << "DIL: Minor Error"
			world << "[copytext("[src.type]",2)].setY(NewY)"
			world << "NewY must be numerical."
			return
		y=ny
		if(AutoUpdate) winset(user, GPCN(), "pos=[x],[y]")
	getSize()
		return "[w]x[h]"
	setSize(var/nw, var/nh)
		var/ERR
		if(!isnum(nw))
			world << "DIL: Minor Error"
			world << "[copytext("[src.type]",2)].setSize(NewW, NewH)"
			world << "NewW must be numerical."
			ERR=1
		if(!isnum(nh))
			world << "DIL: Minor Error"
			world << "[copytext("[src.type]",2)].setSize(NewW, NewH)"
			world << "NewH must be numerical."
			ERR=1
		if(!ERR)
			w=nw
			h=nh
			if(AutoUpdate) winset(user, GPCN(), "size=[w]x[h]")
	getW()
		return w
	setW(var/nw)
		if(!isnum(nw))
			world << "DIL: Minor Error"
			world << "[copytext("[src.type]",2)].setW(NewW)"
			world << "NewW must be numerical."
			return
		w=nw
		if(AutoUpdate) winset(user, GPCN(), "size=[w]x[h]")
	getH()
		return h
	setH(var/nh)
		if(!isnum(nh))
			world << "DIL: Minor Error"
			world << "[copytext("[src.type]",2)].setH(NewH)"
			world << "NewH must be numerical."
			return
		h=nh
		if(AutoUpdate) winset(user, GPCN(), "size=[w]x[h]")
	setBounds(var/nx, var/ny, var/nw, var/nh)
		var/ERR
		if(!isnum(nx))
			world << "DIL: Minor Error"
			world << "[copytext("[src.type]",2)].setBounds(NewX, NewY, NewW, NewH)"
			world << "NewX must be numerical."
			ERR=1
		if(!isnum(ny))
			world << "DIL: Minor Error"
			world << "[copytext("[src.type]",2)].setBounds(NewX, NewY, NewW, NewH)"
			world << "NewY must be numerical."
			ERR=1
		if(!isnum(nw))
			world << "DIL: Minor Error"
			world << "[copytext("[src.type]",2)].setBounds(NewX, NewY, NewW, NewH)"
			world << "NewW must be numerical."
			ERR=1
		if(!isnum(nh))
			world << "DIL: Minor Error"
			world << "[copytext("[src.type]",2)].setBounds(NewX, NewY, NewW, NewH)"
			world << "NewH must be numerical."
			ERR=1
		if(!ERR)
			x=nx
			y=ny
			w=nw
			h=nh
			if(AutoUpdate)
				winset(user, GPCN(), "pos=[x],[y]")
				winset(user, GPCN(), "size=[w]x[h]")
	//TODO: Anchors
	getVisible()
		return is_visible
	setVisible(var/NewVisibility="true")
		if(NewVisibility != "true" && NewVisibility != "false")
			world << "DIL: Minor Error"
			world << "[copytext("[src.type]",2)].setVisible(NewTransparency)"
			world << "setVisible must be \"true\" or \"false\""
			return
		is_visible=NewVisibility
		if(AutoUpdate) winset(user, GPCN(), "is-visible=[is_visible]")
	getTransparent()
		return is_transparent
	setTransparent(var/NewTransparency="true")
		if(NewTransparency != "true" && NewTransparency != "false")
			world << "DIL: Minor Error"
			world << "[copytext("[src.type]",2)].setTransparent(NewTransparency)"
			world << "NewTransparency must be \"true\" or \"false\""
			return
		is_transparent = NewTransparency
		if(AutoUpdate) winset(user, GPCN(), "is-transparent=[is_transparent]")
	getBorder()
		return border
	setBorder(var/B="none")
		var/BOARD = lowertext(B)
		if(BOARD == "sunken")
			border = "sunken"
		else if(BOARD == "line")
			border = "line"
		else if(BOARD == "" || BOARD == "none")
			border = "none"
		else
			world << "DIL: Minor Error"
			world << "[copytext("[src.type]",2)].setBoarder(NewBorder)"
			world << "NewBoarder must be \"line\", \"sunken\" or \"none\"."
			return
		if(AutoUpdate) winset(user, GPCN(), "border=[border]")
	getTextColor()
		return text_color
	setTextColor(var/NewColor)
		if(!isRGB(NewColor))
			world << "DIL: Minor Error"
			world << "[copytext("[src.type]",2)].setTextColor(NewColor)"
			world << "NewColor must be an #RGB or #RRGGBB value."
			return
		text_color = NewColor
		if(AutoUpdate) winset(user, GPCN(), "text-color=[text_color]")
	getBackgroundColor()
		return background_color
	setBackgroundColor(var/NewColor)
		if(!isRGB(NewColor))
			world << "DIL: Minor Error"
			world << "[copytext("[src.type]",2)].setBackgroundColor(NewColor)"
			world << "NewColor must be an #RGB or #RRGGBB value."
			return
		background_color = NewColor
		if(AutoUpdate) winset(user, GPCN(), "background-color=[background_color]")
	getIsDefault()
		return is_default
	setIsDefault(var/NewDefault)
		if(NewDefault != "true" && NewDefault != "false")
			world << "DIL: Minor Error"
			world << "[copytext("[src.type]",2)].setDefault(NewDefault)"
			world << "NewDefault must be \"true\" or \"false\""
			return
		is_default = NewDefault
		if(AutoUpdate) winset(user, GPCN(), "is-default=[is_default]")
	getIsDisabled()
		return is_disabled
	setIsDisabled(var/NewDisabled)
		if(NewDisabled != "true" && NewDisabled != "false")
			world << "DIL: Minor Error"
			world << "[copytext("[src.type]",2)].setDisabled(NewDisabled)"
			world << "NewDefault must be \"true\" or \"false\""
			return
		is_disabled = NewDisabled
		if(AutoUpdate) winset(user, GPCN(), "is-disabled=[is_disabled]")
	getFocus()
		return focus
	setFocus(var/NewFocus)
		if(NewFocus != "true" && NewFocus != "false")
			world << "DIL: Minor Error"
			world << "[copytext("[src.type]",2)].setFocus(NewFocus)"
			world << "NewFocus must be \"true\" or \"false\""
			return
		focus = NewFocus
		if(AutoUpdate) winset(user, GPCN(), "focus=[focus]")
	getDropZone()
		return drop_zone
	setDropZone(var/NewDropZone)
		if(NewDropZone != "true" && NewDropZone != "false")
			world << "DIL: Minor Error"
			world << "[copytext("[src.type]",2)].setDropZone(NewDropZone)"
			world << "NewDropZone must be \"true\" or \"false\""
			return
		drop_zone = NewDropZone
		if(AutoUpdate) winset(user, GPCN(), "drop-zone=[drop_zone]")
	getRightClick()
		return right_click
	setRightClick(var/NewRightClick)
		if(NewRightClick != "true" && NewRightClick != "false")
			world << "DIL: Minor Error"
			world << "[copytext("[src.type]",2)].setRightClick(NewRightClick)"
			world << "NewRightClick must be \"true\" or \"false\""
			return
		right_click = NewRightClick
		if(AutoUpdate) winset(user, GPCN(), "right-click=[right_click]")
	getFontFamily()
		return font_family
	setFontFamily(var/NewFontFamily)
		font_family = NewFontFamily
		if(AutoUpdate) winset(user, GPCN(), "font-family=[font_family]")
	getFontSize()
		return font_size
	setFontSize(var/NewFontSize)
		if(!isnum(NewFontSize))
			world << "DIL: Minor Error"
			world << "[copytext("[src.type]",2)].setFontSize(NewFontSize)"
			world << "NewFontSize must be numerical."
			return
		font_size=NewFontSize
		if(AutoUpdate) winset(user, GPCN(), "font-size=[font_size]")
	getFontStyle()
		return font_style
	setFontStyle(var/NewFontStyle)
		font_style = NewFontStyle
		if(AutoUpdate) winset(user, GPCN(), "font-style=[font_style]")
	getOnSize()
		return on_size
	setOnSize(var/NewOnSize)
		on_size = NewOnSize
		if(AutoUpdate) winset(user, GPCN(), "on-size=[on_size]")