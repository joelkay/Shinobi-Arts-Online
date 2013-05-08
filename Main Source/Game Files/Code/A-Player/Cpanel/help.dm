mob
	proc
		CpanelHelp()
			var/D={"
<html>
<head><title>Cpanel help</title></head>
<body>
<STYLE>BODY {background: #5F5A59; color: Black}IMG.icon{width:32;height:32} </STYLE>
<table border="1"

bgcolor=black>
<tr>
<th><font color=orange>Command</font></th>
<th><font color=orange>Use:</font></th>

</tr>
"}

			D+={"<tr>
				<td bgcolor=orange>save</td>
				<td bgcolor=orange>Manualy Saves the game</td>
				</tr>"}

			D+={"<tr>
				<td bgcolor=orange>skills</td>
				<td bgcolor=orange>Displays the skills grid</td>
				</tr>"}


			D+={"<tr>
				<td bgcolor=orange>who</td>
				<td bgcolor=orange>Shows online players</td>
				</tr>"}


			D+={"<tr>
				<td bgcolor=orange>quests</td>
				<td bgcolor=orange>Lists all quests</td>
				</tr>"}

			D+={"<tr>
				<td bgcolor=orange>map</td>
				<td bgcolor=orange>Renders the map into a viewable image</td>
				</tr>"}


			D+={"<tr>
				<td bgcolor=orange>chatoptions</td>
				<td bgcolor=orange>Some chat tools</td>
				</tr>"}

			D+={"<tr>
				<td bgcolor=orange>inventory</td>
				<td bgcolor=orange>Brings up the equipment pane</td>
				</tr>"}

			D+={"<tr>
				<td bgcolor=orange>updates</td>
				<td bgcolor=orange>Shows updates done to the game</td>
				</tr>"}

			D+={"<tr>
				<td bgcolor=orange>skilltree</td>
				<td bgcolor=orange>Shows the skill tree</td>
				</tr>"}

			D+={"<tr>
				<td bgcolor=orange>bountylist</td>
				<td bgcolor=orange>views the current bounties</td>
				</tr>"}


			D+={"<tr>
				<td bgcolor=red>testhouse</td>
				<td bgcolor=red>temporarily re-added for performance tests</td>
				</tr>"}

			D+={"<tr>
				<td bgcolor=red>verblist</td>
				<td bgcolor=red>temp verb list</td>
				</tr>"}




			D+={"</table>
</body>
</html>"}
			src<<browse(D,"window=Cpanel-browse,size=314x368,can_resize=0,can_minimize=0")









