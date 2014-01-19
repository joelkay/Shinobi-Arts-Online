/*
-----------------------------------------------------------------------------
Copyright (C) 2010

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
-----------------------------------------------------------------------------

n_Logging v1.0
	This library provides an easy way to keep logs. Besides the library itself,
	a demo, this documentation, and a Log Viewer application are also included.

LogViewer.exe
	The log viewer makes it easy to monitor long and complex logs. It allows
	you to view, sort, and filter log entries, however it can only read the
	default XML output format included with this library. For more information,
	run the program and go to Help > General.

	Note: 	The log viewer requires Microsoft .NET 2.0 or later (and should also
			run on the Mono equivalent for Linux users). If you have Windows XP
			or newer then you probably already have it.

n_Logging Contents
	Actions
		An action that is logged by the record() proc may be any
		string, however for consistency's sake several actions are defined
		as constants:
			ACTION_DEBUG 	Defined only in debug mode, use for debug messages.
			ACTION_MESSAGE 	A generic log message.
			ACTION_ERROR	An error ocurred.
			ACTION_STARTUP	The server started.
			ACTION_SHUTDOWN The server shut down.
			ACTION_BAN		A player was banned.
			ACTION_KICK		A player was kicked.
			ACTION_MUTE		A player was muted.
			ACTION_SAY		A chat message was sent.

	Globals
		logger
			This var is the logger used by the record() and debug() procs and is
			automatically instantiated when the world starts. Use logger.SetOutput()
			to change the output format from the default of XML.

		record(action = ACTION_MESSAGE, user = null, target = null, notes = null)
			Logs an event.
			**Arguments**
				All arguments are optional and should be text.
				action 		the type of event being logged.
				user 		the user who performed the action (eg the admin who banned a player)
				target 		the user the action was performed upon (eg the player who was banned)
				notes	 	miscellaneous information about the event.

		debug(message)
			Logs a debug message. This proc is only defined when in debug mode
			(ie the DEBUG constant is defined). It is useful if you want to avoid
			accidentally including debug messages when the game is released.
			**Arguments**
				message	the message to log.

	/logger
		The /logger type simply keeps track of each event being logged,
		records some information such as the time, and sends it to an /output
		object to be logged. A global logger var exists and is instantiated
		automatically, so you should never need to create one yourself unless
		you want to multiple logs separate from each other.

		Public Procs
			New(output)
				Creates a new logger.
				**Arguments**
					output	an /output object used to write events to a log.

			SetOutput(output)
				Changes the location of the log.
				**Arguments**
					output	the new /output object used to write events to a log.

	/output
		The /output object handles writing event to a log. You may extend this type
		to support new log formats.

		Procs
			New(loc = null)
				Creates a new /output object.
				**Arguments**
					loc		the location of the log, for example a file path.

			GetStartID()
				Called once by /logger to get the latest event ID that already exists in the log,
				or 0 if the log is empty or doesn't exist.

			WriteEvent(event)
				Writes an /event to a log.
				**Arguments**
					event	the event to log.

	/output/xml
		This output format writes events to an xml file. Specify the file path in
		the constructor. This is the default output type as long as the NO_XML
		constant is not defined.

	/output/default
		This format uses BYOND's default output operator (<<) to write to a log.
		The loc argument in the constructor may be anything that output may be sent to,
		for example 'world', a player, or a file. If loc is null, then it defaults to
		world.log.
*/