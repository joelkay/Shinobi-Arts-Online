mob//i like it now XD
	var/tmp/killer=""
	var/tmp/chidorion=0
	var/tmp/inteleatk=0//gates nerf!!
	var/tmp/lastjutsu=""
	proc
		Dec_life(num,mob/attacker,jname)
			if(!src)return
			if(src.kawad)
				src.kawa()
				return
			var/mob/X=attacker
			X.reflexadd(X.learningcurve)
			if(src.koed)//koed
				return
			var/finalnum=num
			if(src.protected)//kaiten etc
				return
			if(src.strengthnum)
				finalnum-=src.strengthnum
			src.life-=finalnum
			X.statboost(finalnum)//woot
			src.killer=attacker// death announce
			src.lastjutsu=jname
			/*
			if(src.barsclosedd)
				src.initiateunderbars()
			src.bupdateHealth(src,attacker)
			src.bupdatelife(src,attacker)
			src.bupdateki(src,attacker)
			*/
			src<< output("<font color=gray>Took [finalnum] life damage from [X]..", "combatlog")//tell them damage.
			X<< output("<font color=gray>Gave [finalnum] life damage to [src]..", "combatlog")//tell them damage.
			//s_damage(src, finalnum, "white")//s_damage(src, num, "red")
			src.Death(src)
//////////////////////////////////////////////////////////////////////////////




		Dec_health(x,mob/attker,jname) //always pass all damaging effects through here, then defensive abilities can edit the x value
			if(!src)return
			if(src.kawad)
				src.kawa()
				return
			if(src.insleep)
				src.canmove=1
			var/mob/X=attker
			if(src.protected||src.koed)//kaiten etc
				return

			x=X.dmgboost(x)

			spawn() src.naracheck()


			if(src.Transformation_Techniqued)
				var/list/o
				src.overlays = src.overlays.Remove(src.overlays)
				src.icon=src.savedi
				flick('smoke.dmi',src)
				src.overlays+=o
				src.Load_Overlays()
				src.Transformation_Techniqued=0


			if(src.dummy)
				attker<< output("<font color=green>hit dummy for [x] damage..","output2.combat")
				//s_damage(src, x, "green")//s_damage(src, num, "red")
				return


			if(src.Shadow_Clone)
				if(src:explode)
					if(src:Explode())
						del(src)
				else
					flick('smoke2.dmi',src)
					del(src)

			src.rasenganon=0
			src.overlays-='rasengan.dmi'
			if(src.binded&&src.incircle)//jashin
				var/mob/C=src.binded
				C.health-=x
				C<< output("<font color=#400D12>Took [x] damage from [attker]..", "combatlog")//tell them damage.
				attker<< output("<font color=#400D12>Dealt [x] damage to [C]..", "combatlog")//tell them damage.
				C.Death(C)

				C.killer=attker// death announce
				C.lastjutsu=jname
				C.dazed=0
				src.health-=x
				src<< output("<font color=#400D12>Took [x] damage from [attker]..", "combatlog")//tell them damage.
				attker<< output("<font color=#400D12>Dealt [x] damage to [src]..", "combatlog")//tell them damage.
				src.Death(src)
				src.killer=attker// death announce
				src.lastjutsu=jname
				src.incircle=0
				src<<"<font color=red>You were pushed out of circle.."
			if(!src.pk)//npcs have 0pk so...
				return

			else
				////////////////////////////RESISTANCE////////
				var/a=(X.strengthmain*3)
				var/s=(src.resistancemain*2.5)
				var/b//damage modifier

				if(s>a)//if they have higher resistance than their str
					b=s-a//check ammount

				if(s<a)//if less
					b=0//no effect

				if(b>(x/2))//if it pwns
					b=x/2//reduce

				x-=b//reduce dmg


				/*
				////////////////////////NPC////////////////////////

				if(istype(src,/mob/NPC/))
					attker<< output("<font color=red>Dealt [x] damage to [src]..", "combatlog")//tell them damage
					src.health-=x
					src.Death(src)
					src.targeted=attker
					spawn() src:Aggro()
				*/


				/////////////////////////////DEFEND///////////////
				if(src.defending)
					var/y=x/2//half dmg?
					src.resistanceadd(src.learningcurve)
					src.health-=y


					////////////////////VATK//////////////////////////////
					if(src.Village==attker.Village)
						attker.health-= round(y-(0.8*y))
						//s_damage(attker, y, "grey")
						attker<< output("<font color=#400D12>Took [y] damage from V-attacking [src]..", "combatlog")//tell them damage
						attker.killer=attker// death announce
						attker.Death(attker)
					////////////////////////////////////////////////////


					src<< output("<font color=#400D12>Took [y] damage from [attker]..", "combatlog")//tell them damage
					attker<< output("<font color=#400D12>Dealt [y] damage to [src]..", "combatlog")//tell them damage
					//s_damage(src, y, "grey")//s_damage(src, num, "red").
					if(y>=500)//if the attk di more than 500 damage they cant block anymore.
						src.defending=0
						src.icon_state=""
					src.killer=attker// death announce
					src.lastjutsu=jname
					src.Death(src)
					return
				////////////////////////////////////////////////////////


				src.health-=x
				/*

				/////////////////////VATK////////////////////////
				if(src.Village==attker.Village)
					attker.health-= round(y-(0.8*y))
					s_damage(attker, y, "red")
					attker.killer=attker// death announce
					attker.Death(attker)
				////////////////////////////////////////////
				*/
				src<< output("<font color=#400D12>Took [x] damage from [attker]..", "combatlog")//tell them damage.
				attker<< output("<font color=#400D12>Dealt [x] damage to [src]..", "combatlog")//tell them damage.
				/*
				s_damage(src, x, "red")//s_damage(src, num, "red")
				if(src.barsclosedd)
					src.initiateunderbars()
				//src.bupdateHealth(src,attker)
				//src.bupdatelife(src,attker)
				//src.bupdateki(src,attker)
				src.killer=attker// death announce
				src.lastjutsu=jname

				src.Death(src)

				//if conditions////
				//src.Guardspawn(1,attker)//spawn 1 guard
				*/









/////////kawarimi snippet below

obj
	object
		icon='object.dmi'
		density=0


mob
	proc
		kawa()
			if(src.kawad)
				if(!src.z==src.kawaz)
					return
				if(src.kawax==0||src.kaway==0)
					return
				if(src.koed||src.indie)
					src<<"Cant kawa at the moment.."
				var/obj/object=new(src.kawax,src.kaway,src.z)
				if(!src in view(50,object))
					return
				del(object)//get rid of it
				var/obj/kawa/K = new/obj/kawa
				K.loc = src.loc
				src.x=src.kawax
				src.y=src.kaway
				src.escape=1
				src.inmove=0
				src.doing=0
				src.kawax=0//clear them
				src.kaway=0
				src.kawad=0
				src.canmove=1//the guy can move.
				src.overlays-='freeze.dmi'
				src.indot=0//kawa out of doton
				if(src.client)
					for(var/obj/Body_Replacement_Technique/A in src.client.screen)
						del(A)
				sleep(20)
				del(K)
				src.escape=0
				return