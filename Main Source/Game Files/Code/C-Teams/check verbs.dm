mob
	verb
		Team_info()
			set category = "Teams"
			if(!src.teamname)
				src<<"You not in a team.."
				return
			var/D=generate2()
			src<<browse(D,"window=Team Info;can_close=1;can_minimize=0;can_resize=0;size=500x300")


mob
	proc
		generate2()
			var/Team/x=new/Team
			x.teamname=src.teamname
			x.load()
			src<<"loading [x.teamname] config files.."
			var/a=list2params(x.members)
			var/c=x.members.len
			var/z=x.maxmembers-c
			var/D={"
	<html>
	<head><title>Team Info</title></head>
<style type="text/css">
body
{
	background-color: #000000;
	color: #ffffff;
}
</style>

	<font color=green>
	Team :[x.teamname]</A><br/>

	Leader = [x.leader]<br/>

	Member list = [a]<br/>

	Spots Left: [z]<br/>

	Shared Exp so far = [x.sharedexp]<br/>

"}
			return D





mob
	verb
		show_teams()
			set category = "Teams"
			var/A=generate3()
			src<<browse(A,"window=Show Teams;can_close=1;can_minimize=0;can_resize=0;size=500x600")//decreased the size it was abit too big



mob
	proc
		generate3()
			if(Teams==null||!Teams.len)//if no teams list is found
				var/A={"
				<font color=green>
				<center>No Files Found<br/>
				"}
				return A//tell the user that there is no team list

			var/A={"

	<html>
	<head><title>Show Teams</title></head>
	<center>Current Teams
	<style type="text/css">
	body
	{
		background-color: #000000;
		color: #ffffff;
	}

	</style>
	"}
			for(var/m in Teams)
				var/Team/x=new/Team
				x.teamname=m
				x.load()
				if(!x.leader)continue
				var/a=list2params(x.members)
				A+={"

		<center><font color=green>
		<center>Team :[x.teamname]</A><br/>

		<center>Leader = [x.leader]<br/>

		<center>Member list = [a]<br/>

		<center>Shared Exp so far = [x.sharedexp]<br/>

	"}


				return A






