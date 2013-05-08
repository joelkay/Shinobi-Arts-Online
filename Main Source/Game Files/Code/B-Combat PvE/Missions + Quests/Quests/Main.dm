Quest
	var
		mob/sponsor//person offering quest
		quest_obj_type//object(s) he needs
		quest_obj_num=1//ammount of objects he wants
		reward_obj_type//type of reward given
		reward_money=0//money given
		desc//description
		rank//rank of quest

	proc
		Check()
			var/mob/M
			var/obj/O
			var/list/l=list()
			if(!M in view(sponsor,1))return

			for(var/obj/x in M)
				if(x.type==quest_obj_type)
					l.Add(x)

			if(l.len>=quest_obj_num)//nuff itemz
				Reward(M,O)
				return 1

		Reward(mob/M,obj/O)
			if(reward_obj_type)
				var/obj/R = new reward_obj_type(M)
				M.Rew=R

			O.Move(sponsor)
			M.mon=reward_money
			M.money+=reward_money
			M.sponsor=sponsor
			M.object=O
			M.typeq=rank
			M.reward()


mob
	var/tmp
		Rew
		sponsor
		object
		typeq
		currnum
		descript
		mon


mob
	proc
		questgrid()
			set hidden=1
			src.UpdateQuests()
			src.Questcheck()


mob/proc/UpdateQuests()
	var/items = 0
	for(var/obj/scroll/X in src.contents)
		winset(src, "Cpanel-questgrid.quest", "current-cell=[++items]")
		src << output(X, "Cpanel-questgrid.quest")
	winset(src, "Cpanel-questgrid.quest", "current-cell=[items]")

