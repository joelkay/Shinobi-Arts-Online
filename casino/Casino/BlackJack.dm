var/CASINO="Maps/casino"
var/CardPack/Global

world
	New()
		..()
		Global = new()
		Global.Populate()

mob
	verb
		startBlackJack()
			set hidden=1
			src.map = SwapMaps_CreateFromTemplate(CASINO)	 //load the next scene map
			spawn()
				covermap(src.map)
			Loading("Blackjack")
			src.BlackJack()


mob/proc
	BlackJack()
		src.TableList=setupTable()

		src.loc = locate(src.map.x1+12,src.map.y1+6,src.map.z1)
		src.ingame=1
		winset(src, "command-child", "left=blackjack")
		winset(src,"coinstrip","text=[coin]")
		src.toggle()

mob/var/canact=0
mob/var/canbet=1
mob/var/freshdeal=0
mob/var/tmp/lastbet=0

mob
	proc
		Deal()
			set hidden=1

			if(!bet)
				alert("Please place a bet by clicking on any of the chip values")
				return

			resetTable()
			src.Hand=new
			src.Dealer=new
			src.Faced=new
			PlayerStand=0
			DealerStand=0
			src.GetPack()
			src.TableList=setupTable()

			var/CardPack/Four =new()//should be face_down
			src.Faced.Add(Four,Four)
			showHand(src, src.Faced, src.Dealer,"player",src.TableList)

			var/CardPack/One = rPick_Random(src.Pack)
			var/CardPack/Two = rPick_Random(src.Pack)

			var/CardPack/Three = rPick_Random(src.Pack)
			//var/CardPack/Four = rPick_Random(src.Pack)
			sleep(10)
			freshdeal=1//as above

			src.Hand.Add(One,Two)
			src.Dealer.Add(Three,Four)


			showHand(src, src.Hand, src.Dealer,"player",src.TableList)
			showHand(src, src.Hand, src.Dealer, "dealer",src.TableList)


			src.coin-=bet
			lastbet=bet
			winset(src,"coinstrip","text=[coin]")

			canact = 1
			canbet = 0

			var/score=Get_Score(src.Hand,src,1)//test got BJ
			Get_Score(src.Dealer,src)

			if(score==21)
				src<<"BlackJack"
				canact=0//no need to act
				DealerStand(score,1)//blackjack payout



mob
	verb
		DealCards()
			set hidden=1
			if(canact)return
			Deal()

		Hit()
			set hidden=1

			if(PlayerStand||!canact)return
			canact = 0//let the dealer do ish

			var/CardPack/Hit = rPick_Random(src.Pack)
			src.Hand.Add(Hit)
			showHand(src, src.Hand, src.Dealer ,"player",src.TableList)

			var/score=Get_Score(src.Hand,src,1)

			if(score>21)
				Lose(bet)

			else if(!DealerStand)//ifthe dealer isn't standing
				DealerThink(Get_Score(src.Dealer,src),src,0)//0->let the dealer know we are relying on his loop


		Stand()
			set hidden = 1

			if(!canact)return
			canact = 0//let the dealer do ish

			var/playerscore=Get_Score(src.Hand,src,1)
			var/dealerscore

			if(playerscore>21)
				Lose(bet)
				return

			PlayerStand=1//they are standing now


			if(!DealerStand)
				DealerStand(playerscore,0)//standard payout if dealer loses

			else
				dealerscore=Get_Score(src.Dealer,src)//if the dealer is already standing
				if(dealerscore>21)
					Win(bet)
					return

				if(dealerscore>playerscore)
					Lose(bet)

				else if(playerscore==dealerscore)
					Push(bet)

				else if(playerscore>dealerscore)
					Win(bet)



mob
	proc/DealerStand(playerscore,blackjack)

		var/dealerscore

		while(!DealerStand)
			sleep(20)
			DealerThink(Get_Score(src.Dealer,src),src,1)//1->let the dealer know we have our own loop

		if(DealerStand)
			dealerscore=Get_Score(src.Dealer,src)
			if(dealerscore>21)
				Win(bet,blackjack)
				return

			if(dealerscore>playerscore)
				Lose(bet)

			else
				if(playerscore==dealerscore)
					if(!blackjack)//blackjack wins regardless
						Push(bet)
					else
						Win(bet,blackjack)

				else if(playerscore>dealerscore)
					Win(bet,blackjack)



obj
	var/casino_id//so we can modify them from a list

mob
	proc
		resetTable()
			for(var/obj/A in TableList)
				A.loc=null

			winset(src,"dealerscore","is-visible=true")
			winset(src,"playerscore","is-visible=true")
			winset(src,"dealerlabel","is-visible=true")
			winset(src,"playerlabel","is-visible=true")
			winset(src,"playerslash","is-visible=false")
			winset(src,"playerscore2","is-visible=false")

		UpdateScores(score, score2)
			if(score>0)//player
				winset(src,"playerscore","text=[score]")
			if(score2>0)//dealer
				winset(src,"dealerscore","text=[score2]")

		UpdateScores2(score, score2,score3)
			if(score>0)//player
				winset(src,"playerslash","is-visible=true")
				winset(src,"playerscore2","is-visible=true")
				winset(src,"playerscore","text=[score]")
				winset(src,"playerscore2","text=[score2]")
			if(score2>0)//dealer
				winset(src,"dealerscore","text=[score3]")

		setupTable()
			var/defAult='zblankcard2.dmi'
			var/list/TableList=new

			var/obj/c1=new()
			c1.icon=defAult
			c1.loc = locate(src.map.x1+7,src.map.y1+2,src.map.z1)
			c1.casino_id=1
			var/obj/c2=new()
			c2.icon=defAult
			c2.loc = locate(src.map.x1+9,src.map.y1+2,src.map.z1)
			c2.pixel_x=8
			c2.casino_id=2
			var/obj/c3=new()
			c3.icon=defAult
			c3.loc = locate(src.map.x1+11,src.map.y1+2,src.map.z1)
			c3.pixel_x=16
			c3.casino_id=3
			var/obj/c4=new()
			c4.icon=defAult
			c4.loc = locate(src.map.x1+13,src.map.y1+2,src.map.z1)
			c4.pixel_x=24
			c4.casino_id=4
			var/obj/c5=new()
			c5.icon=defAult
			c5.loc = locate(src.map.x1+15,src.map.y1+2,src.map.z1)
			c5.pixel_x=32
			c5.casino_id=5
			var/obj/c6=new()
			c6.icon=defAult
			c6.loc = locate(src.map.x1+17,src.map.y1+2,src.map.z1)
			c6.pixel_x=40
			c6.casino_id=6

			var/obj/d1=new()
			d1.icon=defAult
			d1.loc = locate(src.map.x1+7,src.map.y1+7,src.map.z1)
			d1.casino_id=7
			var/obj/d2=new()
			d2.icon=defAult
			d2.loc = locate(src.map.x1+9,src.map.y1+7,src.map.z1)
			d2.pixel_x=8
			d2.casino_id=8
			var/obj/d3=new()
			d3.icon=defAult
			d3.loc = locate(src.map.x1+11,src.map.y1+7,src.map.z1)
			d3.pixel_x=16
			d3.casino_id=9
			var/obj/d4=new()
			d4.icon=defAult
			d4.loc = locate(src.map.x1+13,src.map.y1+7,src.map.z1)
			d4.pixel_x=24
			d4.casino_id=10
			var/obj/d5=new()
			d5.icon=defAult
			d5.loc = locate(src.map.x1+15,src.map.y1+7,src.map.z1)
			d5.pixel_x=32
			d5.casino_id=11
			var/obj/d6=new()
			d6.icon=defAult
			d6.loc = locate(src.map.x1+17,src.map.y1+7,src.map.z1)
			d6.pixel_x=40
			d6.casino_id=12

			TableList.Add(c1,c2,c3,c4,c5,c6,d1,d2,d3,d4,d5,d6)

			return TableList



