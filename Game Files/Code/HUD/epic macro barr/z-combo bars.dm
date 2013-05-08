
obj
	Attack
		icon='skills.dmi'
		icon_state="Attack"
		name="Attack"
		screen_loc="15:16,1:4"
		density=1
		opacity=1
		layer=MOB_LAYER+4
		Click()
			usr.defending=0
			//usr.attackk()

	Sword
		icon='skills.dmi'
		icon_state="Sword2"
		name="Sword"
		screen_loc="17:16,1:4"
		density=1
		opacity=1
		layer=MOB_LAYER+4
		Click()
			usr.defending=0
			usr.Swordatk()

	Return
		icon='skills.dmi'
		icon_state="Return"
		name="Return"
		screen_loc="18:16,1:4"
		density=1
		opacity=1
		layer=MOB_LAYER+4
		Click()
			usr.Return()

	Untarget
		icon='skills.dmi'
		icon_state="Untarget"
		name="Untarget"
		screen_loc="19:16,1:4"
		density=1
		opacity=1
		layer=MOB_LAYER+4
		Click()
			usr.Untarget()

	Defend
		icon='skills.dmi'
		icon_state="Defend"
		name="Defend"
		screen_loc="16:16,1:4"
		density=1
		opacity=1
		layer=MOB_LAYER+4
		Click()
			if(usr.life<=0||usr.koed)
				return
			usr.Defend()
mob
	verb
		Defend()
			set hidden=1
			var/mob/M=src.targeted
			if(src.koed||!src.canmove)return
			if(M)
				src.Facedir(M)
			src.icon_state="Defending"
			src.defending=1

			for(var/obj/SandM/A in view())
				if(A&&A.owner==src)
					walk(A,0)
					A.loc=src.loc

			for(var/mob/puppet1/B in view())
				if(B&&B.owner==src)
					walk(B,0)
					B.loc=src.loc

			for(var/mob/puppet2/C in view())
				if(C&&C.owner==src)
					walk(C,0)
					C.loc=src.loc

			for(var/mob/puppet3/D in view())
				if(D&&D.owner==src)
					walk(D,0)
					D.loc=src.loc





