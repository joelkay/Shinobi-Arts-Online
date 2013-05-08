/*
Quest/name
	quest_obj_type//object(s) he needs
	quest_obj_num=1//ammount of objects he wants
	reward_obj_type//type of reward given
	reward_money=0//money given
	desc//description
	rank//rank of quest
*/


obj
	quest
		bonenecklace
		wolfpaw

obj
	reward
		scroll

Quest/Necklace
   quest_obj_type = /obj/quest/bonenecklace
   quest_obj_num=3
   reward_obj_type = /obj/reward/scroll
   reward_money=500//money given
   desc = "Kill brown wolves and bring me back 3 minion bone necklaces.!"
   rank="D"


Quest/Paw
   quest_obj_type = /obj/quest/wolfpaw
   quest_obj_num=5
   reward_obj_type = /obj/reward/scroll
   reward_money=1500//money given
   desc = "Kill blue wolves and bring me back 5 minion bone necklaces.!"
   rank="C"
