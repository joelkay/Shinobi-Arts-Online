proc/createfiller()
	var/Filler = {"
	<html>
	<body><STYLE>BODY {background: black; color: white}</STYLE>

	<b>Players Online<font color = green>:[players.len]</b><br>
    <br>
	<font color = white>World Info<br>

	<b><font color = green>Leaf Economy:[Leafprices]</b><br>
	<b><font color = yellow>Sand Economy:[Sandprices]</b><br>
	<b><font color = blue>Mist Economy:[Mistprices]</b><br>
	</body>
	</html>
	"}
	return Filler





mob
	proc
		fillers()
			usr << browse(Main,"window=Updates;[htmlop]")//User Browses The Filler 1 Window
			usr << browse(createfiller(),"window=updatesbrowser2;[htmlop]")//User Browses The Filler 2 Window
