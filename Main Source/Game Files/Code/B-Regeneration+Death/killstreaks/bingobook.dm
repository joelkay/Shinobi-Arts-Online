var
	list/bingosorted=new

obj/bountyentry
	var
		rank="D"
		Village="Missing"
		bingo=0
	icon='base.dmi'

world
	proc
		bingosort()
			set background = 1

			var/list/bingo=new

			for(var/mob/O in world)
				if(O && O.bingo)
					var/obj/bountyentry/w=new/obj/bountyentry
					w.icon=O.icon
					w.overlays+=O.overlays
					w.Village=O.Village
					w.bingo=O.bingo
					w.rank=O.rank

					w.name="[O.name], Rank:[w.rank], Bounty:[w.bingo], Village:[w.Village]"
					bingo.Add(w)

			bingosorted=new
			while(length(bingo)>0)
				var/obj/bountyentry/next=new/obj/bountyentry
				for(var/obj/bountyentry/O in bingo)
					if(next)
						if(O.bingo>next.bingo)
							next=O
					else
						next=O
				sleep(-1)

				bingo-=next
				bingosorted+=next

			for(var/client/C)
				if(C.key) C.Refresh_Bounties()


client
	proc
		Refresh_Bounties()
			var/grid_item = 0
			for(var/M in bingosorted)
				src << output(M, "Cpanel-bingo.bingo_grid:[++grid_item]")
			winset(src, "Cpanel-bingo.bingo_grid", "cells=[grid_item]")




var/basemoney=100

proc
	Bingo_Book(mob/M)
		if(M.streak)
			M.bingo=M.streak*basemoney




mob/Owner
	verb
		Bingo_money()
			set category="Staff"
			src<<"dont make it a realay high number :)"
			var/ammo=input("How much money for bingo","bingo") as num
			basemoney = 100+ammo
			src<<"+ [basemoney] per kill"
			return

		Bingo_test()
			set category="Staff"
			src.bingo=500
			src.client.Refresh_Bounties()
