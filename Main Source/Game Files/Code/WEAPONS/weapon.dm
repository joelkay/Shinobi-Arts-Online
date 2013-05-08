/*
mob
	verb
		jutsufix()
			var/jutsu=input
				if(jutsu)
					usr.cooldown["jutsu]"]=0
					return
*/

mob
	var/sworded=0
	var/swordtype=""

Weapon
	parent_type = /Skill/

	supplies=0
	cooldown=0

	mouse_drag_pointer ='drag.dmi'
/*
	MouseDrop(obj/over_object,src_location,over_location,src_control,over_control,params)
		if(istype(over_object,/obj/macros/wepmacro1))
			for(var/obj/macros/wepmacro1/A in usr.client.screen)
				usr.wepmacro1=src.name
				A.name="[usr.wepmacro1]"
				usr.wepmacro1supps=src.supplies
				usr.wepmacro1cool=src.cooldown
				A.icon_state="[src.icon_state]"
				usr.wepmacro1sindex="[usr.wepmacro1]"
		if(istype(over_object,/obj/macros/wepmacro2))
			for(var/obj/macros/wepmacro2/A in usr.client.screen)
				usr.wepmacro2=src.name
				A.name="[usr.wepmacro2]"
				usr.wepmacro2supps=src.supplies
				usr.wepmacro2cool=src.cooldown
				A.icon_state="[src.icon_state]"
				usr.wepmacro2sindex="[usr.wepmacro2]"

*/

	Sword
		name="Sword"
		icon='skills.dmi'
		icon_state="Sword"
		supplies=0
		cooldown=3
		sindex="Sword"

	KSword
		name="KSword"
		icon='skills.dmi'
		icon_state="KSword"
		supplies=0
		cooldown=2
		sindex="KSword"

	Kunai
		name="Kunai"
		icon='weapons.dmi'
		icon_state="kunai"
		supplies=1
		cooldown=10
		sindex="Kunai"

		Bump()//hit
			..()
			del(src)

	Shuriken//add bump procs
		name="Shuriken"
		icon='weapons.dmi'
		icon_state="shuriken"
		supplies=3
		cooldown=15
		sindex="Shuriken"

		Bump()
			..()
			del(src)

/*
	Kunai
		icon='weapons.dmi'
		icon_state="kunai"
		armor="special"



	Shuriken
		icon='weapons.dmi'
		icon_state="shuriken"
		armor="special"
*/