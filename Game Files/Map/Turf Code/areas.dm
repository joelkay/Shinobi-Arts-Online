//#include <dantom/htmllib> // re include the dantom lib


area
	var/tmp
		safe=0

	nopkzone
		safe=1
		Entered(a)
			if(ismob(a))
				var/mob/A=a
				A.pk=0
			..()

	pkzone
		safe=0
		Entered(a)
			if(ismob(a))
				var/mob/A=a
				A.pk=1
			..()



	dense_dark
		icon='black.dmi'
		density=1
		opacity=1






obj/triggerable
   proc/SteppedOn(atom/movable/a)

   proc/SteppedOff(atom/movable/a)

mob/cutscene
   proc/SteppedOn(atom/movable/a)


turf
	Entered(atom/movable/A)
		for(var/obj/triggerable/O in src.contents) //loop through the (triggerable) objs in the entered turf
	      //alert each one that A 'stepped on' it, except A itself
			if(O != A) //in case A is also triggerable
				O.SteppedOn(A)

turf
	Exited(atom/movable/A)
		for(var/obj/triggerable/O in src.contents) //loop through the (triggerable) objs in the entered turf
	      //alert each one that A 'stepped on' it, except A itself
			if(O != A) //in case A is also triggerable
				O.SteppedOff(A)
/*
		for(var/mob/cutscene/C in src) //loop through the (triggerable) objs in the entered turf
	      //alert each one that A 'stepped on' it, except A itself
			if(C != A) //in case A is also triggerable
				C.SteppedOn(A)
			..()

*/

turf

	dense
		icon='denseobj.dmi'
		density=1
