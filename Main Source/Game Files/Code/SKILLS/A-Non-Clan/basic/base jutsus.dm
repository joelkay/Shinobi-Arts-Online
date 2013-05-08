mob
	NPC
	////////AI BIT////////////
		LeafTrainer
			icon = 'baseblack.dmi'
			Village="Leaf"//specify
			hair_type=1
			legarmorinv='black pants.dmi'
			armorinv='black shirt.dmi'
			pk=1


		SandTrainer
			icon = 'basewhite.dmi'
			Village="Leaf"//specify
			hair_type=1
			legarmorinv='black pants.dmi'
			armorinv='black shirt.dmi'
			pk=1

		MistTrainer
			icon = 'baseblack.dmi'
			Village="Leaf"//specify
			hair_type=1
			legarmorinv='black pants.dmi'
			armorinv='black shirt.dmi'
			pk=1




mob
	var
		kawax=0
		kaway=0
		kawaz=0
		cool=5
		Shadow_Clone=0
		spoken=0
		doneitboi=0
		Transformation_Techniqued=0
		indot=0
		kagebunshd=0
		tmp/claycloner=0
		rasenganon=0
		tmp/escape=0
		tmp/candrain=0
		tmp/c3detoned=0
		tmp/c3on=0
		tmp/copyname=""

	verb
		Return()
			set hidden = 1
			src.KillShadow_Clone()

			if(src.spiders)
				var/mob/M=usr.targeted
				if(M in range(50,src))
					for(var/obj/Explodespider/S in range(50,src))
						if(S&&S.owner==src)
							walk_towards(S,M,2)

			if(!src.c3detoned&&src.c3on)
				for(var/obj/C3/E in view())
					E.Explode()


			if(src.Transformation_Techniqued)
				var/list/o
				src.overlays = src.overlays.Remove(src.overlays)
				src.icon=src.savedi
				flick('smoke.dmi',src)
				src.overlays+=o
			//	src.name=src.copyname
				src.Load_Overlays()
				src.Transformation_Techniqued=0
			if(src.kagebunshd)
				src.KillShadow_Clone()
				src.controlled=null
				src.client.eye=src
				src.kagebunshd=0
				src.doing=0//can do jutsus
				return
			else
				src.delpups()
				src.delpups2()
				src.delpups3()
				if(src.client)
					src.controlled=null
					src.client.eye=src
					src.bunsh=0
					src.doing=0
				return



mob
	var
		savedi=""
		savedo=""


obj
	kawa
		icon='kawa.dmi'
		layer = MOB_LAYER+1



mob
	var
		puppet1=0
		puppet2=0
		puppet3=0

mob
	verb
		ControlPuppet1()
			set hidden=1
			if(src.puppet1)
				src.controlled=null
				src.client.eye=src
				src.puppet1=0
				src.doing=0
				return
			for(var/mob/puppet1/P in oview())
				if(P.owner == src)
					walk(P,0)
					src.controlled=P
					src.client.eye=P
					src.puppet1=1
					src.puppet2=0
					src.puppet3=0
					src.doing=1
		ControlPuppet2()
			set hidden=1
			if(src.puppet2)
				src.controlled=null
				src.client.eye=src
				src.puppet2=0
				src.doing=0
				return
			for(var/mob/puppet2/P in oview())
				if(P.owner == src)
					walk(P,0)
					src.controlled=P
					src.client.eye=P
					src.puppet2=1
					src.puppet1=0
					src.puppet3=0
					src.doing=1
		ControlPuppet3()
			set hidden=1
			if(src.puppet3)
				src.controlled=null
				src.client.eye=src
				src.puppet3=0
				src.doing=0
				return
			for(var/mob/puppet3/P in oview())
				if(P.owner == src)
					walk(P,0)
					src.controlled=P
					src.client.eye=P
					src.puppet3=1
					src.puppet2=0
					src.puppet1=0
					src.doing=1


mob
	proc
		delpups3()
			for(var/mob/puppet3/X in world)
				if(X.owner==src)
					del(X)
		delpups2()
			for(var/mob/puppet2/X in world)
				if(X.owner==src)
					del(X)
		delpups()
			for(var/mob/puppet1/X in world)
				if(X.owner==src)
					del(X)


mob
	proc
		cepdrain()
			if(src.cep)
				src.canregen=0
				if(src.chakra<=0)
					src.doing=0//can do jutsus
					src.canregen=1
					spawn() src.regeneration()
					src.cep=0
					return
				else
					if(src.chakra>0&&src.cep)
						src.canregen=0
						sleep(20)//2 secs
						src.chakra-=src.max_chakra/20
						src.cepdrain()
					else
						return
			else
				src.canregen=1
				spawn() src.regeneration()
				src.cep=0
				src.doing=0//can do jutsus
				return


mob
	proc
		kaitenZ()
			var/mob/M
			while(src.protected) //as long as you are in kaiten...
				for(M in oview(2)) //1 tile away excluding you
					M.PushEnemy(2,src.dir)
					M.Dec_health(200,src,"Kaiten")
				sleep(10) //And then we wait 3 seconds before we check if there is someone there again


mob
	var/tmp/list/tagged=list()

	proc
		eyes()
			set background=1
			if(!src.loggedin)return

			while(src.byakuganon||src.Sharinganon)
				sleep(10)
				for(var/mob/M in oview(src))
					if(!(M in src.tagged))
						var/image/I=image('byakuganvision.dmi',M)
						//M.overlays += I
						src.client.images+=I
						src.tagged.Add(M)

			if(!src.byakuganon&&src.Clan=="Hyuuga"||!src.Sharinganon&&src.Clan=="Uchiha")
				for(var/client/c in players)
					var/mob/M=c.mob
					if(M.name in src.tagged)
						var/image/I=image('byakuganvision.dmi')
						M.overlays -= I
						src.client.images-=I
				for(var/image/I in src.client.images)
					del(I)

				src.tagged=null

mob
	proc
		leech(mob/guy)
			if(guy.kawad)
				guy.kawa()
				return

			while(guy.indot&&src.canleech&&guy.chakra>0)
				sleep(10)
				guy.chakra-=80
				src.chakra+=80

			if(guy.chakra<0)
				guy.Dec_health(8000,src,"Chamber_Leech")
				src.canmove=1
				src.icon_state=""
				src.canleech=0

				for(var/obj/DotonT/trapped/X in world)
					if(X.owner==src)
						del(X)

				for(var/obj/DotonT/leech/Z in world)
					if(Z.owner==src)
						del(Z)




