mob
	var
		chosen=0
		bunsh=0
		tmp/num=1




obj
	skills
		layer=9



Skill
	parent_type = /obj/

	var
		chakracost=0//chakra cost
		sindex=""//skill it performs
		sealtime=0//time to perform
		supplies=0//supplies it takes
		tmp/clicked=0
		tmp/cooldown=0//temp/dynamic cooldown
		maxcooldown=0//constant number
		reqs=0//needs a requirement
		reqsdef=""//define requirement
		percent=0//percent of chakra used
		uses=0//uses
		kills=0//kills
		level=0//level
		nextlevel=10//uses left till next level...default of 10 at start.
		rank="D"//rank


	mouse_drag_pointer ='drag.dmi'

	MouseDrop(obj/over_object,src_location,over_location,src_control,over_control,params)

		if(istype(over_object,/obj/Macros))
			for(var/obj/Macros/A in usr.client.screen)
				if(A==over_object)
					A.overlays+=image('skills.dmi',icon_state = src.icon_state)
					usr.macro["[A.number]"]=src.type//assoc list starting from one etc...
					A.copied=src.type


		else
			return








////////////////////////////////MACRO CODE ABOVE///////////////////////////////////////////////

	proc
		clicker()
			var/waittime=2//ammount of seconds you should wait before being able to click

			if(usr.kalled||usr.doing)
				if(debug)usr<<output("cooled[usr.kalled] doing[usr.doing]", "combatlog")
				return// click once every 3 secs pl0x

			usr.looop=world.time+(waittime*10)
			usr.cool_skill()
			if(debug)usr<<output("(clicker) Executed: cooled[usr.kalled] doing[usr.doing]", "combatlog")

			if(clicked)
				if(world.time<cooldown)// if the ting is cooling lyk
					var/time=(cooldown-world.time)/10
					usr<<output("You have to wait [round(time)] seconds to use this skill again", "combatlog")
					return

			src.clicked=1

			if(!usr.pk)
				usr<<"You are in a non pk zone"
				src.clicked=0

				return


			else
				if(usr.chakra>src.chakracost&&src.canbedone())
					cooldown=world.time+(maxcooldown*10)
					src.chakracost()//work out the costs
					usr.chakra-=src.chakracost//edit

					///////////////////////////////EXECUTE//////////////////////////////////
					spawn()	usr.hseals(sindex,level)//proc to exicute jutsu     <<-- execute jutsu
					///////////////////////////////EXECUTE/////////////////////////////////////

					uses++

					spawn() src.levelcheck()
					spawn() src.whileloop()




				else if(usr.chakra<chakracost)
					usr<<output("Not enough chakra [usr.chakra]/[chakracost]", "combatlog")
					usr.doing=0
					src.clicked=0

					return




	Click()
		clicker()




	proc
		whileloop()
			set background=1
			var/mob/M=usr


			if(cooldown<=world.time&&M)//check if hes still online

				src.clicked=0//can use this skill again
				usr.UpdateSkills()//this is for icons i guess that overlay refresh ever 10 secs

			else
				spawn(10) whileloop()//reiterate



	proc
		canbedone()
			var/mob/M=usr
			var/d=src.reqs
			if(!d)
				return 1

			if(d in M.requirements)//check if they are legible
				return 1//go ahead

			else
				M << output("[src.name]: [src.reqsdef]", "combatlog")
				return 0//cant do jutsu/waste exp



		chakracost()
			if(src.percent)
				var/mob/M =usr
				var/cost=src.percent/100 * M.max_chakra
				src.chakracost=cost


		levelcheck()
			if(level>=50)//max level of 50
				return
			if(uses>=nextlevel)

				src<<"<font color=blue>[src] Leveled Up.</font>"
				src.nextlevel+=((usr.blevel)+20)
				src.level++

				if(level==1)
					usr.client.screen+=new/obj/levels/one

				if(level==5)
					usr.client.screen+=new/obj/levels/five

				if(level==10)
					usr.client.screen+=new/obj/levels/ten

				if(level==15)
					usr.client.screen+=new/obj/levels/fifteen

				if(level==30)
					usr.client.screen+=new/obj/levels/thirty

				if(level==50)
					usr.client.screen+=new/obj/levels/fifty
					src<<"<font color=blue>[src] has been mastered to S rank level.</font>"
					src.rank="S"

				spawn(20)
					for(var/obj/levels/H in usr.client.screen)
						del(H)






	////BASE JUTSUS//////
	Shadow_Clone
		name="Shadow Clone"
		icon='skills.dmi'
		icon_state="Shadow_Clone"
		chakracost=80
		cooldown=15
		maxcooldown=15
		sealtime=0
		sindex="Shadow_Clone"

	Transformation_Technique
		name="Transformation Technique"
		icon='skills.dmi'
		icon_state="Transformation_Technique"
		chakracost=100
		cooldown=50
		maxcooldown=50
		sealtime=0
		sindex="Transformation_Technique"

	Body_Replacement_Technique
		name="Body Replacement Technique"
		icon='skills.dmi'
		icon_state="Body_Replacement_Technique"
		percent=5//takes 5 percent of users chakra pool
		cooldown=90
		maxcooldown=90
		sealtime=0
		sindex="Body_Replacement_Technique"

	Body_Flicker
		name="Body Flicker"
		icon='skills.dmi'
		icon_state="Body_Flicker"
		chakracost=20
		cooldown=2
		maxcooldown=2
		sealtime=0

		sindex="Body_Flicker"



	////RATON/////
	Chidori_Blade
		name="Chidori Blade"
		icon='skills.dmi'
		icon_state="Chidori_Blade"
		chakracost=200
		cooldown=100
		maxcooldown=100
		sealtime=4
		sindex="Chidori_Blade"

	Chidori
		name="Chidori"
		icon='skills.dmi'
		icon_state="Chidori"
		chakracost=200
		cooldown=60
		maxcooldown=60
		sealtime=3
		sindex="Chidori"

	Chidori_Nagashi
		name="Chidori Nagashi"
		icon='skills.dmi'
		icon_state="Chidori_Nagashi"
		chakracost=70
		cooldown=40
		maxcooldown=40
		sindex="Chidori_Nagashi"

	Raikiri
		name="Raikiri"
		icon='skills.dmi'
		icon_state="raikiri"
		chakracost=500
		cooldown=300
		maxcooldown=300
		sindex="Raikiri"






	////DOTON////
	Chamber_of_Nothingness
		name="Chamber of Nothingness"
		icon='skills.dmi'
		icon_state="Chamber_of_Nothingness"
		chakracost=120
		cooldown=50
		maxcooldown=50
		sindex="Chamber_of_Nothingness"
	Chamber_Leech
		name="Chamber_Leech"
		icon='skills.dmi'
		icon_state="Chamber_Leech"
		chakracost=200
		cooldown=60
		maxcooldown=60

		sindex="Chamber_Leech"
	Doton_River
		name="Doton_River"
		icon='skills.dmi'
		icon_state="Doton_River"
		chakracost=350
		cooldown=30
		maxcooldown=30
		sindex="Doton_River"
	Doton_MudBullets
		name="Doton_MudBullets"
		icon='skills.dmi'
		icon_state="Doton_MudBullets"
		chakracost=350
		cooldown=80
		maxcooldown=80
		sindex="Doton_MudBullets"



	////Suiton///
	Suiton_Dragon
		name="Suiton_Dragon"
		icon='skills.dmi'
		icon_state="Water_Dragon"
		chakracost=150
		cooldown=60
		maxcooldown=60
		sindex="Suiton_Dragon"
	Suiton_Wave
		name="Suiton_Wave"
		icon='skills.dmi'
		icon_state="Suiton Wave"
		chakracost=120
		cooldown=40
		maxcooldown=40
		sindex="Suiton_Wave"
	Suiton_Shark
		name="Suiton_Shark"
		icon='skills.dmi'
		icon_state="Suiton_Shark"
		chakracost=350
		cooldown=50
		maxcooldown=50
		sindex="Suiton_Shark"
	Suiton_GiantWave
		name="Suiton_GiantWave"
		icon='skills.dmi'
		icon_state="Suiton_GiantWave"
		chakracost=350
		cooldown=80
		maxcooldown=80
		sindex="Suiton_GiantWave"


	////FUUTON///
	Fuuton_Tornado
		name="Fuuton_Tornado"
		icon='skills.dmi'
		icon_state="Fuuton_Tornado"
		chakracost=350
		cooldown=30
		maxcooldown=30
		sindex="Fuuton_Tornado"

	Fuuton_Blast
		name="Fuuton_Blast"
		icon='skills.dmi'
		icon_state="Fuuton_Blast"
		chakracost=350
		cooldown=40
		maxcooldown=40
		sindex="Fuuton_Blast"

	Fuuton_Sweep
		name="Fuuton_Sweep"
		icon='skills.dmi'
		icon_state="Fuuton_Sweep"
		chakracost=550
		cooldown=20
		maxcooldown=20
		sindex="Fuuton_Sweep"

	Fuuton_Slice
		name="Fuuton_Slice"
		icon='skills.dmi'
		icon_state="Fuuton_Slice"
		chakracost=350
		cooldown=50
		maxcooldown=50
		sindex="Fuuton_Slice"


	////Uchiha///
	Sharingan_lvl1
		name="Sharingan 1"
		icon='skills.dmi'
		icon_state="Sharingan_lvl1"
		chakracost=150
		cooldown=50
		maxcooldown=50
		sindex="Sharingan_lvl1"

	Sharingan_lvl2
		name="Sharingan 2"
		icon='skills.dmi'
		icon_state="Sharingan_lvl2"
		chakracost=250
		cooldown=50
		maxcooldown=50
		sindex="Sharingan_lvl2"

	Sharingan_lvl3
		name="Sharingan 3"
		icon='skills.dmi'
		icon_state="Sharingan_lvl3"
		chakracost=350
		cooldown=50
		maxcooldown=50
		sindex="Sharingan_lvl3"

	Sharingancopy
		name="Sharingancopy"
		icon='skills.dmi'
		icon_state="Sharingancopy"
		chakracost=50
		cooldown=60
		maxcooldown=60
		sindex="Sharingancopy"


	Mangekyo_Sharingan
		name="Mangekyo"
		icon='skills.dmi'
		icon_state="mangekyo"
		chakracost=10
		cooldown=150
		maxcooldown=150
		sindex="Mangekyo_Sharingan"



	////Puppet///
	puppet1
		name="puppet1"
		icon='skills.dmi'
		icon_state="puppet1"
		chakracost=300
		cooldown=20
		maxcooldown=20
		sindex="puppet1"
	puppet2
		name="puppet2"
		icon='skills.dmi'
		icon_state="puppet2"
		chakracost=300
		cooldown=20
		maxcooldown=20
		sindex="puppet2"
	puppet3
		name="puppet3"
		icon='skills.dmi'
		icon_state="puppet3"
		chakracost=300
		cooldown=20
		maxcooldown=20
		sindex="puppet3"

	Puppet_Knives
		name="Puppet_Knives"
		icon='skills.dmi'
		icon_state="Puppet_Knives"
		chakracost=100
		cooldown=20
		maxcooldown=20
		sindex="Puppet_Knives"

	Puppet_Transformation_Technique
		name="Puppet_Transformation_Technique"
		icon='skills.dmi'
		icon_state="Puppet_Transformation_Technique"
		chakracost=200
		cooldown=10
		maxcooldown=10
		sindex="Puppet_Transformation_Technique"
	Poison_Bomb
		name="Poison_Bomb"
		icon='skills.dmi'
		icon_state="Poison_Bomb"
		chakracost=200
		cooldown=40
		maxcooldown=40

		sindex="Poison_Bomb"
	Puppet_Crush
		name="Puppet_Crush"
		icon='skills.dmi'
		icon_state="Puppet_Crush"
		chakracost=200
		cooldown=90
		maxcooldown=90
		sindex="Puppet_Crush"
	Puppet_Shield
		name="Puppet_Shield"
		icon='skills.dmi'
		icon_state="Puppet_Shield"
		chakracost=200
		cooldown=40
		maxcooldown=40

		sindex="Puppet_Shield"


	////Deidara///
	Clay_clone
		name="Clay_clone"
		icon='skills.dmi'
		icon_state="Clay_clone"
		chakracost=250
		cooldown=20
		maxcooldown=20
		sindex="Clay_clone"
	Explode_spider
		name="Explode_spider"
		icon='skills.dmi'
		icon_state="Explode_spider"
		chakracost=100
		cooldown=10
		maxcooldown=10
		sindex="Explode_spider"
	Explode_bird
		name="Explode_bird"
		icon='skills.dmi'
		icon_state="Explode_bird"
		chakracost=200
		cooldown=30
		maxcooldown=30
		sindex="Explode_bird"
	Multiple_bird
		name="Multiple_bird"
		icon='skills.dmi'
		icon_state="Multiple_bird"
		chakracost=300
		cooldown=40
		maxcooldown=40
		sindex="Multiple_bird"

	Flying_Bird
		name="Flying_Bird"
		icon='skills.dmi'
		icon_state="Flying_Bird"
		chakracost=80
		cooldown=5
		maxcooldown=5
		sindex="Flying_Bird"
	C3
		name="C3"
		icon='skills.dmi'
		icon_state="C3"
		chakracost=800
		cooldown=30
		maxcooldown=30
		sindex="C3"


	////Lee///
	Gate1
		name="Gate1"
		icon='skills.dmi'
		icon_state="Gate1"
		chakracost=50
		cooldown=80
		maxcooldown=80
		sindex="Gate1"
	Gate2
		name="Gate2"
		icon='skills.dmi'
		icon_state="Gate2"
		chakracost=50
		cooldown=80
		maxcooldown=80
		sindex="Gate2"
	Gate3
		name="Gate3"
		icon='skills.dmi'
		icon_state="Gate3"
		chakracost=50
		cooldown=80
		maxcooldown=80
		sindex="Gate3"
	Gate4
		name="Gate4"
		icon='skills.dmi'
		icon_state="Gate4"
		chakracost=50
		cooldown=80
		maxcooldown=80
		sindex="Gate4"
	Gate5
		name="Gate5"
		icon='skills.dmi'
		icon_state="Gate5"
		chakracost=50
		cooldown=80
		cooldown=80
		sindex="Gate5"
	GateCancel
		name="GateCancel"
		icon='skills.dmi'
		icon_state="GateCancel"
		chakracost=0
		cooldown=1
		maxcooldown=1
		sindex="GateCancel"
	Lotus
		name="Lotus"
		icon='skills.dmi'
		icon_state="Lotus"
		chakracost=100
		cooldown=30
		maxcooldown=30

		sindex="Lotus"




	////Medic///
	Medic
		name="Medic"
		icon='skills.dmi'
		icon_state="Medic"
		chakracost=150
		cooldown=4
		maxcooldown=4

		sindex="Medic"
	Mystic_Palm
		name="Mystic_Palm"
		icon='skills.dmi'
		icon_state="Mystic_Palm"
		chakracost=150
		cooldown=5
		maxcooldown=5

		sindex="Mystic_Palm"
	Cancel_MysticPalm
		name="Cancel_MysticPalm"
		icon='skills.dmi'
		icon_state="Cancel_MysticPalms"
		chakracost=0
		cooldown=1
		maxcooldown=1

		sindex="Cancel_MysticPalm"
	Chakra_Enforced_Punch
		name="Chakra_Enforced_Punch"
		icon='skills.dmi'
		icon_state="Chakra_Enforced_Punch"
		chakracost=150
		cooldown=10
		maxcooldown=10
		sindex="Chakra_Enforced_Punch"
	Rebirth
		name="Rebirth"
		icon='skills.dmi'
		icon_state="Rebirth"
		chakracost=150
		cooldown=350//unsure
		maxcooldown=350
		sindex="Rebirth"




/*




	////Weapons///
	Shadow_Clone_Kunai
		name="Uchiha"
		icon='skills.dmi'
		icon_state="Uchiha"
		chakracost=350
		cooldown=3
		sindex=3
	Levitating_blades
		name="Sharingan_lvl1"
		icon='skills.dmi'
		icon_state="Sharingan_lvl1"
		chakracost=350
		cooldown=3
		sindex=3
	WEP_Scatter
		name="Sharingan_lvl1"
		icon='skills.dmi'
		icon_state="Sharingan_lvl2"
		chakracost=350
		cooldown=3
		sindex=3
	Scroll_frenzy
		name="Sharingan_lvl1"
		icon='skills.dmi'
		icon_state="Sharingancopy"
		chakracost=350
		cooldown=3
		sindex=3

*/

	////Gaara///
	Sand_shield
		name="Sand_shield"
		icon='skills.dmi'
		icon_state="Sand_shield"
		chakracost=450
		cooldown=60
		maxcooldown=60
		sindex="Sand_shield"
	Sand_control
		name="Sand_control"
		icon='skills.dmi'
		icon_state="Sand_control"
		chakracost=40
		cooldown=40
		maxcooldown=40
		sindex="Sand_control"
	Sand_cancel
		name="Sand_cancel"
		icon='skills.dmi'
		icon_state="Sand_cancel"
		chakracost=0
		cooldown=1
		maxcooldown=1
		sindex="Sand_cancel"
	Sand_shuriken
		name="Sand_shuriken"
		icon='skills.dmi'
		icon_state="Sand_shuriken"
		chakracost=140
		cooldown=40
		maxcooldown=40
		sindex="Sand_shuriken"

	Sand_spike
		name="Sand_spike"
		icon='skills.dmi'
		icon_state="Sand_spike"
		chakracost=80
		cooldown=40
		maxcooldown=40
		sindex="Sand_spike"

	Desert_coffin
		name="Desert_coffin"
		icon='skills.dmi'
		icon_state="Desert_coffin"
		chakracost=350
		cooldown=480
		maxcooldown=80
		sindex="Desert_coffin"




	////Uzumaki///
	Rasengan
		name="Rasengan"
		icon='skills.dmi'
		icon_state="Rasengan"
		chakracost=150
		cooldown=60
		maxcooldown=60
		sindex="Rasengan"

	Oodama_Rasengan
		name="Oodama_Rasengan"
		icon='skills.dmi'
		icon_state="Oodama_Rasengan"
		chakracost=180
		cooldown=80
		maxcooldown=80
		sindex="Oodama_Rasengan"


	KageShadow_Clone
		name="KageShadow_Clone"
		icon='skills.dmi'
		icon_state="KageShadow_Clone"
		chakracost=100
		cooldown=10
		maxcooldown=10
		sindex="KageShadow_Clone"

	TajuuKageShadow_Clone
		name="TajuuKageShadow_Clone"
		icon='skills.dmi'
		icon_state="TajuuKageShadow_Clone"
		chakracost=300
		cooldown=40
		maxcooldown=10
		sindex="TajuuKageShadow_Clone"






	////Kaguya///
	Bone_Drill
		name="Bone_Drill"
		icon='skills.dmi'
		icon_state="Bone_Drill"
		chakracost=400
		cooldown=60
		maxcooldown=60
		sindex="Bone_Drill"

	Bone_Sword
		name="Bone_Sword"
		icon='skills.dmi'
		icon_state="Bone_Sword"
		chakracost=500
		cooldown=15
		maxcooldown=15
		sindex="Bone_Sword"

	Sawarabi
		name="Sawarabi"
		icon='skills.dmi'
		icon_state="Sawarabi"
		chakracost=800
		cooldown=100
		maxcooldown=100
		sindex="Sawarabi"

	Bone_Bullets
		name="Bone_Bullets"
		icon='skills.dmi'
		icon_state="Bone_Bullets"
		chakracost=500
		cooldown=10
		maxcooldown=10
		sindex="Bone_Bullets"

	Bone_Armour
		name="Bone_Armour"
		icon='skills.dmi'
		icon_state="Bone_Armour"
		chakracost=400
		cooldown=300
		maxcooldown=300
		sindex="Bone_Armour"

	Bone_ArmourCancel
		name="Bone_ArmourCancel"
		icon='skills.dmi'
		icon_state="Bone_ArmourCancel"
		chakracost=0
		cooldown=1
		maxcooldown=1
		sindex="Bone_ArmourCancel"



	////Hyuuga///
	Byakugan
		name="Byakugan"
		icon='skills.dmi'
		icon_state="Byakugan"
		chakracost=150
		cooldown=60
		maxcooldown=60
		sindex="Byakugan"

	Kaiten
		name="Kaiten"
		icon='skills.dmi'
		icon_state="Kaiten"
		chakracost=100
		cooldown=40
		maxcooldown=40
		sindex="Kaiten"


	Jyuuken
		name="Jyuuken"
		icon='skills.dmi'
		icon_state="Jyuuken"
		chakracost=100
		cooldown=20
		cooldown=20
		sindex="Jyuuken"

		reqs="byakugan"//NEW
		reqsdef="Turn on Byakugan"


	sixtyfour_palms
		name="sixtyfour_palms"
		icon='skills.dmi'
		icon_state="sixtyfour_palms"
		chakracost=350
		cooldown=255
		maxcooldown=255
		sindex="sixtyfour_palms"

		reqs="byakugan"//NEW
		reqsdef="Turn on Byakugan"






	////Akimichi///
	Meattank
		name="Meattank"
		icon='skills.dmi'
		icon_state="Meattank"
		chakracost=350
		cooldown=60
		maxcooldown=60
		sindex="Meattank"

	Curry_pill
		name="Curry_pill"
		icon='skills.dmi'
		icon_state="Curry_pill"
		chakracost=350
		cooldown=140
		maxcooldown=140
		sindex="Curry_pill"
	Sizeup
		name="Sizeup"
		icon='skills.dmi'
		icon_state="Sizeup"
		chakracost=350
		cooldown=50
		maxcooldown=50
		sindex="Sizeup"
	Spinach_pill
		name="Spinach_pill"
		icon='skills.dmi'
		icon_state="Spinach_pill"
		chakracost=350
		cooldown=130
		maxcooldown=130
		sindex="Spinach_pill"
	Chilli_pill
		name="Chilli_pill"
		icon='skills.dmi'
		icon_state="Chilli_pill"
		chakracost=350
		cooldown=550
		maxcooldown=550
		sindex="Chilli_pill"



	////Nara///

	Shadow_possesion
		name="Shadow possesion"
		icon='skills.dmi'
		icon_state="Shadow_possesion"
		chakracost=150
		cooldown=10
		maxcooldown=10
		sindex="Shadow_possesion"

	Shadow_possesion_Cancel
		name="Shadow possesion Cancel"
		icon='skills.dmi'
		icon_state="Shadow_Cancel"
		chakracost=0
		cooldown=1
		maxcooldown=1
		sindex="Shadow_possesion_Cancel"

	Shadow_NeckBind
		name="Shadow Neck Bind"
		icon='skills.dmi'
		icon_state="Shadow_NeckBind"
		chakracost=100
		cooldown=8
		maxcooldown=4
		sindex="Shadow_NeckBind"


	Shadow_Needles
		name="Shadow Needles"
		icon='skills.dmi'
		icon_state="Shadow_Needles"
		chakracost=450
		cooldown=80
		maxcooldown=80
		sindex="Shadow_Needles"




///////////Haku///

	ice_needles
		name="ice needles"
		icon='skills.dmi'
		icon_state="ice_needles"
		chakracost=350
		cooldown=40
		maxcooldown=40
		sindex="ice_needles"

	ice_freeze
		name="ice freeze"
		icon='skills.dmi'
		icon_state="ice_freeze"
		chakracost=550
		cooldown=50
		maxcooldown=50
		sindex="ice_freeze"

	ice_mirrors
		name="ice mirrors"
		icon='skills.dmi'
		icon_state="ice_mirrors"
		chakracost=400
		cooldown=80
		maxcooldown=80
		sindex="ice_mirrors"



	////Jashin///
	Bloodbind
		name="Bloodbind"
		icon='skills.dmi'
		icon_state="Bloodbind"
		chakracost=200
		cooldown=3
		maxcooldown=80
		sindex="Bloodbind"
	Bloodbind_Cancel
		name="Bloodbind_Cancel"
		icon='skills.dmi'
		icon_state="Bloodbind_Cancel"
		chakracost=0
		cooldown=1
		maxcooldown=1
		sindex="Bloodbind_Cancel"
	Self_Harm
		name="Self_Harm"
		icon='skills.dmi'
		icon_state="Self_Harm"
		chakracost=50
		cooldown=10
		maxcooldown=1
		sindex="Self_Harm"
	Immortal
		name="Immortal"
		icon='skills.dmi'
		icon_state="Immortal"
		chakracost=350
		cooldown=2499
		maxcooldown=2499
		sindex="Immortal"
	Self_Heal
		name="Self_Heal"
		icon='skills.dmi'
		icon_state="Self_Heal"
		chakracost=5
		cooldown=15
		maxcooldown=15
		sindex="Self_Heal"

	Jashin_circle
		name="Jashin_circle"
		icon='skills.dmi'
		icon_state="Jashin_circle"
		chakracost=150
		cooldown=3
		maxcooldown=3
		sindex="Jashin_circle"


///////////////SUMMONS//////////////////////////////

	Frog_Summon
		name="Frog_Summon"
		icon='skills.dmi'
		icon_state="Frog_Summon"
		chakracost=1500
		cooldown=100
		maxcooldown=100
		sindex="Frog_Summon"

	Bee_Summon
		name="Bee_Summon"
		icon='skills.dmi'
		icon_state="Bee_Summon"
		chakracost=1500
		cooldown=100
		maxcooldown=100
		sindex="Bee_Summon"

	Slug_Summon
		name="Slug_Summon"
		icon='skills.dmi'
		icon_state="Slug_Summon"
		chakracost=1500
		cooldown=100
		maxcooldown=100
		sindex="Slug_Summon"

	Snake_Summon
		name="Snake_Summon"
		icon='skills.dmi'
		icon_state="Snake_Summon"
		chakracost=1500
		cooldown=100
		maxcooldown=100
		sindex="Snake_Summon"



////////////////////Genjutsu///


	Sleepgen
		name="Sleepgen"
		icon='skills.dmi'
		icon_state="Sleepgen"
		chakracost=200
		cooldown=40
		maxcooldown=40
		sindex="Sleepgen"

/*

	Sleep_Gen
		name="Uchiha"
		icon='skills.dmi'
		icon_state="Uchiha"
		chakracost=350
		cooldown=3
		sindex=3


	Darkness_Gen
		name="Sharingan_lvl1"
		icon='skills.dmi'
		icon_state="Sharingan_lvl2"
		chakracost=350
		cooldown=3
		sindex=3

*/