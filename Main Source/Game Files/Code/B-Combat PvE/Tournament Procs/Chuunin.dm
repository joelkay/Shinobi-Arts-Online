mob//chuunin vars
	var
		torwins=0
		tmp/counting=0
	var/tmp
		tourndied=0
		heavenscroll = 0
		earthscroll = 0
		cantest=1
		testing=0
		deathforest=0
		inforest=0
var/tmp
	Chunnintime=0
	Testime=0
	roundtwo=0



mob/proc
	Proceed()
		src.inforest=1
		src.pk=1//can atk
		src.deathforest=1
		src.random=pick(1,2)
		if(src.random==1)
			src.heavenscroll=1
			var/obj/items/heavenscroll/B = new/obj/items/heavenscroll
			B.loc = src
			src.life=100
			src.chakra=src.max_chakra
			src.health=src.max_health
			src.canregen=1
			spawn() src.regeneration()
			src<<"You have been given a Heaven Scroll.!"
			src<<"You have passed the first part of the exam! Good luck in the Forest of Death.."
			src<<"There is 1 tower in the middle of the map. You must ko someone who has the scroll you need or find your scroll on the ground. Then make your way to the tower doors as fast as possbile.."
			src<<"Even if you have both scrolls and die before makeing it to the tower you FAIL!"
		if(src.random==2)
			src.earthscroll=1
			var/obj/items/earthscroll/B = new/obj/items/earthscroll
			B.loc = src
			src.life=100
			src.chakra=src.max_chakra
			src.health=src.max_health
			src.canregen=1
			spawn() src.regeneration()
			src<<"You have been given a Heaven Scroll.!"
			src<<"You have passed the first part of the exam! Good luck in the Forest of Death.."
			src<<"There is 1 tower in the middle of the map. You must ko someone who has the scroll you need or find your scroll on the ground. Then make your way to the tower doors as fast as possbile.."
			src<<"Even if you have both scrolls and die before makeing it to the tower you FAIL!"
		src.random=pick(1,2,3,4,5,6,9,10)
		if(src.random==1)
			src.loc=locate("ChuuninExit1")
			return
		if(src.random==2)
			src.loc=locate("ChuuninExit2")
			return
		if(src.random==3)
			src.loc=locate("ChuuninExit3")
			return
		if(src.random==4)
			src.loc=locate("ChuuninExit4")
			return
		if(src.random==5)
			src.loc=locate("ChuuninExit5")
			return
		if(src.random==6)
			src.loc=locate("ChuuninExit6")
			return
		if(src.random==9)
			src.loc=locate("ChuuninExit9")
			return
		if(src.random==10)
			src.loc=locate("ChuuninExit10")
			return



obj/items
	earthscroll
		nottossable=1
		name = "Earth Scroll"
		icon = 'Earth.dmi'
		Click()
			if(src in oview(1))
				if(usr.koed)
					return
				//if(usr.earthscroll >= 1)
				//	usr<<"You already have this scroll"
				else
					src.loc = usr
					usr<<"You picked up a [src]"
					usr.earthscroll = 1

	heavenscroll
		nottossable=1
		name = "Scroll Of Heaven"
		icon = 'Heaven.dmi'
		Click()
			if(src in oview(1))
				if(usr.koed)
					return
				//if(usr.heavenscroll >= 1)
				//	usr<<"You already have this scroll"
				else
					src.loc = usr
					usr<<"You picked up a [src]"
					usr.heavenscroll = 1

turf
	LEAVEFOREST
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				var/earth=0
				var/heaven=0
				for(var/obj/items/heavenscroll/H in M.contents)
					if(H)
						heaven=1
				for(var/obj/items/earthscroll/S in M.contents)
					if(S)
						earth=1

				if(earth&&heaven)
					for(var/obj/items/heavenscroll/H in M.contents)
						if(H)
							del(H)

					for(var/obj/items/earthscroll/S in M.contents)
						if(S)
							del(S)

					world<<"<font color=blue>[M.name] has passed the second part of the chuunin exam</font>"
					M<<"Congratulations; Good luck on the last part of the chuunin!"
					M.inforest=0
					M.life=100
					M.chakra=M.max_chakra
					M.health=M.max_health
					M.canregen=1
					spawn() M.regeneration()
					M.pk=0
					M.deathforest=0
					M.earthscroll=0
					M.heavenscroll=0
					var/random=pick(0,1)
					if(random)
						M.loc = locate("ChuuninTourneyRoom")
					else
						M.loc = locate("ChuuninTourneyRoom2")
					M.inchuun=1//allow movement in small space.
					M.chuunin=1
					Candidates.Add(M)
					if(!Foreststart)// if not counting start the countdown
						Forestover=4
						Foreststart=1
						Chuuninfight()
					return
				else
					M<<"You dont have both scrolls.."

			else
				if(istype(A,/obj/)) del(A)


turf
	LEAVEARENA
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				world<<"[M] exited the Arena!.."
				M.tourndied = 1
				M.Respawn()


turf
	LEAVECHUUNEXAM
		density = 0
		Enter(A)
			if(ismob(A))
				var/mob/M = A
				M.Respawn()


var/tmp/Forestover=5
var/tmp/Foreststart=0


proc
	Chuuninfight()
		if(Forestover>4)
			return
		if(Forestover)
			world<<"<font color=green>[Forestover] minutes left untill part 2 of the chuunin exam ends.</font>"
			sleep(600)
			Forestover--
			Chuuninfight()
			return
		Chuunin=1
		for(var/client/c in players)
			var/mob/M=c.mob
			M.removejoin()
		world<<"<font color=green>part 2 of the chuunin exam has ended.</font>"
		Chunnintime=0
		for(var/mob/M in world)
			if(M.inforest==1)
				M.Respawn()
		world<<"Chuunin preliminaries have began!"
		if(!Candidates.len)
			for(var/client/c in players)
				var/mob/P=c
				P.removejoinchuunin()
			world<<"0 Players entered, chuunin cancelled.."
			return
		else
			world<<"Matches are now being sorted!"
			roundtwo=0//reset it.
			Chuunin_AI()




///////////TOURNY///////////////


var/tmp/Chuunin=0
var/tmp/inproc=0
var/tmp/list/Candidates = list()
var/tmp/list/Candidates2 = list()
var/tmp/list/Candidates3 = list()
mob/var/tmp/chuunin=0


mob
	proc
		joinchuunin()
			winset(src,null,{"
			war-button.text ="Join Chuunin";
			war-button.command ="JoinChuunin";
			war-button.is-visible ="true";

			spectate-button.text ="Spectate Chuunin";
			spectate-button.is-visible ="true";
			spectate-button.command ="SpectateRound";

			unspectate-button.text ="Stop Spectate";
			unspectate-button.is-visible ="true";
			unspectate-button.command ="UnSpectate";;
			"})


		removejoinchuunin()
			winset(src,null,{"
			war-button.is-visible ="false";
			spectate-button.is-visible ="false";
			unspectate-button.is-visible ="false";
			"})


mob
	verb
		Specatate_Round()
			set hidden=1
			if(Candidates.len)
				var/mob/M = input("Who do you wish to Spectate?") in Candidates + list("Cancel")
				if(M=="Cancel") return
				src.client.eye = M
				src<<"Spectating [M]"
				spectating=1


			if(Candidates2.len)
				var/mob/M = input("Who do you wish to Spectate?") in Candidates2 + list("Cancel")
				if(M=="Cancel") return
				src.client.eye = M
				src<<"Spectating [M]"
				spectating=1







mob
	verb
		JoinChuunin()
			set hidden=1
			if(Chunnintime&&src.rank=="Genin")
				src<<" Complete one of the tests set to carry on.."
				src.loc=locate("ChuuninRoomEnter")// chuunin place
				src.pk=0
				return
			src<<"Wait for an exam to be hosted. Or maybe your already chuunin :P"


proc
	Chuunin_AI3()
		/////////////////////////
		Chuunin=0//reset chuunin stuff??
		Foreststart=0
		inproc=0
		spawn(1200)
			Testime=0//resets after some time
		//////////////////////////
		world<<"<font color=blue>The Chuunin exams have ended.!"
		for(var/mob/K in Candidates3)
			K.Respawn()
			K.chuunin=0
			world<<"<b>[K] is now a Chunnin"
			K.rank = "Chunnin"
			Candidates3.Remove(K)
			world<<"<font color=blue>[K] got the medal Chuunin!</font>"
			world.SetMedal("Chuunin", K)
			K.intourn=0
			if(K.Village=="Leaf")
				for(var/obj/items/CVests/Leaf/G in K.contents)
					del(G)
				var/obj/items/CVests/Leaf/D = new /obj/items/CVests/Leaf
				K.contents+=D
				Leaf_Orb(2)
				K.contribution+=2
				world<<"<font color=green>[K.Village] gained Orb!</font>"

			if(K.Village=="Sand")
				for(var/obj/items/CVests/Sand/G in K.contents)
					del(G)
				var/obj/items/CVests/Sand/D = new /obj/items/CVests/Sand
				K.contents+=D
				Sand_Orb(2)
				K.contribution+=2
				world<<"<font color=green>[K.Village] gained Orb!</font>"

			if(K.Village=="Mist")
				for(var/obj/items/CVests/Mist/G in K.contents)
					del(G)
				var/obj/items/CVests/Mist/D = new /obj/items/CVests/Mist
				K.contents+=D
				Mist_Orb(2)
				K.contribution+=2
				world<<"<font color=green>[K.Village] gained Orb!</font>"


			for(var/client/c in players)
				var/mob/M=c.mob
				M.removejoinchuunin()
				M.client.eye = M
				M.chuunin=0









proc
	Chuunin_AI()
		if(roundtwo)
			return

		if(Candidates.len==0)
			world<<"<font color=blue>The second rounds are now begining:</font>"
			roundtwo=1
			Chuunin_AI2()
			return

		if(Candidates.len==1)
			for(var/mob/C in Candidates)
				Candidates.Remove(C)
				Candidates2.Add(C)
			world<<"<font color=blue>The second rounds are now begining:</font>"
			roundtwo=1
			Chuunin_AI2()
			return

		else
			var/tmp/mob/A=pick(Candidates)
			var/tmp/mob/B=pick(Candidates)
			if(A==B||!A||!B)
				Chuunin_AI()
				return
			sleep(10)
			world<<"Chuunin Announcer: Okay lets start this match!"
			sleep(20)
			world<<"Chuunin Announcer: This match will be...."
			sleep(30)
			world<<"Chuunin Announcer: [A] .VS. [B]!"
			B.loc=locate("Opponent1") /// locate them to a specific place.
			A.loc=locate("Opponent2") /// locate them to a specific place.
			A.inchuun=0//allow movement in small space.
			B.inchuun=0//allow movement in small space.
			A.tourndied = 0
			B.tourndied = 0
			A.intourn = 1// for death proc
			B.intourn = 1
			A.pk=1
			B.pk=1// can attack eachother
			A.canmove=0
			B.canmove=0
			sleep(20)
			world<<"Chuunin Announcer: 3!"
			sleep(10)
			world<<"Chuunin Announcer: 2!"
			sleep(10)
			world<<"Chuunin Announcer: 1!"
			sleep(10)
			world<<"Chuunin Announcer: Fight!"
			A.canmove=1
			B.canmove=1
			A.canarr=0
			B.canarr=0
			Battle(A,B)
			return

proc
	Chuunin_AI2()
		if(roundtwo)

			if(Candidates2.len==0)
				world<<"<font color=blue>The second rounds have ended:</font>"
				roundtwo=0
				Chuunin_AI3()
				return

			if(Candidates2.len==1)
				for(var/mob/C in Candidates2)
					Candidates2.Remove(C)
					Candidates3.Add(C)
				world<<"<font color=blue>The second rounds have ended:</font>"
				roundtwo=0
				Chuunin_AI3()
				return

			else
				var/tmp/mob/A=pick(Candidates2)
				var/tmp/mob/B=pick(Candidates2)
				if(A==B||!A||!B)
					Chuunin_AI2()
					return
				sleep(10)
				world<<"Chuunin Announcer: Okay lets start this match!"
				sleep(20)
				world<<"Chuunin Announcer: This match will be...."
				sleep(30)
				world<<"Chuunin Announcer: [A] .VS. [B]!"
				B.loc=locate("Opponent1") /// locate them to a specific place.
				A.loc=locate("Opponent2") /// locate them to a specific place.
				A.inchuun=0//allow movement in small space.
				B.inchuun=0//allow movement in small space.
				A.tourndied = 0
				B.tourndied = 0
				A.intourn = 1// for death proc
				B.intourn = 1
				A.pk=1
				B.pk=1// can attack eachother
				A.canmove=0
				B.canmove=0
				sleep(20)
				world<<"Chuunin Announcer: 3!"
				sleep(10)
				world<<"Chuunin Announcer: 2!"
				sleep(10)
				world<<"Chuunin Announcer: 1!"
				sleep(10)
				world<<"Chuunin Announcer: Fight!"
				A.canmove=1
				B.canmove=1
				Battle(A,B)
				return





proc
	Battle(mob/A,mob/B)
		work
			if(!A)
				world<<"[B] has won against [A]!"
				A.tourndied=0
				var/random=pick(0,1)
				if(random)
					B.loc = locate("ChuuninTourneyRoom")
				else
					B.loc = locate("ChuuninTourneyRoom2")
				B.inchuun=1//allow movement in small space.
				B.life=100
				B.chakra=B.max_chakra
				B.health=B.max_health
				B.canregen=1
				spawn() B.regeneration()
				sleep(50)
				inproc=0
				if(roundtwo)
					Candidates2.Remove(A)
					Candidates2.Remove(B)
					Candidates3.Add(B)
					Chuunin_AI2()
					return
				else
					Candidates.Remove(A)
					Candidates.Remove(B)
					Candidates2.Add(B)
					Chuunin_AI()
					return // stop runtime errors
			if(!B)
				world<<"[A] has won against [B]!"
				B.tourndied=0
				var/random=pick(0,1)
				if(random)
					A.loc = locate("ChuuninTourneyRoom")
				else
					A.loc = locate("ChuuninTourneyRoom2")
				A.inchuun=1//allow movement in small space.
				A.life=100
				A.chakra=A.max_chakra
				A.health=A.max_health
				A.canregen=1
				spawn() A.regeneration()
				sleep(50)
				inproc=0
				if(roundtwo)
					Chuunin_AI2()
					Candidates2.Remove(B)
					Candidates2.Remove(A)
					Candidates3.Add(A)
					return
				else
					Chuunin_AI()
					Candidates.Remove(A)
					Candidates.Remove(B)
					Candidates2.Add(A)
					return // stop runtime errors
			A.Death(A)
			B.Death(B)
			if(A&&A.tourndied >= 1) /// YOU MIGHT HAVE TO CHANGE THIS INCASE YOUR health VAR IS DIFF, see: your death proc for more info
				world<<"[B] has won against [A]!"
				A.tourndied=0
				B.loc=locate("ChuuninTourneyRoom") /// relocate the winner.
				B.inchuun=1//allow movement in small space.
				B.life=100
				B.chakra=B.max_chakra
				B.health=B.max_health
				B.canregen=1
				spawn() B.regeneration()
				sleep(50)
				inproc=0
				if(roundtwo)
					Candidates2.Remove(A)
					Candidates2.Remove(B)
					Candidates3.Add(B)
					Chuunin_AI2()
					return
				else
					Candidates.Remove(A)
					Candidates.Remove(B)
					Candidates2.Add(B)
					Chuunin_AI()
					return // stop runtime errors
			if(B&&B.tourndied >= 1) /// YOU MIGHT HAVE TO CHANGE THIS INCASE YOUR health VAR IS DIFF, SEE: your death proc for more info
				world<<"[A] has won against [B]!"
				B.tourndied=0
				A.loc=locate("ChuuninTourneyRoom") /// relocate the winner.
				A.inchuun=1//allow movement in small space.
				A.life=100
				A.chakra=A.max_chakra
				A.health=A.max_health
				A.canregen=1
				spawn() A.regeneration()
				sleep(50)
				inproc=0
				if(roundtwo)
					Candidates2.Remove(A)
					Candidates2.Remove(B)
					Candidates3.Add(A)
					Chuunin_AI2()
					return
				else
					Candidates.Remove(A)
					Candidates.Remove(B)
					Candidates2.Add(A)
					Chuunin_AI()
					return // stop runtime errors
			else
				sleep(10)
				goto work


/*
proc
	Tv_Name(mob/A,mob/B)
		var/icon/I = hugefont.DrawText("[A.name]", 0, 0, -1, DF_SET_WIDTH | DF_JUSTIFY_CENTER)
		I.DFP_Outline("#ffffff", "#000000")
		for(var/j=0, j<I.setheight, ++j)
			var/py = (13+j*2-I.setheight) * 16
			for(var/i=0, i<I.setwidth, ++i)
				var/px = (13+i*2-I.setwidth) * 16
				var/obj/O = new
				O.layer = OBJ_LAYER
				O.icon = I
				O.icon_state = "[i],[j]"
				O.pixel_x = px & 31
				O.pixel_y = py & 31
				O.loc = locate((px>>5)+1, (py>>5)+1, 1)

		var/icon/J = hugefont.DrawText("vs", 0, 0, -1, DF_SET_WIDTH | DF_JUSTIFY_CENTER)
		J.DFP_Outline("#ffffff", "#000000")
		for(var/j=0, j<J.setheight, ++j)
			var/py = (13+j*2-I.setheight) * 16
			for(var/i=0, i<J.setwidth, ++i)
				var/px = (13+i*2-J.setwidth) * 16
				var/obj/O = new
				O.layer = OBJ_LAYER
				O.icon = J
				O.icon_state = "[i],[j]"
				O.pixel_x = px & 31
				O.pixel_y = py & 31
				O.loc = locate((px>>5)+1, (py>>5)+1, 1)

		var/icon/K = hugefont.DrawText("[B.name]", 0, 0, -1, DF_SET_WIDTH | DF_JUSTIFY_CENTER)
		K.DFP_Outline("#ffffff", "#000000")
		for(var/j=0, j<K.setheight, ++j)
			var/py = (13+j*2-K.setheight) * 16
			for(var/i=0, i<K.setwidth, ++i)
				var/px = (13+i*2-K.setwidth) * 16
				var/obj/O = new
				O.layer = OBJ_LAYER
				O.icon = K
				O.icon_state = "[i],[j]"
				O.pixel_x = px & 31
				O.pixel_y = py & 31
				O.loc = locate((px>>5)+1, (py>>5)+1, 1)

CODE IS IN OTHER CODE font,arail stuff etc....
*/