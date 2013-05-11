///VARS////

atom/movable/var
	random

var/list/o//olayas
var/tmp/Chuuners=0
var
	conmr=3//max of regen passives
	medmr=5//max of 5 med passives
	strmr=10


mob
	var
		//////SAVED LOCATION//
		last_x=0
		last_y=0
		last_z=0
		////PLAYER VARS/////
		health=1500
		max_health=1500//1.5k health
		chakra=1000
		max_chakra=1000//1k chakra
		energy=300
		max_energy=300
		tmp/healthregen=7
		tmp/chakraregen=4
		tmp/energyregen=10
		life=100
		max_life=100
		exp=1
		maxexp=1
		tmp/inbed=0

		tmp/learningcurve=40
		blevel=1
		contribution=0
		attribute_Points=0
		tmp/testingg=0
		supplies=50
		tmp/fixjutsus=0
		killmedalset=0
		dummy=0
		allowedswitch=0

		resistance=1
		tmp/resistanceplus=0
		tmp/resistanceboost=0
		tmp/resistanceminus=0
		resistancemain=1

		chakraforce=1
		tmp/chakraforceplus=0
		tmp/chakraforceboost=0
		tmp/chakraforceminus=0
		chakraforcemain=1

		agility=1
		tmp/agilityplus=0
		tmp/agilityboost=0
		tmp/agilityminus=0
		agilitymain=1

		dexterity=1
		tmp/dexterityplus=0
		tmp/dexterityboost=0
		tmp/dexterityminus=0
		dexteritymain=1//var with added or reduced bonuses

		reflex=1
		tmp/reflexplus=0 //doesnt save boosts
		tmp/reflexboost=0
		tmp/reflexminus=0
		reflexmain=1

		strength=1
		tmp/strengthplus=0
		tmp/strengthboost=0
		tmp/strengthminus=0
		strengthmain=1

		attackrate=10//speed of attacks
		dizzyrate=3//speed of regaining speed
		tmp/clicked=0//stop ppl spam clicking

/////////////////////TRAITS//////////////////////////////
		Trait=""
		Personality=""


		kills=0
		deaths=1
		rank="Student"
		rpgname=""
		namefirst=""
		tmp/rankp=0
		money=100
		bingo=0

		tmp/targeted
		tmp/points = 0
		tmp/koed=0
		tmp/tajon=0
		tmp/gateson=0
		tmp/inchuun=0

		tmp/energyregenboost=0
		Chuunreset=0
		tmp/inmove=0
/////////////////Village////////////////
		LeafS=0
		MistS=0
		SandS=0
		missingS=0
		villagedone=0
		Village=""
		baseVillage=""
		faction=""
		Clan = ""
		Clany = 0
		tmp/ko=0
		tmp/CShadow_Clone=0
		tmp/shadowout=0

		tmp/doing=0//so it doesn't save
		tmp/screener=new/list()
		tmp/protected=0
		tmp/hidestat=1
		tmp/mob/target=0
		tmp/stunned=0
		tmp/busy=0
		tmp/initialized=0
		tmp/sip=0
		tmp/skey=""
		tmp/old1x
		tmp/old1y
		oldx
		oldy
		oldz


		clicker=0
		tmp/clickedc=0
		tmp/inmortal=0
		tmp/spiders=0
		tmp/sandm=0

/////////////////////////OOC//////////////////

		//oocverbs
		mute=0
		tempmute=0
		talkcool=0
		talktimes=0
		talkcooling=0
		tmp/say=1
		tmp/setmed=0

		//olays
		weaponinv
		armorinv
		legarmorinv
		armarmorinv
		facearmorinv
		cloakinv
		shoesinv
		specialinv

		hair_type=0
		hair_red=0
		hair_green=0
		hair_blue=0
		hair_color="Black"
		//non olay

		eye_r=0
		eye_g=0
		eye_b=0
		tmp/pk=0
		tmp/dazed=0
		tmp/kawad=0

		///HYUUGA///
		tmp/jyuuken=0
		tmp/byakuganon=0
		tmp/hyuugablob=0

		//LEE//
		tmp/incombo=0
		tmp/combloc
		tmp/cangate=1
		tmp/cangate2=0
		tmp/cangate3=0
		tmp/cangate4=0
		tmp/cangate5=0
		tmp/teleattack=0
		tmp/diffgate=0
		tmp/diffgate2=0
		tmp/diffgate3=0
		tmp/diffgate4=0
		tmp/defending=0
		tmp/drillon=0
		tmp/canceled=0
		tmp/savedbloc
		tmp/barb=0
		tmp/Mistshop=0
		tmp/Leafshop=0
		tmp/Sandshop=0
		tmp/WAR=0
		tmp/inmeat
		warkills=0
		lee=0

		tmp/canregen=1
		tmp/ingen=0
		cantsave=0
		tmp/inwater=0
		tmp/working=0
		tmp/npcd=0
		lx=0
		ly=0
		lz=0
		pointsg=0
		tmp/incircle=0
		tmp/binded=""
		tmp/canimmortal=1
		tmp/chidorivalue=0
		icon_name=""

		tmp/proctorMist=0
		tmp/proctorLeaf=0
		tmp/proctorSand=0
		tmp/stillmove=0
		tmp/dazevalue=1
		factionll=0
		kage=0
		Orbshow=0
		tmp/willused=0
		tmp/dizzy=0
		tmp/lowen=0

		tmp/chargingchidori=0
		tmp/finishedchargingchidori=0
		tmp/chargerate=25
		tmp/canleech=0
		tmp/newleech=0


		/////////////////////attributes
		tmp/mysticpalms=0//ignore this its for mystic palms boi
		tmp/cep=0//ignore dis its for cep lol
		tmp/strengthnum=0
		medpassive=1
		strpoints=0
		rfxpoints=0
		intpoints=0
		conpoints=0
		conr=0
		medr=0//no med passives
		strr=0

		//////////////REQUIREMENTS////////
		list/requirements = list()
		list/Learned_Skills = list()
		list/Learned_Weps = list()






mob
  var/tmp/movedelay=3
  var/tmp/mdelay=0
  //var/tmp/canmove=1
  var/tmp/inshunsh=0
  var/tmp/runon=0


	//winset(src,"default","focus=true")






mob/var/list
	V


var/list				//-- Universal Lists
	IPs = list()		//-- Logs ALL IPs that enter the server.


var						//-- Universal Variables
	log = "<HR>"		//-- Server Chat Log



//chatbox
//	maxlines = 1000

mob
	var/missing=0
	proc
		Who()
			var/D={"
			<html>
			<head><title>Players Online: [players.len]!</title></head>
			<body>
			<h4>Players Online:[players.len]</h4>
			<STYLE>BODY {background: #5F5A59; color: Black}IMG.icon{width:32;height:32} </STYLE>
			<table border="1"
			bgcolor=#827B60>
			<tr>
			<th>Key</th>
			<th>Name</th>
			<th>Rank</th>
			</tr>
			"}

			for(var/mob/X in people)
				if(X.Village=="Leaf")
					D+={"<tr>
			<td bgcolor=#41A317>[X.key]</td>
			<td bgcolor=#41A317>[X.name]</td>
			<td bgcolor=#41A317>[X.rank]</td>
			</tr>"}

				if(X.Village=="Sand")
					D+={"<tr>
			<td bgcolor=#ffd700>[X.key]</td>
			<td bgcolor=#ffd700>[X.name]</td>
			<td bgcolor=#ffd700>[X.rank]</td>
			</tr>"}

				if(X.Village=="Mist")
					D+={"<tr>
			<td bgcolor=006699>[X.key]</td>
			<td bgcolor=006699>[X.name]</td>
			<td bgcolor=006699>[X.rank]</td>
			</tr>"}

				if(X.Village!="Leaf"&&X.Village!="Sand"&&X.Village!="Mist"&&X.Village)
					D+={"<tr>
			<td bgcolor=#C9C299>[X.key]</td>
			<td bgcolor=#C9C299>[X.name]</td>
			<td bgcolor=#C9C299>rogue</td>
			</tr>"}


			D+={"</table>
			</body>
			</html>"}

			return D

/*
var/list/setBounty = list() //The bounty variable.
mob
    npc/bhunter //bounty hunter npc
        icon = 'mob.dmi'
        icon_state = "zombie"
        Click() //When he's clicked...
            var/mob/M = input(src,"Do you want to place a bounty?","Bounty") as mob in world //prompt for who you wish to place a bounty upon
            var/amntSet = input(src,"How much is the bounty?","Bounty") as num //ask how much
            if(amntSet > 0)
                setBounty.Add(M)//if the bounty is higher than 0 and is not a negative number then set the bounty
                setBounty[M] = amntSet

    verb/Bounties() //Bounties verb
        for(var/p in setBounty) //loop thru everything in the list
            src<<"[p] and his bounty is [seBounty[player]]" //display it to the source.


*/

mob
	var/tmp/inhelp=0
	verb
		HELP()
			set category = null
			if(src.inhelp)
				src<< "dont spam buttons its probably what buged you in the first place -.-.."
				return
			src.inhelp=1
			src.client.eye=src
			if(src.indie)
				src<<"you are dying/dead."
				return
			src<<"Your account is being fixed. wait a minute."
			sleep(60)
			src<<"Fixing skill tree wait a second.."
			sleep(30)
			src.clickedc=0
			src<<"Fixing jutsus wait a second.."
			src.fixjutsus=1
			sleep(30)
			src.doing=0
			src<<"Fixing Moving.."
			sleep(30)
			src.canmove=1 // potential cheat?
			src<<"Fixing Regen.."
			sleep(30)
			src.canregen=1
			spawn() src.regeneration()
			src<<"Fixing verbs.."
			sleep(30)
			src.client.show_verb_panel=1
			src<<"Fixing icon.."
			sleep(30)
			src.overlays=null
			src.underlays=null
			src.Affirm_Icon()
			src.Load_Overlays()
			src<<"Restarting regen proc.."
			sleep(30)
			if(src.loc==null)
				src<<"Fixing black screen.."
				src.Respawn()
			if(src.loc==locate(44,7,1))
				src<<"Fixing Login screen bug.."
				src.Respawn()
			src<<"Account fixed.."
			src.inhelp=0
			//src.Respawn()//nar tht shud fix init beiii




mob/var/KD=0
mob
	verb
		NinjaCard()
			set category = null
			src<<"<font color=blue>Level Grade:[src.blevel]/100."
			src<<"<font color=blue>Rank:[src.rank]."
			var/d=src.kills/src.deaths
			src.KD=round(d)
			if(src.KD<0)
				src.KD=0
			src<<"Note:Your ninja rank affects what rank shinobi you are.."
			src<<"<font color=blue>Kill/Death ratio:[KD] kills per death."
			src<<"Note:Your Kill/Death ratio affects what rank shinobi you are.."
			var/Grade=src.blevel/5*KD
			src<<"<font color=blue>Ninja Grade:[Grade*2]%."
			if(src.rank=="Chuunin")
				Grade+=10
			if(src.rank=="Jounin")
				Grade+=20
			if(src.rank=="Elite Jounin")
				Grade+=30
			if(src.rank=="Kage")
				Grade+=40
			if(Grade>src.blevel&&src.KD>=5)
				src<<"<font color=green>You are currently an A-ranked shinobi with good skill."
				return
			if(Grade>src.blevel&&src.KD>=4)
				src<<"<font color=green>You are currently a B-ranked shinobi with good skill."
				return
			if(Grade>src.blevel&&src.KD>=3)
				src<<"<font color=green>You are currently a C-ranked shinobi with good skill."
				return
			if(Grade<src.blevel&&src.KD>=2)
				src<<"<font color=red>You are currently a B-ranked shinobi kill more people to improve your grade."
				return
			if(Grade<src.blevel&&src.KD>=1)
				src<<"<font color=red>You are currently a C-ranked shinobi kill more people to improve your grade."
				return
			if(Grade<src.blevel&&src.KD>=0)
				src<<"<font color=red>You are currently a D-ranked shinobi kill more people to improve your grade."









