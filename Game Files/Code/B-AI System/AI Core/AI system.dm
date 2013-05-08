#define FRIENDLY   	  1
#define CHASE    	  2
#define BLOOD    	  4
#define RETALIATE 	  8
#define FLEES         16
#define REQUESTS_HELP 32
#define WALKBACK      64
#define WANDERS		  128
#define DoTL		  256
#define SEEVIOLENCE   512
#define FLEEING       1024
#define REQUESTEDHELP 2048
#define WANDERED      4096

#define HP           nstats["hp"]
#define MAXHP        nstats["maxhp"]
#define isclient(x)  istype(x,/client)
#define ismonster(x) istype(x,/monster)
/*
Design notes:
Ai intelligence. The smarter the AI is, the better it will perform. (1-5)
Ai flags:
	FRIENDLY        - it will not attack players.

	CHASE           - attacks a client upon seeing it
					- this cannot be used in conjunction with RETALIATE (it just doesn't make sense; monster spawning will fail)

	BLOOD	        - it will attack mobs with a lower level than itself
				    - it will look for players first, then look for monsters.
				    - a monster requires the CHASE flag for this to be effective.

    RETALIATE       - attack when attacked
                    - this cannot be used in conjunction with CHASE (doesn't make sense; spawning will fail)

	FLEES           - it will flee if it's health is low
					- the percentage that is considered low is user defined under "FleePercent"
					- FleePercent must be a decimal greater than zero, less than one

	REQUESTS_HELP   - it will call for help when it's hp is less than CallPercent
					- it will get help of everything within it's range*2 IF
					  their type is in it's affin list.

    WALKBACK        - walks back to initloc (set in /monster/New())
   					- this cannot be used in conjunction with WANDERS ("")

	WANDERS         - it just wanders around randomly.
					- this cannot be used in conjunction with WALKBACK ("")

	DoTL            - dissappears on ntarget loss (not immediately, however!)
					- does not mix with RETALIATE, WALKBACK, FLEES, FRIENDLY, or WANDERS
					- this AI setting is for things that get spawned as part of a special event
					- the flags CHASE and BLOOD will work, and are recommended..

	SEEVIOLENCE     - when a fellow monster (friendly is defined under certain terms..) we will fight too!
					- cannot be used with CHASE or BLOOD

	FLEEING			\
					 -- used for the fleeing/requesting/death procs
	REQUESTINGHELP  /
*/
proc/Log(info,file)
	file << info

mob/var/list/nstats =list("hp"=50,"maxhp"=50)
monster
	parent_type=/mob

	var
		intelligence =1			//their intelligence, 1-5 (1 is least smart, 5 is most smart)

		speed        =7			//their speed, in ticks

		flags					//bit flag holder

		CallPercent  =0			//the percentage of health at which the monster will call for help

		FleePercent  =0			//the chance that they flee, .0001, .001, .1, .99, just has to be less than 1

		range        =6			//range, their line of vision

		staydist	 =0			//how many tiles they'll stay away from someone. you don't want
								//magicians in the front line, do you?
		step_limit   =126

		current_place=0			//this is just used by "list/path"

		mob/ntarget				//this is the actual ntarget.

		turf/initloc			//the starting location of the monster, used for walkback

		list/affin   =list()	//the monsters affinities, this has to be a type path
								//this is used when the monster REQUESTS_HELP

		list/path    =list()	//this is the path that monsters will take when they are
								//walking back (WALKBACK)

	proc/percentcheck(fraction)
					//fraction must be a decimal <1
		if(fraction>1 || fraction<=0)return FALSE
		if(MAXHP*fraction>HP)        return TRUE
		return FALSE

	I_Don\'t_Walk_Far\!
		flags=WANDERS
		step_limit=3

	Help_Me\!
		flags=CHASE|FLEES|REQUESTS_HELP
		affin=list(/monster/Wandering_Guy,/monster/Retaliation)
								//this monster will summon the help of wandering guys, and retaliations
								//beware! monsters that don't normally acquire ntargets can, when put
								//in another monsters affin list, obtain ntargets and fight!
		icon_state="flees"
		CallPercent=0.99

	Buddha_Worshipper
		flags=FRIENDLY|CHASE|BLOOD
		icon_state="friendly"	//you're better off not asking.

	I_Get_Close
		flags=CHASE
		icon_state="aos"
		staydist=2				//this means he'll be two tiles away from you, and he won't get any closer.

	Fleeing_Monster
		flags = FLEES|WANDERS|RETALIATE
		FleePercent=0.30		//he will flee at 30% of his max health
		icon_state="flees"

	Blood_Hungry
		flags = BLOOD|CHASE|WALKBACK
		level=5					//he will attack anything that's lower than his level
		icon_state="aos"

	Wandering_Guy
		flags = WANDERS			//he just wanders around...
		icon_state="wanders"

	I_Got_Spawned
		flags = CHASE|WANDERS|DoTL
		icon_state="aosspawn"	//this guys has to get spawned, and when he loses sight of you
								//he poofs. special effects such as a cloud of dust could make this an
								//amazing effect.

	Boom_Headshot
		flags = CHASE|WANDERS	//he will chase you. and only you. he does not want other monsters
		icon_state="aos"

	Retaliation
		flags = RETALIATE|WALKBACK
		icon_state="wanders"	//he will.. retaliate.. if you attack him. he also walks back to his initloc

	Puny_Monster
		flags = WANDERS
		level = 1				//this is just used to show that blood will attack other monsters
		icon_state="wandersweak"

	Helps_Fight
		flags = SEEVIOLENCE|RETALIATE
		level = 4				//he sees people fight, and when he does, he fights too!
		icon_state="wanders"


	proc/AI()
		//error checking
		if((flags & CHASE) && (flags & RETALIATE))
			Log("Monster spawning failed. CHASE + RETALIATE != work.","lobby/lobby/error.txt")
			del src

		if((flags & WANDERS) && (flags & WALKBACK))
			Log("Monster spawning failed. WANDERS + WALKBACK != work.","lobby/lobby/error.txt")
			del src

		while(src)

			//fleeing segment
			if((percentcheck(FleePercent) && (flags & FLEES)) || (flags & FLEEING))
				flags |= FLEEING
				while(flags & FLEEING)
					if(ntarget)	step_away(src,ntarget,"[text2num(isclient(ntarget) ? ntarget.client.view : 8)]")
					else        step_rand(src)
					sleep(speed-2<=2 ? 3 : speed-2)

			//ntarget checking
			if(ntarget)
				//calling for help segment, a segment within a segment!
				if(percentcheck(CallPercent) && (flags & REQUESTS_HELP) && !(flags & REQUESTEDHELP))
					for(var/monster/m in oview(range*2,src))
						if((m.flags & FLEES) && (m.level < ntarget.level))
							m.flags |= FLEEING

						else if(m.type in affin)
							m.ntarget=ntarget

					hearers(range*2,src) << "[src] called out for help!"
					flags |= REQUESTEDHELP

				switch(intelligence)
					if(1,2)
						var/mob/m=ntarget
						if(m && (m in oview(7,src)))

							if(get_dist(src,m)>1)
								step_to(src,m,staydist)

							else
								dir=get_general_dir(src,m)
								Attack(m)
					if(3)
						var/mob/m=ntarget
						if(m && (m in oview(7,src)))
							if((m.level>level) && (flags & FLEES))
								if(isclient(m))step_away(src,m,m.client.view)
								else step_away(src,m,7)
							else

								if(get_dist(src,m)>1)
											//farther than one tile..
									step_to(src,m,m.client ? \
											//is it a client?
										staydist+1>m.client.view ? \
											//yes: is staydist+1 greater than their view?
											m.client.view : staydist+1 : \
											//no: just use staydist+1
												staydist+1)
											//not a client, still use staydist+1

								else
									dir=get_general_dir(src,m)
									Attack(m)
					if(4,5)
						var/mob/m=ntarget
						if(m && (m in oview(7,src)))
							if( ( m.level > ( level+round ( intelligence*1.5 ) ) ) && ( flags & FLEES ) )
								if(isclient(m))step_away(src,m,m.client.view)
								else step_away(src,m,7)
							else

								if(get_dist(src,m)>1)
									step_to(src,m,m.client ? \
										staydist+2>m.client.view ? \
											m.client.view : staydist+2 : \
												staydist+1)

								else
									dir=get_general_dir(src,m)
									Attack(m)

			//CHASE segment
			if((flags & CHASE) && !ntarget)
				world << 2
				if((flags & BLOOD) && !ntarget)
					if(!(flags & FRIENDLY))
						for(var/player/p in oview(7,src))

							if(p && !ntarget)
								switch(intelligence)
									if(1 to 3)
										ntarget=p
										break
									if(4,5)
										if(p.level<level)
											ntarget=p
											break
					if(!ntarget)
						for(var/monster/m in oview(7,src))

							if(m && !ntarget)
								switch(intelligence)
									if(1 to 3)
										ntarget=m
										break
									if(4,5)
										if(m.level<(level+intelligence))
											ntarget=m
											break
				else
					if(!(flags & FRIENDLY))
						for(var/player/p in oview(7,src))
							if(p && !ntarget)
								switch(intelligence)
									if(1 to 3)
										ntarget=p
										break
									if(4,5)
										if(ntarget.level<level)
											ntarget=p
											break

			//wandering segment
			if((flags & WANDERS) && !ntarget)
				if(get_dist(src,initloc)>=step_limit)
					flags|= WANDERED
					flags&=~WANDERS
					flags|= WALKBACK
											//if we're too far away (step_limit) from our initloc,
				else													//don't go too far..
					step_rand(src)


			//death on ntarget loss..
			if((flags & DoTL) && !ntarget)
				spawn(speed*10)
					//give them a chance, eh?
					if(!ntarget)	del src


			//walkback segment
			if((flags & WALKBACK) && !ntarget && loc != initloc)
				if(!path && !percentcheck(FleePercent) && loc != initloc)
					path = AStar(loc,initloc,/turf/proc/AdjacentTurfs,/turf/proc/Distance)
					spawn while(!ntarget && !percentcheck(FleePercent) && path && loc != initloc)
						Move(path[++current_place > path.len ? path.len : current_place])
						sleep(speed)
			//~fin
			if(loc==initloc)
				current_place=0
				dir=SOUTH
				path=null
				if(flags & WANDERED)
					flags &= ~WALKBACK
					flags &= ~WANDERED
					flags |= WANDERS

			if(ntarget)
				current_place=0
				path=null
				if(!(ntarget in oview(7,src)))ntarget=null

			sleep((z in player_z_list) ? (ntarget ? ((ntarget in oview(1)) ? speed : speed/3) : speed) : speed*5)

	New()
		..()
		initloc=loc
		spawn(rand(1,50))
			AI()

proc/get_general_dir(atom/ref,atom/ntarget)
	if(ntarget.z > ref.z) return UP
	if(ntarget.z < ref.z) return DOWN

	var/d = get_dir(ref,ntarget)
	if(d&d-1)        // diagonal
		var/ax = abs(ref.x - ntarget.x)
		var/ay = abs(ref.y - ntarget.y)
		if(ax >= (ay << 1))      return d & (EAST|WEST)   // keep east/west (4 and 8)
		else if(ay >= (ax << 1)) return d & (NORTH|SOUTH) // keep north/south (1 and 2)
	return d

var/list/player_z_list=list()
		//this will hold all the player z's

proc/z_layer_check()
	spawn while(world)
		player_z_list=new/list()
		for(var/client/c)
			if(c.mob)
				player_z_list+=c.mob.z
		sleep(10)


world/New()
	..()
	z_layer_check()
		//this proc is there to keep the AI's speed in check. There's no use having it run
		//around at full speed when there's no one around, right?
