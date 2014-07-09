mob
	verb
		test()
			set hidden=1
			src.Test()

		cfg()
			set hidden=1
			src.Cfg()

		saytoserver(Msg as text)
			world << Msg
			world.Export("[addr]:[port]?shout:[src] says [Msg]")

		say(msg as text)
			world << "[src] says [msg]"

mob
	verb
		portchange()
			set category="Debug"
			var/portnew =input("Enter a new port e.g 5553") as num
			port=portnew

	verb
		Adresschange()
			set category="Debug"
			var/addresnew =input("enter a new adress without e.g 86.164.127.248") as text
			addr="[addresnew]"



		PopupTests()
			if(Apopup(src,"Test",1))
				Apopup(src,"You chose Yes")
			else
				Apopup(src,"You chose No")





var/tmp/connected=0

mob
	proc
		Test()
			var/p = world.Export("[addr]:[port]#ping")
			if(p&&!connected)
				src << "Ping returned '[p]'."
				spawn() AutoUpdate()
				connected=1

		Cfg()
			world.Export("[addr]:[port]#log")
			var/savefile/X=new(world.Import())
			if(X)
				src << "Success."
				src << X


	verb

		TestFans()
			set category ="Fans"

			var/fans[] = Get_Fans("JeanSqribe.ShinobiArtsOnline")

			if(src.key in fans)

				Apopup(src,"Thank you for being a fan and supporting our game!")

			else
				Apopup(src,"Please fan our game to help bring more players!!")
				src << link("http://www.byond.com/games/JeanSqribe/ShinobiArtsOnline")