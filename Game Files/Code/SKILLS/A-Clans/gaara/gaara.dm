obj
	SandM
		icon='gaara.dmi'
		icon_state="monster"
		name="Sand"
		var/coffinate=0
		var/coffin=0
		layer=MOB_LAYER+1
		density=1

		Del()
			..()

		Move()
			if(coffin)
				return
			else
				..()

		Bump(atom/movable/a)
			if(ismob(a))
				if(src.coffinate)
					var/mob/B=a
					B.canmove=0
					coffin=1
					var/mob/G=src.owner
					src.loc=B.loc
					src.icon='Sandcoffin.dmi'
					sleep(9)//visual
					src.icon='holdfuneral.dmi'
					sleep(6)
					src.icon='sandfuneral.dmi'
					Blood(B.x,B.y,B.z)
					B.canmove=1
					var/dmg=2000+(G.chakraforcemain*3)
					B << output("[G]'s Sand Desert coffin hit you for [dmg]!", "combatlog")
					B.Dec_health(dmg,G,"Desert_coffin")// use Dec_health boi
					del(src)

				else
					var/mob/X=a
					var/mob/G=src.owner
					if(X==G)//owner
						return
					X.Dec_health(150,G,"Sand")
					del(src)