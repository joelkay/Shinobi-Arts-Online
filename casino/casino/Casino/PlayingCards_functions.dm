
//pick a random card from specified pack and return it
proc/Pick_Random(var/CardPack)
	var/CardPack/A = CardPack
	if(A)
		var/CardPack/pick=pick(A.Deck)
		return pick

//pick a random card from specified pack and remove it from pack + return it
proc/rPick_Random(var/CardPack)
	var/CardPack/A = CardPack
	if(A)
		var/CardPack/pick=pick(A.Deck)
		A.Deck.Remove(pick)
		return pick




proc/Get_Score(var/list/Hand)

	var/totalHard=0
	var/totalSoft=0//if there is an Ace
	var/Acefound=0

	for(var/CardPack/A in Hand)

		//check for Ace
		if(A.int==1)
			Acefound=1
			totalSoft+=1
			totalHard+=11



		//////check for Jack,Queen,or King
		if(A.int>10)
			totalSoft+=10
			totalHard+=10

		else if(A.int!=1)
			totalSoft+=A.int
			totalHard+=A.int


	if(totalHard==21)
		alert("BlackJack")
		return 21

	if(Acefound&&totalSoft==21)
		alert("BlackJack")
		return 21

	if(totalHard<21)
		return totalHard

	if(totalHard>21&&totalSoft<21&&Acefound)
		return totalSoft

	else
		return totalHard





proc/DealerThink(var/score,mob/M)
	if(score<=17)
		M<<"<font color=green><b>Dealer is going to hit</font></b>"
		var/CardPack/Hit = rPick_Random(M.Pack)
		M.Dealer.Add(Hit)
		showHand(M, M.Hand, M.Dealer ,"player",M.TableList)
		showHand(M, M.Hand, M.Dealer ,"dealer",M.TableList)

		var/check=Get_Score(M.Dealer)

		if(check>21)
			M<<"<font color=red><b>Dealer Bust:[check].</font></b>"
			M.DealerStand=1//end the loop
	else
		M<<"<font color=blue><b>Dealer is going to stand</font></b>"
		M.DealerStand=1//dealerstands





proc/showHand(mob/M,var/list/Hand,var/list/Dealer,var/who,var/list/Table)

	if(who=="player")
		if(Hand.len==2&&M)
			var/list/tempHand=Hand.Copy()

			var/obj/one=pick(tempHand)
			tempHand.Remove(one)
			for(var/obj/A in Table)
				if(A.casino_id == 3)
					A.icon=one.icon

			var/obj/two=pick(tempHand)
			for(var/obj/B in Table)
				if(B.casino_id == 4)
					B.icon=two.icon



		if(Hand.len==3&&M)
			var/list/tempHand=Hand.Copy()

			var/obj/one=pick(tempHand)
			tempHand.Remove(one)
			for(var/obj/A in Table)
				if(A.casino_id == 3)
					A.icon=one.icon

			var/obj/two=pick(tempHand)
			tempHand.Remove(two)
			for(var/obj/B in Table)
				if(B.casino_id == 4)
					B.icon=two.icon

			var/obj/three=pick(tempHand)
			for(var/obj/C in Table)
				if(C.casino_id == 5)
					C.icon=three.icon


		if(Hand.len==4&&M)
			var/list/tempHand=Hand.Copy()

			var/obj/one=pick(tempHand)
			tempHand.Remove(one)
			for(var/obj/A in Table)
				if(A.casino_id == 3)
					A.icon=one.icon

			var/obj/two=pick(tempHand)
			tempHand.Remove(two)
			for(var/obj/B in Table)
				if(B.casino_id == 4)
					B.icon=two.icon

			var/obj/three=pick(tempHand)
			tempHand.Remove(three)
			for(var/obj/C in Table)
				if(C.casino_id == 5)
					C.icon=three.icon

			var/obj/four=pick(tempHand)
			for(var/obj/D in Table)
				if(D.casino_id == 2)
					D.icon=four.icon

		if(Hand.len==5&&M)
			var/list/tempHand=Hand.Copy()

			var/obj/one=pick(tempHand)
			tempHand.Remove(one)
			for(var/obj/A in Table)
				if(A.casino_id == 3)
					A.icon=one.icon

			var/obj/two=pick(tempHand)
			tempHand.Remove(two)
			for(var/obj/B in Table)
				if(B.casino_id == 4)
					B.icon=two.icon

			var/obj/three=pick(tempHand)
			tempHand.Remove(three)
			for(var/obj/C in Table)
				if(C.casino_id == 5)
					C.icon=three.icon

			var/obj/four=pick(tempHand)
			tempHand.Remove(four)
			for(var/obj/D in Table)
				if(D.casino_id == 2)
					D.icon=four.icon

			var/obj/five=pick(tempHand)
			for(var/obj/E in Table)
				if(E.casino_id == 1)
					E.icon=five.icon

		if(Hand.len==6&&M)
			var/list/tempHand=Hand.Copy()

			var/obj/one=pick(tempHand)
			tempHand.Remove(one)
			for(var/obj/A in Table)
				if(A.casino_id == 3)
					A.icon=one.icon

			var/obj/two=pick(tempHand)
			tempHand.Remove(two)
			for(var/obj/B in Table)
				if(B.casino_id == 4)
					B.icon=two.icon

			var/obj/three=pick(tempHand)
			tempHand.Remove(three)
			for(var/obj/C in Table)
				if(C.casino_id == 5)
					C.icon=three.icon

			var/obj/four=pick(tempHand)
			tempHand.Remove(four)
			for(var/obj/D in Table)
				if(D.casino_id == 2)
					D.icon=four.icon

			var/obj/five=pick(tempHand)
			tempHand.Remove(five)
			for(var/obj/E in Table)
				if(E.casino_id == 1)
					E.icon=five.icon

			var/obj/six=pick(tempHand)
			for(var/obj/F in Table)
				if(F.casino_id == 6)
					F.icon=six.icon


	if(who=="dealer")
		if(Dealer.len==2&&M)
			var/list/tempDealer=Dealer.Copy()

			var/obj/one=pick(tempDealer)
			tempDealer.Remove(one)
			for(var/obj/A in Table)
				if(A.casino_id == 9)
					A.icon=one.icon

			var/obj/two=pick(tempDealer)
			for(var/obj/B in Table)
				if(B.casino_id == 10)
					B.icon=two.icon


		if(Dealer.len==3&&M)
			var/list/tempDealer=Dealer.Copy()

			var/obj/one=pick(tempDealer)
			tempDealer.Remove(one)
			for(var/obj/A in Table)
				if(A.casino_id == 9)
					A.icon=one.icon

			var/obj/two=pick(tempDealer)
			tempDealer.Remove(two)
			for(var/obj/B in Table)
				if(B.casino_id == 10)
					B.icon=two.icon

			var/obj/three=pick(tempDealer)
			for(var/obj/C in Table)
				if(C.casino_id == 11)
					C.icon=three.icon


		if(Dealer.len==4&&M)
			var/list/tempDealer=Dealer.Copy()

			var/obj/one=pick(tempDealer)
			tempDealer.Remove(one)
			for(var/obj/A in Table)
				if(A.casino_id == 9)
					A.icon=one.icon

			var/obj/two=pick(tempDealer)
			tempDealer.Remove(two)
			for(var/obj/B in Table)
				if(B.casino_id == 10)
					B.icon=two.icon

			var/obj/three=pick(tempDealer)
			tempDealer.Remove(three)
			for(var/obj/C in Table)
				if(C.casino_id == 11)
					C.icon=three.icon

			var/obj/four=pick(tempDealer)
			for(var/obj/D in Table)
				if(D.casino_id == 8)
					D.icon=four.icon

		if(Dealer.len==5&&M)
			var/list/tempDealer=Dealer.Copy()

			var/obj/one=pick(tempDealer)
			tempDealer.Remove(one)
			for(var/obj/A in Table)
				if(A.casino_id == 9)
					A.icon=one.icon

			var/obj/two=pick(tempDealer)
			tempDealer.Remove(two)
			for(var/obj/B in Table)
				if(B.casino_id == 10)
					B.icon=two.icon

			var/obj/three=pick(tempDealer)
			tempDealer.Remove(three)
			for(var/obj/C in Table)
				if(C.casino_id == 11)
					C.icon=three.icon

			var/obj/four=pick(tempDealer)
			tempDealer.Remove(four)
			for(var/obj/D in Table)
				if(D.casino_id == 8)
					D.icon=four.icon

			var/obj/five=pick(tempDealer)
			for(var/obj/E in Table)
				if(E.casino_id == 7)
					E.icon=five.icon

		if(Dealer.len==6&&M)
			var/list/tempDealer=Dealer.Copy()

			var/obj/one=pick(tempDealer)
			tempDealer.Remove(one)
			for(var/obj/A in Table)
				if(A.casino_id == 9)
					A.icon=one.icon

			var/obj/two=pick(tempDealer)
			tempDealer.Remove(two)
			for(var/obj/B in Table)
				if(B.casino_id == 10)
					B.icon=two.icon

			var/obj/three=pick(tempDealer)
			tempDealer.Remove(three)
			for(var/obj/C in Table)
				if(C.casino_id == 11)
					C.icon=three.icon

			var/obj/four=pick(tempDealer)
			tempDealer.Remove(four)
			for(var/obj/D in Table)
				if(D.casino_id == 8)
					D.icon=four.icon

			var/obj/five=pick(tempDealer)
			tempDealer.Remove(five)
			for(var/obj/E in Table)
				if(E.casino_id == 7)
					E.icon=five.icon

			var/obj/six=pick(tempDealer)
			for(var/obj/F in Table)
				if(F.casino_id == 12)
					F.icon=six.icon
