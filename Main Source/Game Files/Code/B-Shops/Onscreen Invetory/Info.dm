/* Date: November 18, 2004

This is a on-screen invetory system created by Justin Kogler(SSJ Radditz).

Compared to the original I created, this is much much more efficient, not to mention
much better programmed.

I hope you enjoy it, and please, don't be afraid to send me some input at SSJRad@hotmail.com.

Thanks

*/

/*
world
	view = 7
	mob = /mob/Man
	turf = /turf/grass
	name = "OSI System: By SSJ Radditz"
mob
	Man
		icon = 'Man.dmi'
turf
	grass
		icon = 'grass.dmi'
mob
	Move()
		if(move)
			..()
		else
*/
mob
	var
		move = 1//Variable for movement. 1 = Allow, 0 = Disable
		InventoryUp = 0//Variable telling whether your OSI is up, or not
		OSIPos = 0 //Variable showing the last item you can see on the OSI

	proc
		Inventory()
			if(usr.InventoryUp == 0)
				usr.InventoryUp = 1
				CreateInventory(usr)
		Close_Inventory()
			if(usr.InventoryUp)
				for(var/obj/items/O in usr.client.screen)
					usr.client.screen -= O
					O.layer = OBJ_LAYER
				for(var/obj/HUD/H in usr.client.screen)
					del(H)
				usr.InventoryUp = 0
				usr.move = 1