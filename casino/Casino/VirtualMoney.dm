mob
	var/coin=500
	var/bet=0

	proc
		Win(bet,blackjack=0)
			var/win
			if(blackjack)
				win=(src.bet+src.bet*1.5)
				coin+=win
				src<<"Congratulations on BJ +[win]"
			else
				win=(src.bet+src.bet)
				coin+=win
				src<<"You Win +[win]"

			canact = 0
			src.bet=0
			winset(src,"betstrip","text=[src.bet]")
			winset(src,"coinstrip","text=[coin]")
			canbet = 1


		Lose(src.bet)
			src<<"You Lose -[src.bet]."
			canact = 0
			src.bet=0
			winset(src,"betstrip","text=[src.bet]")
			winset(src,"coinstrip","text=[coin]")
			canbet = 1


		Push(bet)
			src<<"Tie +[src.bet]."
			coin+=src.bet
			canact = 0
			src.bet=0
			winset(src,"betstrip","text=[src.bet]")
			winset(src,"coinstrip","text=[coin]")
			canbet = 1


		bet(num)
			if(!canbet)return
			if((src.coin-bet)<num)
				alert("Insufficient funds, [bet]+[num] > [coin]")
				return 0
			else
				src.bet+=num
				winset(src,"betstrip","text=[bet]")
				return 1


	verb

		bet1()
			set hidden=1
			bet(1)

		bet5()
			set hidden=1
			bet(5)

		bet10()
			set hidden=1
			bet(10)

		bet20()
			set hidden=1
			bet(20)

		bet50()
			set hidden=1
			bet(50)

		bet100()
			set hidden=1
			bet(100)

		rebet()
			set hidden=1
			bet=0
			winset(src,"betstrip","text=[bet]")
			if(lastbet>0&&bet(lastbet))
				Deal()



/*

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




		Setup()
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
*/