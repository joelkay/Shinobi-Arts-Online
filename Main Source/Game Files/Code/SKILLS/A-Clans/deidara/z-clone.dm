mob/NPC
	var/explode=0
	CShadow_Clone
		name
		Village=""
		health=100
		Shadow_Clone=1
		explode=1
		owner

		proc/Explode()
			var/mob/G=src.owner
			G.controlled=null
			G.client.eye=G
			/////////////////////
			var/obj/Explodespider/B=new(1)
			B.loc=src.loc
			B.dir=src.dir
			B.owner=G
			////////////////////////
			return 1

