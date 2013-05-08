mob/NPC/Questmob
	icon='basewhite.dmi'
	name="Quest Giver"
	var/quests[0]
	verb/getquest()  //get a new quest
		set src in view()
		var/Quest/q = RandQuest()

		var/obj/scroll/missionscroll/D = new /obj/scroll/missionscroll
		D.sponsor=q.sponsor//person giving quest
		D.quest_obj_type=q.quest_obj_type//object(s) he needs
		D.quest_obj_num=q.quest_obj_num//ammount of objects he wants
		D.reward_obj_type=q.reward_obj_type//type of reward given
		D.reward_money=q.reward_money//money given
		D.descr=q.desc//description
		D.rank=q.rank//rank of quest

		usr.contents+=D

		quests += q
	//	usr.retrieve_scroll_mission()

	verb/endquest()  //finish quest
		set src in view()
		var/Quest/q
		for(q in quests)
			if(q.Check())
				quests -= q

				for(var/obj/scroll/missionscroll/E in src.contents)
					if(E.desc==q.desc)
						del(E)
				return

	proc/RandQuest()
		var/qtype = pick(typesof(/Quest) - /Quest)
		var/Quest/q = new qtype()
		q.sponsor = src
		return q




	//Questmob2





obj/scroll
	missionscroll
		icon='missionscroll.dmi'
		var
			sponsor//person offering quest
			quest_obj_type//object(s) he needs
			quest_obj_num=1//ammount of objects he wants
			reward_obj_type//type of reward given
			reward_money=0//money given
			descr//description
			rank//rank of quest
			progress=0//percent completion


		Click()
			var/mob/M=usr
			M.money+=reward_money
			M.sponsor=sponsor
			M.descript=descr
			M.currnum=src.progress()
			M.typeq=rank
			M.check()


		proc/progress()
			var/mob/M=usr
			var/list/l=list()
			for(var/obj/x in M.contents)
				if(x.type==quest_obj_type)
					l.Add(x)
			var/num=round(l.len/quest_obj_num)
			var/percent=num*100
			return percent

mob
	proc
		Questcheck()
			set category = null
			var/D={"
<html>
<head><title>Quests</title></head>
<body>
<h4>Quests status</h4>
<STYLE>BODY {background: #5F5A59; color: Black}IMG.icon{width:32;height:32} </STYLE>
<table border="1"
bgcolor=#827B60>
<tr>

<th>Sponsor</th>
<th>Rank</th>
<th>Progress</th>


</tr>
"}

			for(var/obj/scroll/missionscroll/M in src)
				D+={"<tr>
			<td bgcolor=#41A317>[M.sponsor]</td>
			<td bgcolor=#41A317>[M.rank]</td>
			<td bgcolor=#41A317>[M.progress()]% complete</td>
			</tr>"}

			D+={"</table>
</body>
</html>"}


			src<<browse(D,"window=questinfo;[htmlop2]")






var/htmlop2 = "border=0;can_close=0;can_resize=0;can_minimize=0;titlebar=0"