mob
	proc
		JutsuCheck()

			var/D={"
<html>
<head><title>Jutsu's</title></head>
<body>
<STYLE>BODY {background: #5F5A59; color: Black}IMG.icon{width:32;height:32} </STYLE>
<table border="1"
bgcolor=#827B60>
<tr>
<th>Jutsu</th>
<th>Level</th>
<th>Uses</th>
<th>Uses_till_Levelup</th>
<th>Jutsu_Kills</th>
</tr>
"}
			var/Skill/S
			if(src.client)
				for(S in src.contents)
					if(S.rank=="D")
						D+={"<tr>
				<td bgcolor=#41A317>[S.name]([S.rank])</td>
				<td bgcolor=#41A317>[S.level]</td>
				<td bgcolor=#41A317>[S.uses]</td>
				<td bgcolor=#41A317>[S.nextlevel-S.uses]</td>
				<td bgcolor=#41A317>[S.kills]</td>
				</tr>"}
					if(S.rank=="C")
						D+={"<tr>
				<td bgcolor=#41A317>[S.name]([S.rank])</td>
				<td bgcolor=#41A317>[S.level]</td>
				<td bgcolor=#41A317>[S.uses]</td>
				<td bgcolor=#41A317>[S.nextlevel-S.uses]</td>
				<td bgcolor=#41A317>[S.kills]</td>
				</tr>"}
					if(S.rank=="B")
						D+={"<tr>
				<td bgcolor=#41A317>[S.name]([S.rank])</td>
				<td bgcolor=#41A317>[S.level]</td>
				<td bgcolor=#41A317>[S.uses]</td>
				<td bgcolor=#41A317>[S.nextlevel-S.uses]</td>
				<td bgcolor=#41A317>[S.kills]</td>
				</tr>"}
					if(S.rank=="A")
						D+={"<tr>
				<td bgcolor=#41A317>[S.name]([S.rank])</td>
				<td bgcolor=#41A317>[S.level]</td>
				<td bgcolor=#41A317>[S.uses]</td>
				<td bgcolor=#41A317>[S.nextlevel-S.uses]</td>
				<td bgcolor=#41A317>[S.kills]</td>
				</tr>"}
					if(S.rank=="S")
						D+={"<tr>
				<td bgcolor=#41A317>[S.name]([S.rank])</td>
				<td bgcolor=#41A317>[S.level]</td>
				<td bgcolor=#41A317>[S.uses]</td>
				<td bgcolor=#41A317>[S.nextlevel-S.uses]</td>
				<td bgcolor=#41A317>[S.kills]</td>
				</tr>"}








			D+={"</table>
</body>
</html>"}
			src<<browse(D,"window=Jutsu-browse,size=500x400")


