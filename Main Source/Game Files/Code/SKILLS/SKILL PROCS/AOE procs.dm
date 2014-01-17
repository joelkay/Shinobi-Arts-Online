proc/Execution(path,radius,dmg,obst,var/mob/M)// object: range: damage: center: caster

	for(var/turf/T in orange(radius,obst))
		new path(T)

	for(var/mob/X in orange(radius,obst))
		if(X&&M)
			AoE_Damage(M,X,2,dmg)
			return 1


proc/Execution2(path,radius,obst,timeage,mob/M)// object: range: center: lasting time: caster
//	world<<"[path] [radius] [obst] [timeage] [M]"
	for(var/turf/T in orange(radius,obst))
		var/obj/triggerable/D = new path(T)
		if(path == /obj/triggerable/sleep)
			var/obj/triggerable/sleep/S = D
			S.time=timeage
			S.owner=M
		//	world<<"[S] [timeage] [M]"
	/*	for(var/obj/triggerable/sleep/D in orange(radius,obst))
			D.time=timeage
			D.owner=M */



proc/AoE_Damage(mob/A,mob/M,push,dmg)// A = caster, M = target
	var/D = dmg
	var/X = D
	if(M&&A)
		M.Dec_health(X,A,"AOE")
		if(M)
			M.PushEnemy(push,A.dir)


/*

/////////////////////////EXPLODE///////////////////////////////////////////////
//

Explosion
{

	var
	{
		Explosion/Queue/Q
	}

	New(Effect/theeffect)
	{
		var/loc
		var/pow
		var/dir
		var/dist
		var/lastdist = 0
		var/D

		Q = new()

		var/dirlist[] = list(NORTH,SOUTH,EAST,WEST,NORTHWEST,NORTHEAST,SOUTHWEST,SOUTHEAST)
		var/newpow = theeffect.Apply(theeffect.orig,theeffect.basepower,0)

		//Initialize the starting queue
		for(D in dirlist)
		{
			Q.L.Add(D)
			Q.L.Add(get_step(theeffect.orig,D))
			Q.L.Add(newpow)
			Q.L.Add(1)
		}

		while(Q.L.len)
		{
			dir = Q.Pop()
			loc = Q.Pop()
			pow = Q.Pop()
			dist = Q.Pop()
			if(lastdist != dist)
				if(theeffect.speed >= 0)
					sleep(theeffect.speed)
				lastdist = dist

			if(pow > 0 && loc)
			{
				//If there is only one bit set(ie: Cardinal direction)
				//this will return 0
				newpow = theeffect.Apply(loc,pow,dir)

				if(dir & (dir-1))
				{
					if(dir & NORTH)
					{
						Q.L.Add(NORTH)
						Q.L.Add(get_step(loc,NORTH))
						Q.L.Add(newpow)
						Q.L.Add(dist+1)
					}
					if(dir & SOUTH)
					{
						Q.L.Add(SOUTH)
						Q.L.Add(get_step(loc,SOUTH))
						Q.L.Add(newpow)
						Q.L.Add(dist+1)
					}
					if(dir & EAST)
					{
						Q.L.Add(EAST)
						Q.L.Add(get_step(loc,EAST))
						Q.L.Add(newpow)
						Q.L.Add(dist+1)
					}
					if(dir & WEST)
					{
						Q.L.Add(WEST)
						Q.L.Add(get_step(loc,WEST))
						Q.L.Add(newpow)
						Q.L.Add(dist+1)
					}
				}

				Q.L.Add(dir)
				Q.L.Add(get_step(loc,dir))
				Q.L.Add(newpow)
				Q.L.Add(dist+1)
			}
		}

	}

	Queue
	{
		var/L[]
		New()
		{
			L = new()
		}

		Del()
		{
			del(L)
		}

		proc
		{
			Pop()
			{
				. = L[1]
				L.Cut(1,2)
			}
		}
	}

}

*/