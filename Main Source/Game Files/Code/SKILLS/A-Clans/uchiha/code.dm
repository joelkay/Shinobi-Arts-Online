mob
	proc/Skilluchiha(u)
		switch(u)
/////////////////////UCHIHA/////////////////

			if("Sharingan_lvl1")

				src << output("[src]: Sharingan", "combatlog")
				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				src.reflexplus+=(20*src.reflexmain/100)
				src.dexterityplus+=(20*src.dexteritymain/100)
				src.overlays+='Sharingan.dmi'
				src.Sharinganon=1
				src.eyes()
				src.client.screen+=new/obj/Sharingana
				sleep(10)
				src.chidorivalue=30
				src.overlays-='Sharingan.dmi'
				sleep(700)
				src.overlays-='Sharingan.dmi'
				src.chidorivalue=0
				for(var/obj/Sharingana/A in src.client.screen)
					del(A)

				src.reflexplus=0
				src.resistanceplus=0
				src.Sharinganon=0



			if("Sharingan_lvl2")

				src.sharidel=1
				src << output("[src]: Sharingan", "combatlog")
				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				src.reflexplus+=(30*src.reflexmain/100)
				src.dexterityplus+=(30*src.dexteritymain/100)
				src.overlays+='Sharingan.dmi'
				src.Sharinganon=1
				src.eyes()
				src.client.screen+=new/obj/Sharinganb
				sleep(10)
				src.overlays-='Sharingan.dmi'
				src.chidorivalue=20
				sleep(700)
				src.overlays-='Sharingan.dmi'
				src.chidorivalue=0
				for(var/obj/Sharinganb/B in src.client.screen)
					del(B)

				src.reflexplus=0
				src.resistanceplus=0
				src.Sharinganon=0

			if("Sharingan_lvl3")

				src.sharidel=2
				src << output("[src]: Sharingan", "combatlog")
				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				src.reflexplus+=(50*src.reflexmain/100)
				src.dexterityplus+=(50*src.dexteritymain/100)
				src.Sharinganon=1
				src.overlays+='Sharingan.dmi'
				src.eyes()
				src.client.screen+=new/obj/Sharinganc
				sleep(10)
				src.overlays-='Sharingan.dmi'
				src.chidorivalue=15
				sleep(700)
				src.overlays-='Sharingan.dmi'
				src.chidorivalue=0
				for(var/obj/Sharinganc/C in src.client.screen)
					del(C)

				src.reflexplus=0
				src.resistanceplus=0
				src.Sharinganon=0

			if("Mangekyo_Sharingan")

				src.hsealvalue=1//slep 0.1 seconds
				src.seals()
				if(!src.Sharinganon)
					src<<output("Sharingan must be turned on..", "combatlog")
				src << output("[src]: Mangekyo Sharingan", "combatlog")
				src << output("[src]: Mangekyo Sharingan: will have Tsukiyomi,Amaterasu.Space warp,Izanagi and Susano (you choose one) ", "combatlog")


			//sharicopy is a proc now

