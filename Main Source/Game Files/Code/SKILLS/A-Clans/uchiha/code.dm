mob
	proc/Skilluchiha(u)
		switch(u)
/////////////////////UCHIHA/////////////////
			if("Sharingan_lvl1")
				src << output("[src]: Sharingan", "combatlog")
				src.reflexplus+=(20*src.reflexmain/100)
				src.dexterityplus+=(20*src.dexteritymain/100)
				src.overlays+='Sharingan.dmi'
				src.Sharinganon=1
				src.eyes()
				src.client.screen+=new/obj/Sharingana
				spawn(10)
					src.overlays-='Sharingan.dmi'
				src.chidorivalue=10

				spawn(200)
					src.overlays-='Sharingan.dmi'
					removesharingan()



			if("Sharingan_lvl2")
				src.sharidel=1
				src << output("[src]: Sharingan", "combatlog")
				src.reflexplus+=(30*src.reflexmain/100)
				src.dexterityplus+=(30*src.dexteritymain/100)
				src.overlays+='Sharingan.dmi'
				src.Sharinganon=1
				src.eyes()
				src.client.screen+=new/obj/Sharinganb
				spawn(10)
					src.overlays-='Sharingan.dmi'
				src.chidorivalue=20

				spawn(300)
					src.overlays-='Sharingan.dmi'
					removesharingan()

			if("Sharingan_lvl3")
				src.sharidel=2
				src << output("[src]: Sharingan", "combatlog")
				src.reflexplus+=(50*src.reflexmain/100)
				src.dexterityplus+=(50*src.dexteritymain/100)
				src.Sharinganon=1
				src.overlays+='Sharingan.dmi'
				src.eyes()
				src.client.screen+=new/obj/Sharinganc
				spawn(10)
					src.overlays-='Sharingan.dmi'
				src.chidorivalue=30

				spawn(400)
					src.overlays-='Sharingan.dmi'
					removesharingan()


			if("Sharingancopy")
				var/Skill/S=src.copied
				if(S)
					src.Skills(S)

				else
					src << output("[src]: Sharingan: no copied skill here", "combatlog")
					ReturnPrice("Sharingancopy")





			if("Mangekyo_Sharingan")
				if(!src.Sharinganon)
					src<<output("Sharingan must be turned on..", "combatlog")
					ReturnPrice("Mangekyo_Sharingan")
					return
				else
					src << output("[src]: Mangekyo Sharingan", "combatlog")
					src << output("[src]: Mangekyo Sharingan: will have Tsukiyomi,Amaterasu.Space warp,Izanagi and Susano (you choose one) ", "combatlog")


			//sharicopy is a proc now

