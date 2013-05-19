#define DEBUG

var/xml_handler/handler = new

world/New()
	handler.SetErrorMode(2)
	..()

proc
	multiply_text(t, n)
		. = ""
		for(var/a = 1, a <= n, a ++) . += t

	read_structure(xml_child/c, t)
		world << "<tt>[multiply_text("\t", t)][c]</tt>"
		if(c.attributes && c.attributes.len)
			world << "<tt>[multiply_text("\t", t + 1)]Attributes: [list2params(c.attributes)]</tt>"
		if(c.content && !c.children)
			world << "<tt>[multiply_text("\t", t + 1)]Content: [c.content]</tt>"

		world << ""
		for(var/xml_child/d in c.children) .(d, t + 1)

mob/verb
	Load_File()
		var/file = input(src) as file
		handler.LoadFile(file)
		handler.ParseFile()
		world << "<tt>File loaded and parsed.</tt>\n"

	Read_Structure()
		world << "<tt>Structure of [handler.file]:</tt>"
		if(handler.child)
			read_structure(handler.child, 0)

		else world << "<tt>\tNo structure.</tt>\n"