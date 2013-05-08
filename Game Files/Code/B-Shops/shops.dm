world
	New()
		..()
		var/mob/a=new/mob/Store_Owner/LeafStore
		a.loc=locate("LeafShopNPC")
		var/mob/b=new/mob/Store_Owner/SandStore
		b.loc=locate("SandShopNPC")
		var/mob/c=new/mob/Store_Owner/MistStore
		c.loc=locate("MistShopNPC")

		var/mob/d=new/mob/Store_Owner/LeafWeapon
		d.loc=locate("LeafWeaponNPC")
		var/mob/e=new/mob/Store_Owner/SandWeapon
		e.loc=locate("SandWeaponNPC")
		var/mob/f=new/mob/Store_Owner/MistWeapon
		f.loc=locate("MistWeaponNPC")

		var/mob/g=new/mob/Store_Owner/SandPuppets
		g.loc=locate("SandPuppetNPC")


mob
	var/inshop=0
	Store_Owner
		var/storetype="shop"
		icon='storenpc.dmi'
		New()
			..()
			if(!src.contents.len)
				src.contents=new

			if(storetype=="shop")
				var/list/shoplist=initiateilist()
				for(var/obj/X in shoplist)
					src.contents += X.duplicate()//so they dont overun e.t.c

			if(storetype=="wep")
				var/list/weplist=initiatewlist()
				for(var/obj/Z in weplist)
					src.contents += Z.duplicate()//so they dont overun e.t.c



		Click()
			set src in oview(2)
			usr.inshop=1
			var/items = 0
			for(var/obj/X in src.contents)
				winset(usr, "Shop.shopgrid", "current-cell=[++items]")
				usr << output(X, "Shop.shopgrid")
			winset(usr, "Shop.shopgrid", "cells=[items]")
			winshow(usr,"Shop",1)


		LeafStore
			icon_state="leaf"
			storetype="shop"

		SandStore
			icon_state="sand"
			storetype="shop"

		MistStore
			icon_state="mist"
			storetype="shop"


		LeafWeapon
			icon_state="leaf"
			storetype="wep"

		SandWeapon
			icon_state="sand"
			storetype="wep"

		MistWeapon
			icon_state="mist"
			storetype="wep"


		SandPuppets
			icon_state="sand"
			storetype="wep"




mob
	verb
		exitshop()
			set hidden=1
			src.inshop=0
			winshow(usr,"Shop",0)




mob/proc
	buyeconomy(money)
		if(src.Leafshop)
			if(Leafprices>=0)
				money-=Leafprices
				return money

			else if(Leafprices<0)
				money+=Leafprices
				return money

		if(src.Sandshop)
			if(Sandprices>=0)
				money-=Sandprices
				return money

			else if(Sandprices<0)
				money+=Sandprices
				return money

		if(src.Mistshop)
			if(Mistprices>=0)
				money-=Mistprices
				return money

			else if(Mistprices<0)
				money+=Mistprices
				return money



/*
mob/var
   special_features

mob/Login()
   if(client.IsByondMember())
      special_features = 1
   else
      src<<"For special features, <a href=\
              'http://members.byond.com/' >become a BYOND Member</a>!"
   return ..()

*/

