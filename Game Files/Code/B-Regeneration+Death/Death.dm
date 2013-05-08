mob
	var/indie=0
	var/canarr=0
	var/deletable=0
	var/dojo=0
	var/Leafdojo=0
	var/Mistdojo=0
	var/Sanddojo=0
mob
	proc
		Death(mob/M)
			//if(M.protected) shouldnt reach here eneway.
			//	return
			if(M.dummy)
				return
			if(M.Shadow_Clone)
				flick('smoke2.dmi',M)
				del(M)
				return
			else
				if(M.koed)
					return

				if(M.health<=0)
					if(M.deletable)
						del(M)
						return

					M.doing=1//cant do jutsus
					M.canmove=0//froze
					var/damage=rand(50,55)
					M.life-=damage
					M.koed=1
					M.health=0
					flick("koflick",M)
					M.icon_state="ko"
					M<<"<b>You have been KO'd. Lost [damage] life"
					if(M.deathforest)
						for(var/obj/items/earthscroll/E in M.contents)
							if(E)
								E.loc=locate(M.x,M.y,M.z)
								M.earthscroll = 0
						for(var/obj/items/heavenscroll/H in M.contents)
							if(H)
								H.loc=locate(M.x,M.y,M.z)
								M.earthscroll = 0



					spawn(80)//8 seconds.
						if(M.indie)
							return
						else
							////DIE PROC EMBEDED//////////////
							if(M.intourn)
								if(M.life<=0)
									M.tourndied=1//part for tourny to handle?
									M<<"<b>You have no life left"
									M<<"<b>You have died.."
									M.Respawn()
									M.canmove=0
									M.Save()
									M.canmove=1// they can move
									M.intourn=0//remove from tourny.
									return
								else// if they still have life
									M.health=M.max_health/2
									M.protected=1
									M.koed=0
									M.canmove=1
									M.icon_state=""
									M.indie=0
									M.canregen=1
									spawn() M.regeneration()
									sleep(40)
									M.protected=0
									return
							if(M.dojo)
								if(M.life<=0)
									M<<"You were defeated.."
									M.chakra=M.max_chakra
									M.health=M.max_health
									M.life=100
									M.canregen=1
									spawn() M.regeneration()
									if(M.Leafdojo)
										M.loc=locate("LeafDojoRespawn")
										M.canmove=1// they can move
										M.Reset()
										return
									if(M.Sanddojo)
										M.loc=locate("SandDojoRespawn")
										M.canmove=1// they can move
										M.Reset()
										return
									if(M.Mistdojo)
										M.loc=locate("MistDojoRespawn")
										M.canmove=1// they can move
										M.Reset()
										return
									else
										M.Respawn()
										return
								else// if they still have life
									M.health=M.max_health/2
									M.koed=0
									M.canmove=1
									M.canregen=1
									spawn() M.regeneration()
									M.protected=1
									M.doing=0//can do jutsus
									M.icon_state=""
									M.indie=0
									sleep(40)
									M.protected=0
									return
							else
								if(M.life<=0)
									M.icon_state="ko"
									if(!M.client)
										M.canarr=1
										M.die()
										return

									if(M.Clan=="Uzumaki"&&!M.willused)
										var/randi=rand(10,30)
										if(randi>20)
											M<<"your will to persist kicked in. you gained 10 life.."
											M.life+=10
											M.willused=1
											M.health=M.max_health/2
											M.koed=0
											M.canmove=1
											M.canregen=1
											spawn() M.regeneration()
											M.protected=1
											M.doing=0//can do jutsus
											M.icon_state=""
											M.indie=0
											sleep(40)
											M.protected=0
											return

									M<<"<b>You have 60 seconds to be recovered or press R to respawn now</b>"

									M.canmove=0
									M.canregen=0
									M.doing=1
									M.chakra=0
									M.health=0
									spawn(600)// waits 60 seconds
										if(M.life<=0&&!M.canarr)//havent pressed w or w.e
											src.canarr=1
											M.die()
											return

										else//if revived
											M.health=M.max_health/2
											M.koed=0
											M.canmove=1
											M.canregen=1
											spawn() M.regeneration()
											M.protected=1
											M.doing=0//can do jutsus
											M.icon_state=""
											M.indie=0
											sleep(40)
											M.protected=0
											return
								else// if they still have life
									M.health=M.max_health/2
									M.koed=0
									M.canmove=1
									M.canregen=1
									spawn() M.regeneration()
									M.protected=1
									M.doing=0//can do jutsus
									M.icon_state=""
									M.indie=0
									sleep(40)
									M.protected=0
									return




mob
	verb
		arr()// the W proc mush
			set hidden =1
			src.canarr=1
			src.die()


	proc
		die()
			var/mob/M=src
			var/mob/X=M.killer
			var/j=src.lastjutsu
			if(!M.canarr)
				return
			if(M.life<=0)
				M.canmove=0
				M.canarr=0
				M<<"<b>You have no life left</b>"
				M<<"<b>You have died.</b>"
				if(!M.client)
					var/exp=rand(1000,3000)
					if(X)
						X.exp+=round(exp)
						X<<"You got [exp] exp for killing [M].."
						//M:DeathDrop(X)
				if(X)
					if(X.client && X!=M && M.client)
						world<<"<b>[M.name] has been killed by [X.name]</b>"

				else
					world<<"<b>[M.name] has died</b>"

				M.Respawn()
				M.canmove=1
				if(X&&j)
					X<<"<b>[j] kills +1</b>"
					X.jutsuadd(j)


				spawn()
					if(M.WAR)
						if(M in DefenderGuys)
							DefenderGuys.Remove(src)
							M.asked=0

						if(M in AttackerGuys)
							AttackerGuys.Remove(src)
							M.asked=0

						src.removejoinbutton()

						M.WAR=0//remove from
						X.warkills++

						spawn()
							var/params
							X<<"Got [X.warkills] war kills currently.."
							params=list("War-kills"=X.warkills)
							world.SetScores(X.key,list2params(params))


						world<<"<font color=red>Attacking side has [AttackerGuys.len] members left.</font>"
						world<<"<font color=blue>Defending side has [DefenderGuys.len] members left.</font>"
						M.Respawn()
						M.Save()
						M.canmove=1
						return

					M.deaths++
					if(M.Village=="Leaf")
						Leaf_Orb-=0.5
						M.contribution-=0.5
					if(M.Village=="Sand")
						Sand_Orb-=0.5
						M.contribution-=0.5
					if(M.Village=="Mist")
						Mist_Orb-=0.5
						M.contribution-=0.5
					var/mob/D=X


					if(D)
						D.killstreak()
						if(D.Village=="Leaf")
							Leaf_Orb(0.1)
							D.contribution+=0.1
						if(D.Village=="Sand")
							Sand_Orb(0.1)
							D.contribution+=0.1
						if(D.Village=="Mist")
							Mist_Orb(0.1)
							D.contribution+=0.1

					if(M.bingo&&D)//remove from bingo book
						var/A=M.bingo
						M.bingo=0
						if(D.teamname)
							var/Team/x =new/Team
							x.teamname=src.teamname
							var/ammo=A/2
							x.moneyshare(ammo)
						else
							D.money+=A
							D<<"Recieved [A] from killing [M].."



				M.Save()
				return




