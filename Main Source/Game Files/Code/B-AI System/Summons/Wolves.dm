mob/NPC
	Wolfreg//starter wolves
		name="Minion Wolf"
		icon='Wolf brown.dmi'
		max_health=1000
		max_chakra=200
		life=50
		summonnpc=1
		pk=1
		lastpicked="attacked"//attack animation
		reflexmain = 5
		dexteritymain = 5
		resistancemain = 5
		strengthmain = 5
		chakraforcemain =5
		agilitymain = 5

		proc/DeathDrop(mob/M)
			for(var/obj/scroll/missionscroll/E in src.contents)
				if(E)
					if(E.quest_obj_type==/obj/quest/bonenecklace)
						var/obj/drop=new/obj/quest/bonenecklace
						M.contents+=drop
						M<<"<font color=blue><font size=3> You recieved a bone necklace"


	Wolfexp//medium level wolfs
		name="Guard Wolf"
		icon='Wolf blue.dmi'
		max_health=5000
		max_chakra=2000
		life=50
		summonnpc=1
		pk=1
		lastpicked="attacked"
		reflexmain = 15
		dexteritymain = 15
		resistancemain = 15
		strengthmain =15
		chakraforcemain =15
		agilitymain = 15

		proc/DeathDrop(mob/M)
			for(var/obj/scroll/missionscroll/E in src.contents)
				if(E)
					if(E.quest_obj_type==/obj/quest/wolfpaw)
						var/obj/drop=new/obj/quest/wolfpaw
						M.contents+=drop
						M<<"<font color=blue><font size=3> You recieved a wolf paw"


	Wolfboss//summon level wolfs
		name="Wolf Boss"
		icon='Wolf yellowgold.dmi'
		max_health=8000
		max_chakra=5000
		life=100
		summonnpc=1
		pk=1
		lastpicked="attacked"
		reflexmain = 50
		dexteritymain = 50
		resistancemain = 50
		strengthmain = 50
		chakraforcemain =50
		agilitymain = 50


