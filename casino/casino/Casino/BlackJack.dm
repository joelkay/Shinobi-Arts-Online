var/CardPack/Global

world
	New()
		..()
		Global = new()
		Global.Populate()

mob
	verb
		start_BlackJack()
			src.map = SwapMaps_CreateFromTemplate("Maps/casino")	 //load the next scene map
			covermap(src.map)
			src.BlackJack()


mob/proc
	BlackJack()
		src<<"<font color=green><b>Loading BlackJack</font></b>"

		src.TableList=setupTable()

		src.loc = locate(src.map.x1+2,src.map.y1+2,src.map.z1)

		src.toggle()


	GetPack()
		src.Pack=Global.duplicate()



mob
	verb
		Show_Pack()
			set category = "BlackJack_debug"
			var/CardPack/A = src.Pack

			if(A)
				for(var/CardPack/C in A.Deck)
					src<<C.icon





		Deal_Cards()
			set category = "BlackJack"

			src.Hand=new
			src.Dealer=new
			PlayerStand=0
			DealerStand=0
			src.GetPack()
			src.TableList=setupTable()


			var/CardPack/One = rPick_Random(src.Pack)
			var/CardPack/Two = rPick_Random(src.Pack)

			var/CardPack/Three = rPick_Random(src.Pack)
			var/CardPack/Four = rPick_Random(src.Pack)

			src.Hand.Add(One,Two)
			src.Dealer.Add(Three,Four)


			showHand(src, src.Hand, src.Dealer,"player",src.TableList)
			showHand(src, src.Hand, src.Dealer, "dealer",src.TableList)


		Hit()
			set category = "BlackJack"

			if(PlayerStand)return

			var/CardPack/Hit = rPick_Random(src.Pack)
			src.Hand.Add(Hit)
			showHand(src, src.Hand, src.Dealer ,"player",src.TableList)

			var/score=Get_Score(src.Hand)

			if(score>21)
				src<<"Bust:[score] You Lose."

			else if(!DealerStand)//ifthe dealer isn't standing
				DealerThink(Get_Score(src.Dealer),src)


		Stand()
			set category = "BlackJack"

			var/playerscore=Get_Score(src.Hand)
			var/dealerscore
			if(playerscore>21)
				src<<"You Lost"
				return
			PlayerStand=1//they are standing now

			if(!DealerStand)
				while(!DealerStand)
					sleep(20)
					DealerThink(Get_Score(src.Dealer),src)

				if(DealerStand)
					dealerscore=Get_Score(src.Dealer)
					if(dealerscore>21)
						src<<"You Win"
						return

					if(dealerscore>playerscore)
						src<<"You Lost"

					else if(playerscore==dealerscore)
						src<<"Draw"

					else if(playerscore>dealerscore)
						src<<"You Win"


			else
				dealerscore=Get_Score(src.Dealer)
				if(dealerscore>21)
					src<<"You Win"
					return

				if(dealerscore>playerscore)
					src<<"You Lost"

				else if(playerscore==dealerscore)
					src<<"Draw"

				else if(playerscore>dealerscore)
					src<<"You Win"


		Get_Scores()
			set category = "BlackJack_debug"
			var/score=Get_Score(src.Hand)
			var/score2=Get_Score(src.Dealer)

			src<<"You:[score]."
			src<<"Dealer:[score2]."



obj
	var/casino_id//so we can modify them from a list

mob
	proc
		setupTable()
			var/defAult='zblankcard2.dmi'
			var/list/TableList=new

			var/obj/c1=new()
			c1.icon=defAult
			c1.loc = locate(src.map.x1+7,src.map.y1+3,src.map.z1)
			c1.casino_id=1
			var/obj/c2=new()
			c2.icon=defAult
			c2.loc = locate(src.map.x1+9,src.map.y1+3,src.map.z1)
			c2.pixel_x=8
			c2.casino_id=2
			var/obj/c3=new()
			c3.icon=defAult
			c3.loc = locate(src.map.x1+11,src.map.y1+3,src.map.z1)
			c3.pixel_x=16
			c3.casino_id=3
			var/obj/c4=new()
			c4.icon=defAult
			c4.loc = locate(src.map.x1+13,src.map.y1+3,src.map.z1)
			c4.pixel_x=24
			c4.casino_id=4
			var/obj/c5=new()
			c5.icon=defAult
			c5.loc = locate(src.map.x1+15,src.map.y1+3,src.map.z1)
			c5.pixel_x=32
			c5.casino_id=5
			var/obj/c6=new()
			c6.icon=defAult
			c6.loc = locate(src.map.x1+17,src.map.y1+3,src.map.z1)
			c6.pixel_x=40
			c6.casino_id=6

			var/obj/d1=new()
			d1.icon=defAult
			d1.loc = locate(src.map.x1+7,src.map.y1+15,src.map.z1)
			d1.casino_id=7
			var/obj/d2=new()
			d2.icon=defAult
			d2.loc = locate(src.map.x1+9,src.map.y1+15,src.map.z1)
			d2.pixel_x=8
			d2.casino_id=8
			var/obj/d3=new()
			d3.icon=defAult
			d3.loc = locate(src.map.x1+11,src.map.y1+15,src.map.z1)
			d3.pixel_x=16
			d3.casino_id=9
			var/obj/d4=new()
			d4.icon=defAult
			d4.loc = locate(src.map.x1+13,src.map.y1+15,src.map.z1)
			d4.pixel_x=24
			d4.casino_id=10
			var/obj/d5=new()
			d5.icon=defAult
			d5.loc = locate(src.map.x1+15,src.map.y1+15,src.map.z1)
			d5.pixel_x=32
			d5.casino_id=11
			var/obj/d6=new()
			d6.icon=defAult
			d6.loc = locate(src.map.x1+17,src.map.y1+15,src.map.z1)
			d6.pixel_x=40
			d6.casino_id=12


			var/obj/Chip/e1=new()
			e1.icon='ones.bmp'
			e1.loc = locate(src.map.x1+4,src.map.y1+1,src.map.z1)
			e1.casino_id=100

			var/obj/Chip/e2=new()
			e2.icon='fives.bmp'
			e2.loc = locate(src.map.x1+6,src.map.y1+1,src.map.z1)
			e2.casino_id=101

			var/obj/Chip/e3=new()
			e3.icon='tens.bmp'
			e3.loc = locate(src.map.x1+8,src.map.y1+1,src.map.z1)
			e3.casino_id=102

			var/obj/Chip/e4=new()
			e4.icon='twentys.bmp'
			e4.loc = locate(src.map.x1+10,src.map.y1+1,src.map.z1)
			e4.casino_id=103

			var/obj/Chip/e5=new()
			e5.icon='fifties.bmp'
			e5.loc = locate(src.map.x1+12,src.map.y1+1,src.map.z1)
			e5.casino_id=104

			var/obj/Chip/e6=new()
			e6.icon='hunneds.bmp'
			e6.loc = locate(src.map.x1+14,src.map.y1+1,src.map.z1)
			e6.casino_id=105


			TableList.Add(c1,c2,c3,c4,c5,c6,d1,d2,d3,d4,d5,d6)

			return TableList



obj
	Chip
		Click()
			..()
			var/text
			switch(casino_id)
				if(100)
					text="ones"
				if(101)
					text="fives"
				if(102)
					text="tens"
				if(103)
					text="twenties"
				if(104)
					text="fiddies"
				if(105)
					text="hunneds"

			alert("You clicked [text]")