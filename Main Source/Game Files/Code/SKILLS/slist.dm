var/list/slist=list()
var/list/starterlist=list()

proc
	initiateslist()
		set background=1
		slist=new
//////////RATON/////////////
		slist += newlist(/Skill/Chidori_Blade,/Skill/Chidori_Nagashi,/Skill/Chidori)

//////KATON/////////

		slist += newlist(/Skill/Multiple_FirePoenix,/Skill/Fireblast,/Skill/Mystic_Fire_Dragon,)

//////Suiton///////

		slist += newlist(/Skill/Suiton_Wave,/Skill/Suiton_GiantWave,/Skill/Suiton_Dragon,/Skill/Suiton_Shark)

////////////////////////////MEDICAL/////////////////////////////

		slist += newlist(/Skill/Medic)

////DOTON////////
		slist += newlist(/Skill/Chamber_of_Nothingness,/Skill/Chamber_Leech,/Skill/Doton_MudBullets)//7

/////////CLONES + RASENGAN////////////

		slist += newlist(/Skill/KageShadow_Clone,/Skill/TajuuKageShadow_Clone,/Skill/Rasengan,/Skill/Oodama_Rasengan)//6oodama

//////NARA//////////////////////////////////

		slist += newlist(/Skill/Shadow_possesion,/Skill/Shadow_possesion_Cancel,/Skill/Shadow_NeckBind,/Skill/Shadow_Needles)

////Uchiha/////////////////////////

		slist += newlist(/Skill/Sharingan_lvl1,/Skill/Sharingan_lvl2,/Skill/Sharingan_lvl3,/Skill/Sharingancopy,/Skill/Mangekyo_Sharingan)//5mangeky

///////////HYUUGA////////////////

		slist += newlist(/Skill/Byakugan,/Skill/Jyuuken,/Skill/Kaiten,/Skill/sixtyfour_palms)

/////////////GAARA////////////

		slist += newlist(/Skill/Sand_shield,/Skill/Sand_control,/Skill/Sand_cancel,/Skill/Sand_shuriken,/Skill/Sand_spike,/Skill/Desert_coffin)

/////////////////DEIDARA//////////////////

		slist += newlist(/Skill/Clay_clone,/Skill/Explode_spider,/Skill/C3,/Skill/Explode_bird,/Skill/Multiple_bird,/Skill/Flying_Bird)

////////////////////HAKU///////////////////////

		slist += newlist(/Skill/ice_needles,/Skill/ice_freeze,/Skill/ice_mirrors)

///////////////////////AKIMICHI//////////////////////////

		slist += newlist(/Skill/Spinach_pill,/Skill/Meattank,/Skill/Curry_pill,/Skill/Chilli_pill,/Skill/Sizeup)//4size

/////////////Jashin////////////////////////////////////

		slist += newlist(/Skill/Bloodbind,/Skill/Bloodbind_Cancel,/Skill/Self_Harm,/Skill/Immortal,/Skill/Self_Heal,/Skill/Jashin_circle)

///////////////////////////////KAGUYA/////////////////////////

		slist += newlist(/Skill/Bone_Drill,/Skill/Bone_Bullets,/Skill/Bone_Sword,/Skill/Sawarabi,/Skill/Bone_Armour,/Skill/Bone_ArmourCancel)

/////////////////////Puppet///////////

		slist += newlist(/Skill/puppet1,/Skill/puppet2,/Skill/puppet3,/Skill/Puppet_Transformation_Technique,/Skill/Puppet_Knives,/Skill/Puppet_Shield,/Skill/Puppet_Crush,/Skill/Poison_Bomb)

/////////MEDIC////////////

		slist += newlist(/Skill/Medic,/Skill/Mystic_Palm,/Skill/Chakra_Enforced_Punch,/Skill/Rebirth)


/////////LEE////////////////////

		slist += newlist(/Skill/Lotus,/Skill/Gate1,/Skill/Gate2,/Skill/Gate3,/Skill/Gate4,/Skill/Gate5)//3

/////FUUTON/////////

		slist += newlist(/Skill/Fuuton_Sweep,/Skill/Fuuton_Blast,/Skill/Fuuton_Slice,/Skill/Fuuton_Tornado)


/////////////SUMMONS////////////////////

		slist += newlist(/Skill/Frog_Summon,/Skill/Slug_Summon,/Skill/Snake_Summon,/Skill/Bee_Summon)//2

////////GENJUTSU//////////

		slist += newlist(/Skill/Sleepgen)//1

		return slist



	StarterList(mob/M)
		starterlist=new

//////////RATON/////////////
		starterlist += newlist(/Skill/Chidori_Blade,/Skill/Chidori_Nagashi,/Skill/Chidori)

//////KATON/////////

		starterlist += newlist(/Skill/Multiple_FirePoenix,/Skill/Fireblast,/Skill/Mystic_Fire_Dragon,)

//////Suiton///////

		starterlist += newlist(/Skill/Suiton_Wave,/Skill/Suiton_GiantWave,/Skill/Suiton_Dragon,/Skill/Suiton_Shark)

////////////////////////////MEDICAL/////////////////////////////

		starterlist += newlist(/Skill/Medic)

////DOTON////////
		//starterlist += newlist(/Skill/Chamber_of_Nothingness,/Skill/Chamber_Leech,/Skill/Doton_MudBullets)//7

/////////CLONES + RASENGAN////////////

		starterlist += newlist(/Skill/KageShadow_Clone,/Skill/TajuuKageShadow_Clone,/Skill/Rasengan)//,/Skill/Oodama_Rasengan)//6oodama

//////NARA//////////////////////////////////
		if(M.Clan=="Nara")
			starterlist += newlist(/Skill/Shadow_possesion,/Skill/Shadow_possesion_Cancel,/Skill/Shadow_NeckBind,/Skill/Shadow_Needles)

////Uchiha/////////////////////////
		if(M.Clan=="Uchiha")
			starterlist += newlist(/Skill/Sharingan_lvl1,/Skill/Sharingan_lvl2,/Skill/Sharingan_lvl3,/Skill/Sharingancopy)//,/Skill/Mangekyo_Sharingan)//5mangeky

///////////HYUUGA////////////////
		if(M.Clan=="Hyuuga")
			starterlist += newlist(/Skill/Byakugan,/Skill/Jyuuken,/Skill/Kaiten,/Skill/sixtyfour_palms)

/////////////GAARA////////////
		if(M.Clan=="Gaara")
			starterlist += newlist(/Skill/Sand_shield,/Skill/Sand_control,/Skill/Sand_cancel,/Skill/Sand_shuriken,/Skill/Sand_spike,/Skill/Desert_coffin)

/////////////////DEIDARA//////////////////
		if(M.Clan=="Deidara")
			starterlist += newlist(/Skill/Clay_clone,/Skill/Explode_spider,/Skill/Explode_bird,/Skill/Multiple_bird)//,/Skill/Flying_Bird,//Skill/C3)

////////////////////HAKU///////////////////////
		if(M.Clan=="Haku")
			starterlist += newlist(/Skill/ice_needles,/Skill/ice_freeze,/Skill/ice_mirrors)

///////////////////////AKIMICHI//////////////////////////
		if(M.Clan=="Akimichi")
			starterlist += newlist(/Skill/Spinach_pill,/Skill/Meattank,/Skill/Curry_pill,/Skill/Chilli_pill,/Skill/Sizeup)//4size

/////////////Jashin////////////////////////////////////
		if(M.Clan=="Jashin")
			starterlist += newlist(/Skill/Bloodbind,/Skill/Bloodbind_Cancel,/Skill/Self_Harm,/Skill/Immortal,/Skill/Self_Heal,/Skill/Jashin_circle)

///////////////////////////////KAGUYA/////////////////////////
		if(M.Clan=="Kaguya")
			starterlist += newlist(/Skill/Bone_Drill,/Skill/Bone_Bullets,/Skill/Bone_Sword,/Skill/Sawarabi,/Skill/Bone_Armour,/Skill/Bone_ArmourCancel)

/////////////////////Puppet///////////
		if(M.Clan=="Puppet")
			starterlist += newlist(/Skill/puppet1,/Skill/puppet2,/Skill/puppet3,/Skill/Puppet_Transformation_Technique,/Skill/Puppet_Knives,/Skill/Puppet_Shield,/Skill/Puppet_Crush,/Skill/Poison_Bomb)

/////////MEDIC////////////

		//starterlist += newlist(/Skill/Medic,/Skill/Mystic_Palm,/Skill/Chakra_Enforced_Punch,/Skill/Rebirth)


/////////LEE////////////////////

		//starterlist += newlist(/Skill/Lotus,/Skill/Gate1,/Skill/Gate2,/Skill/Gate3,/Skill/Gate4,/Skill/Gate5)//3

/////FUUTON/////////

		starterlist += newlist(/Skill/Fuuton_Sweep,/Skill/Fuuton_Blast,/Skill/Fuuton_Slice,/Skill/Fuuton_Tornado)


/////////////SUMMONS////////////////////

		//starterlist += newlist(/Skill/Frog_Summon,/Skill/Slug_Summon,/Skill/Snake_Summon,/Skill/Bee_Summon)//2

////////GENJUTSU//////////

		//starterlist += newlist(/Skill/Sleepgen)//1

		return starterlist


