mob
	proc
		Guardspawn(num,mob/trg)
			set background=1
			while(num)
				var/mob/NPC/A=new/mob/NPC
				A.loc=src.loc
				A.GUARD=1
				A.action="ATTACK"
				A.targeted=trg
				A.Village=src.Village
				num--

