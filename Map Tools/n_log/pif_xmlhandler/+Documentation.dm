/*
pif_XMLHandler by Popisfizzy
	Current Version: 1.00
	Release Date: September 6, 2008

This library comes as-is, with absolutely no warranty on the libary, in
part or in whole. Feel free to modify, edit, optimize, destroy, etc.
as you wish. If the library is rendered unworkable due to edits, I give
no guarantee or warrantee on fixing it. There are few comments for the
library, and I will not help you figure out how it works. If you don't
understand it, chances are you shouldn't edit it.

Though it is not required, if this library is used, in part or in
whole, it would be nice for some mention.

-----------------------------------------------------------------------
Index:

o	Description
	A description of the library and its uses.

o	Rules
	The rules for an XML file.

o	To Do
	To do list for the library.

o	/xml_handler Information
	Information on the /xml_handler type, including its procs and
	variables.

o	/xml_child Information
	Information on the /xml_child type, including its procs and
	variables.

o	Preprocessor Macros
	A listing of the values of the preprocessor macros.

-----------------------------------------------------------------------
Description:

XML is a human- and computer-readable, mark-up language designed to
store information, including designing a hierarchy for that information
at arbitrary levels. It stands for "eXtensible Markup Language". To
keep it standardized and readable by any program, it has a strict set
of rules (see below). XML is general-purpose, and can be used for a
variety of specification purposes. Note that it may not be the best
choice for secure applications, though its security can be improved by
encrypting the file.

-----------------------------------------------------------------------
Rules:

o	XML files must have ONE, and only one, root element. This is easily
	seen as the top-most element defined.

o	Comments are indicated by the <!-- and --> series. The -- series
	may not occur anywhere else in the file, except in text strings.

	o	Comments can be placed anywhere in the tree, including the
		text.

o	All tags must be closed.

		<!-- This is invalid -->
		<root>
			<foo>bar
		</root>

		<!-- This is valid -->
		<root>
			<foo>bar</foo>
		</root>

	For tags with no content, with a forward slash included at the end
	of the tag.

		<foo />
		<foo/>

	Of course, tags can simply be closed, without content, as normal.

		<foo></foo>

	o	Tags can be nested, but may not overlap. Tags have to be closed
		in reverse-order in which they were opened.

	o	Elements' names must be made up only of A-Z, a-z, 0-9, and
		underscores. They can not start with a number.

	o	Elements are case-sensitive. They must be closed with the same
		text they are opened with.

	o	Closing tags can not contain elements.

o	Attributes and their values, in an element, must not have any space
	between the equal sign and the value. For example:

		<!-- Incorrect -->
		<value foo = "bar">

		<!-- CORRECT -->
		<value foo="bar">

	o	Attributes must be comprised only of A-Z, a-z, 0-9, and
		underscores. It can not start with a number.

	o	Attribtes' values must always be in single or double quotes,
		and must be closed with the same type.

	o	Characters can be indicated by using character entities. The
		following are supported:

			o	Ampersand (&)							&amp;
			o	Left angle bracket/less than (<)		&lt;
			o	Right angle bracket/greater than (>)	&gt;
			o	Apostrophe (')							&apos;
			o	Quotation mark (")						&quot;

		Currently, programmer-defined character entities are
		unsupported, as is using ASCII or hexadecimal values. Due to
		BYOND's limitations, many characters (most of Unicode) will not
		be supported, indefinitely. In the future, though, the ASCII
		character set and programmed-defined entities may, and likely
		will, be supported by this library.

-----------------------------------------------------------------------
To do:
o	Add ASCII and hexadecimal character entities.
o	Add XPath support.
o	Add XSLT support.
o	Add DTD support.
	o	Add programmer-defined character entities.
o	Add XSD/XML Scheme support.

-----------------------------------------------------------------------
/xml_handler Information:

The /xml_handler datum is used to read, edit, and write XML files. It
handles most of the interactions with the /xml_child datum.

*	Note on paths:
	To simplify the process of locating a particular child, I have
	included a system to use a path, similiar to a typepath in DM, or
	a file tree for an operating system. Each element acts as a new
	node in the tree, and acts as a point in the path. For example, in
	the following XML:

		<root>
			<foo>
				<bar />
				<foobar />
			</foo>
		</root>

	These are the possible paths:
	o	/root
	o	/root/foo
	o	/root/foo/bar
	o	/root/foo/foobar

	*	Note: As I was not aware of XPath while I was programming this
		library, it is not included. I intend to provide support for it
		in future versions. I will provide backwards- compatability
		options, to allow selection of simple paths and/or XPath.

Variables:
o	/xml_handler.data_mode (default: LIST_MODE [1])
	This stores whether variables are stored as a /list object or a
	text string, in the form of parameters (see list2params() and
	params2list() in the reference for more information).

o	/xml_handler.error_mode (default: SILENT_FAIL [1])
	This is the error mode specification. This variable determines what
	will happen when the XML handler encounters a problem with the file
	is it reading or writing.

o	/xml_handler.file (default: null)
	The name of the file being read or written.

o	/xml_handler.file_text (default: null)
	The plaintext version of the file.

o	/xml_handler.length (default: null)
	The length of the file.

o	/xml_handler.list/close_series (default: null)
	Used in reading only. This stores the sequence that tags were opened
	in, to determine if tags are being closed appropriately, and if all
	tags have been closed.

o	/xml_handler.xml_child/child (default: null)
	The child that corresponds to the root element in the XML file.

o	/xml_handler.xml_child/current (default: null)
	Use in reading only. This is the object corresponding to the tag
	current being read.

Procedures:
o	/xml_handler.New()
	Creates a new /xml_handler object, then loads and parses the file,
	assuming a valid argument is passed.
	o	Arguments:
		o	f: A file to load and parse. Doesn't need to be passed.

o	/xml_handler.AddChild()
	Adds a new child.
	o	Arguments:
		o	path: The path to add the node.
		o	name: The name of the new child.

o	/xml_handler.AddChildAttribute()
	Adds an attribute to an /xml_child.
	o	Arguments:
		o	path: The path to the parent of the new child.
		o	attribute: The name of the attribute.
		o	value: The value to assign to the attribute.
	o	Returns:
		o Boolean: True on success; false on failure.

o	/xml_handler.DeleteChild()
	Deletes an /xml_child.
	o	Arguments:
		o	path: The path to the child.
	o	Returns:
		o	Boolean: True on success; false on failure. A true return
			will indicate that the child *did* exist.

o	/xml_handler.Error()
	Handles error output, and then deletes the /xml_handler object.
	o	Arguments:
		o	msg: The message to output.
		o	position: The position in the file (used to output the line
			and column number.

o	/xml_handler.FindChild()
	Returns an /xml_child object from a specific path.
	o	Arguments:
		o	path: The path to the object.
	o	Returns:
		o	/xml_child: The /xml_child searched for.
		o	null, 0: If the /xml_child was not found.

o	/xml_handler.IsListMode()
	Checks whether the /xml_handler object is in list mode.
	o	Returns:
		o	Boolean: True if the handler is in list mode; false
			otherwise.

o	/xml_handler.IsParamsMode()
	Checks whther the /xml_handler object is in params mode.
	o	Returns:
		o	Boolean: True if the handler is in params mode; false
			otherwise.

o	/xml_handler.LoadFile()
	Loads a specified file. This means that it sets the file being
	handled to that file, gets the string from it, and sets the length
	of the string.
	o	Arguments:
		o	f: A file to attempt to load.
	o	Returns:
		o	Boolean: True on success; false on failure.

o	/xml_handler.ParseFile()
	Handles the parsing of XML files, and initiates the process.

o	/xml_handler.RemoveChildAttribute()
	Removes a specified attribute of a child.
	o	Arguments:
		o	path: The path to the child.
		o	attribute: The attribute to remove.
	o	Returns:
		o	Boolean: True on succes; false on failure.

o	/xml_handler.SetChild()
	Sets the root child of handler. This is primarily used internally.
	o	Arguments:
		o	/xml_child/c: The child to set as the root.

o	/xml_handler.SetChildAttribute()
	Sets the value of a child's attribute.
	o	Arguments:
		o	path: The path to the child.
		o	attribute: The name of the attribute.
		o	value: The value to assign to the attribute.
	o	Returns:
		o	Boolean: True on success; false on failure.

o	/xml_handler.SetChildAttributesList()
	Sets the value of multiple attributes of a child.
	o	Arguments:
		o	path: The path to the child.
		o	list/attributes: An associative list of values, where the
			value is the attribute and the associated value is the
			value of the attribute.
	o	Returns:
		o	Boolean: True on success; false on failure.

o	/xml_handler.SetErrorMode()
	This sets the error mode of the handler, which determines what
	happens if and when an error is encountered.
	o	Arguments:
		o	m: The error mode. The following are valid:
			o	SILENT_FAIL
			o	LOUD FAIL
			Read the "Preprocessor Macros" section for more info.

o	/xml_handler.SetFile()
	Sets the file. Note that this doesn't load a file or parse it.
	o	Arguments:
		o	f: The file to set.

o	/xml_handler.SetMode()
	This sets the mode for the handler (whether data is stored as a
	/list object, or parameter strings).
	o	Arguments:
		o	m: The mode for the handler. The following are valid:
			o	LIST_MODE
			o	PARAMS_MODE
			Read the "Preprocessor Macros" section for more info.
	o	Returns:
		o	Boolean: True on succes; false on failure.

o	/xml_handler.WriteFile()
	This writes the data of a handler to a file, deleting a
	previously-existing file, in the process.
	o	Arguments:
		o	f: The file to write. This argument is optional, as it only
			changes what file will be saved to. If this argument is not
			supplied, then the previous ly set file (assuming it
			exists) is used.
	o	Returns:
		o	Boolean: True on succes; false on failure.

o	/xml_handler.child_loop()
	Used to get all the data from the children.
	o	Returns:
		o	String: A text string of the data.

o	/xml_handler.clear_comments()
	Removes all the comments from the text of a loaded file.
	o	Returns:
		o	String: a text string without any comments.

o	/xml_handler.explode()
	Converts a text string into a list, based on a delimiter.
	o	Arguments:
		o	string: The string to convert.
		o	delimiter (default: "/"): The delimiter used to determine
			the elements.
	o	Returns:
		o	/list: A new list object.

o	/xml_handler.format_string()
	Converts all entities in a string into their proper values.
	o	Arguments:
		o	string: The string to format.
		o	n: The location of the string.
	o	Returns:
		o	String: A formatted string.

o	/xml_handler.get_position_data()
	Gets the line and column number of a position in a file string.
	This is used for information on errors.
	o	Arguments:
		o	n: The position.
	o	Returns:
		o	/list: Data on the position.

o	/xml_handler.is_invalid()
	Determines if a name is invalid.
	o	Arguments:
		o	n: A name.
	o	Returns:
		o	Boolean: True if valid; false if invalid.

o	/xml_handler.make_child()
	Creates a new /xml_child object, with set specifications.
	o	Arguments:
		o	tag: The element.
		o	close: The close mode.
		o	list/attributes: The attributes and their values.
		o	n: The position of the tag. Used for error handling.

o	/xml_handler.multiply_text()
	Repeats a given string a specified amount of times.
	o	Arguments:
		o	t: The text to repeat.
		o	n: The amount of times to repeat it.
	o	Returns:
		o	String: The newly-formed string.

o	/xml_handler.parse_tag()
	Parses a tag, creates the child, and handles errors.
	o	Arguments:
		o	m: The position in the file string to start from.
	o	Returns:
		o	Number: The end of the tag.

-----------------------------------------------------------------------
/xml_child Information:

The /xml_child datum stores data on the individual tags, including
their element, attributes, and contents. The structure is essentially
a tree.

Variables:
o	content
	The content of the tag.

o	list/attributes
	The attributes of the tag. This is an associative list, with the
	association being the value of the attribute.

o	list/children
	The direct children of the tag.

o	list/comments
	The comments for the tag.

o	name
	The name of the content.

o	write_content (default: 0)
	Determines whether the content of the /xml_child should be written
	to a file. By default, no data is written. Note that, if the child
	has no children, and has content, the data will be written
	regardless of the value of this variable.

o	/xml_child/parent
	The parent of the child.

o	/xml_handler/master
	The /xml_handler that deals with the /xml_child object.

Procedures:
o	/xml_child.New()
	Creates a new /xml_child object, then sets its name, its master
	(/xml_handler) and its parent (/xml_child), if it has one.
	o	Arguments:
		o	n: The name of the object.
		o	/xml_handler/m: The controlling /xml_handler object. If the
			object has no child set, the /xml_child will be considered
			the root.
		o	/xml_child/p: The /xml_child that is this one's parent. If
			no argument is provided, then it is assumed the chld is the
			root tag.

o	/xml_child.Del()
	Deletes the /xml_child, as well as all its children.

o	/xml_chld.AddAttribute()
	Adds an attribute to the child, and sets its value.
	o	Arguments:
		o	attribute: The name of the attribute.
		o	value: The value of the attribute.
	o	Returns:
		o	Boolean: True on success; false on failure.

o	/xml_child.AddChild()
	Adds a new /xml_child object to the children list.
	o	Arguments:
		o	/xml_child/c: The child to add.

o	/xml_child.AddComment()
	Adds a comment to the tag.
	o	Arguments:
		o	comment: The comment.
		o	position (default: PRE [2]): The way to position the the
			comment, when the file is written. The following are valid
			values for this argument:
			o	PRE
			o	POST
			o	SIDE
			Read the "Preprocessor Macros" section for more
			information.

o	/xml_child.AddContent()
	Adds to the content.
	o	Arguments:
		o	c: The string to add to the content.
	o	Returns:
		o	Boolean: True on success; false on failure.

o	/xml_child.ClearContent()
	Clears the content.
	o	Returns:
		o	Boolean: True on success; false on failure.

o	/xml_child.GetAttributesList()
	Returns either the attributes list or a params version of it.
	o	Arguments:
		o	mode (default: 0): This is the mode that the list will be
			returned in. If this value is false, it is based off the
			mode of the /xml_handler controlling the /xml_child. If
			not, it can be one of these two values.:
			o	LIST_MODE
			o	PARAMS_MODE
			Read the "Preprocessor Macros" section for more
			information.
	o	Returns:
		o	String: A parameter string, if the mode is parameters.
		o	/list object: A lits, if the mode is list.

o	/xml_child.GetChild()
	Gets a child of the object.
	o	Arguments:
		o	n: If...
			1)	n is a number, then it returns the child at that index
				in the children list.
			2)	n is a string, then it returns the first /xml_child
				of that tag in the chilren list.
	o	Returns:
		o	/xml_child: An /xml_child determined by the argument
			supplied.
		o	null: If nothing is found.

o	/xml_child.GetChildren()
	Returns the children list.
	o	Returns:
		o	/list: The children list.

o	/xml_child.GetContent()
	Returns the content.
	o	Arguments:
		o	c (default: 0): If this is false, then the children list
			will be returned if there is no content. If it's true, then
			only content can be returned.
	o	Returns:
		o	String: The content variable if content is found.
		o	/list: The children list if c is false and no content is
			found.
		o	null: This is returned if content or children are not set,
			depending on the argument supplied.

o	/xml_child.GetName()
	Returns the name (tag) of the object.
	o	Returns:
		o	String: The name/tag of the object.

o	/xml_child.GetParent()
	Returns the parent of the object.
	o	Returns:
		o	/xml_child: The parent of the object, in the tree.
		o	null: Null if the object is the root of the tree.

o	/xml_child.GetValue()
	Gets the value of a specified attribute.
	o	Arguments:
		o	a: The attribute
	o	Returns:
		o	String: The value of the argument.

o	/xml_child.GetValueAsFile()
	Gets the value of a specified attribute and turns it into a file.
	o	Arguments:
		o	a: The attribute.
	o	Returns:
		o	File: A file, based on the attribute.

o	/xml_child.GetValueAsNum()
	Gets the value of a specified attribute and turns it into a number.
	o	Arguments:
		o	a: The attribute.
	o	Returns:
		o	Number: A number, based on the attribute.

o	/xml_child.GetValueAsPath()
	Gets the value of a specified attribute and turns it into a
	typepath.
	o	Arguments:
		o	a: The attribute.
	o	Returns:
		o	Typepath: A typepath, based on the attribute.

o	/xml_child.GetValueAsText()
	See: /xml_child.GetValue()

o	/xml_child.NextChild()
	Returns the child following the passed one in the list. If this is
	the last element, the first one is returned.
	o	Arguments:
		o	/xml_child/c: The child to look after.
	o	Returns:
		o	/xml_child: The next /xml_child.

o	/xml_child.PreviousChild()
	Returns the child before the passed on in the list. If this is the
	first element, the last one is returned.
	o	Arguments:
		o	/xml_child/c: The child to look before.
	o	Returns:
		o	/xml_child: The next /xml_child.

o	/xml_child.RemoveAttribute()
	Removes an attribute from the child.
	o	Arguments:
		o	attribute: The attribute to remove.
	o	Returns:
		o	Boolean: True on success; false on failure.

o	/xml_child.RemoveComment()
	Removes a comment from a child.
	o	Arguments:
		o	n: If n is...
			1)	text, that attribute is removed.
			2)	numeric, that index is removed.

o	/xml_child.SetAttribute()
	Sets the attribute of a child.
	o	Arguments:
		o	attribute: The attribute to set.
		o	value: The value.
	o	Returns:
		o	Boolean: True on success; false on failure.

o	/xml_child.SetAttributesList()
	Sets the attributes to a new list.
	o	Arguments:
		o	list/l: A list of data.
	o	Returns:
		o	Boolean: True on succes; false on failure.

o	/xml_child.SetContent()
	Sets the content.
	o	Arguments:
		o	c: The value to set the content to.
	o	Returns:
		o	Boolean: True on success; false on failure.

o	/xml_child.SetName()
	Sets the name (tag) of the child.
	o	Arguments:
		o	n: The new name.

o	/xml_child.ToList()
	Converts the data in the children to lists (if not already).

o	/xml_child.ToParams()
	Converts the data in the children to params (if not already).

-----------------------------------------------------------------------
Preprocessors Macros:

o	LIST_MODE (1)
	Used to tell the /xml_handler and /xml_child datums that the mode
	for data is for lists.

o	PARAMS_MODE (2)
	Used to tell the /xml_handler and /xml_child datums that the mode
	for data is for parameter strings.

o	POST (1)
	Used to indicate comments are placed after the attribute.

o	PRE (2)
	Used to indicate comments are placed before the attribute.

o	SIDE (3)
	Used to indicate comments are placed beside the attribute.

o	SILENT_FAIL (1)
	Used to indicate that any errors should only be output to the
	Options & Messages window.

o	LOUD_FAIL (2)
	Used to indicate that any errors should be output to both the
	Options & Messages window and an active output window.

o	ENDING_CLOSE (1)
	Used internally to indicate a tag is an ending tag.

o	BEGINNING_CLOSE (2)
	Used internally to indicate a tag is a beginning tag.

*/