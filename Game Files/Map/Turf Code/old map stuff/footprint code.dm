obj
    footprintse
        icon = 'sandtracks.dmi'
        icon_state = "enter"

    footprintsexit
        icon = 'sandtracks.dmi'
        icon_state = "enter"

obj
    rfootprintse
        icon = 'sandtracksrun.dmi'
        icon_state = "enter"

    rfootprintsexit
        icon = 'sandtracksrun.dmi'
        icon_state = "enter"

turf
	FootprintSand
		Entered(mob/M)//when entering
			if(src.overlays)//if theres stuff there.
				return
			if(istype(M,/mob))//check if a mob is entering
				if(M.runon)//if running
					var/obj/rfootprintse/F = new/obj/rfootprintse
					F.loc = locate(M.x,M.y,M.z)
					F.dir = M.dir
					spawn(30) del(F)//wait 3 secs before the delete.

				else
					var/obj/footprintse/F = new/obj/footprintse
					F.loc = locate(M.x,M.y,M.z)
					F.dir = M.dir
					spawn(30) del(F)//wait 3 secs before the delete.

		Exited(mob/M)//when exiting
			if(istype(M,/mob))//check if a mob is entering
				if(M.runon)//if running
					var/obj/rfootprintsexit/F = new/obj/rfootprintsexit
					F.loc = locate(M.x,M.y,M.z)
					F.dir = M.dir
					spawn(30) del(F)//wait 3 secs before the delete.

				else
					var/obj/footprintsexit/F = new/obj/footprintsexit
					F.loc = locate(M.x,M.y,M.z)
					F.dir = M.dir
					spawn(30) del(F)//wait 3 secs before the delete.




        //Kay any turf under this will get fottprints on it when entered for example the lightsand below.

/*
        turf/FootprintSand/name....
*/

