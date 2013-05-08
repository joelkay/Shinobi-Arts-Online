obj/items
	proc/Buy()
		if(usr.inshop)
			switch(alert("Would you wish to buy \an [src.listid]","","Yes","No"))
				if("Yes")
					var/ammount=usr.buyeconomy(src.money)
					if(ammount<=usr.money)

						Apopup(usr,"You bought \an [src.listid]")

						usr.contents += src.duplicate()//so they dont overun e.t.c

						usr.money -= ammount
						usr.UpdateEquipment()

						if(usr.Leafshop)
							Leafeconomm+=0.5
						if(usr.Sandshop)
							Sandeconomm+=0.5
						if(usr.Mistshop)
							Misteconomm+=0.5

					else
						Apopup(usr,"<i>Not enough money!")
						return
		else
			return

obj/items

	layer=11
	var
		deletable=0 //is it temporary? set this to 1
		equipped=0
		weight=1
		nottossable=0
		money=50
		posit=0
		worn=0
		weapon
		armor
		equip
		burst=1
		icon2//the icon of the actual clothing
		listid=""//for the SQL server


	verb
		Get()
			set category = "Character Management"
			set src in oview(1)
			Move(usr)

		Drop()
			set category = "Character Management"
			set src in usr
			if(!src.nottossable)
				usr.heavenscroll = 0
				usr.earthscroll = 0
			else
				usr.heavenscroll = 0
				usr.earthscroll = 0
				Move(usr.loc)



	proc/Use()
		var/equ=src.equipped
		for(var/obj/items/O in usr.contents)
			if(O.armor==src.armor&&O!=src)
				O.overlays=0
				O.equipped=0
		if(equ)
			switch(src.armor)
				if("special")usr.specialinv=null
				if("armor")usr.armorinv=null
				if("legarmor")usr.legarmorinv=null
				if("armarmor")usr.armarmorinv=null
				if("facearmor")usr.facearmorinv=null
				if("cloak")usr.cloakinv=null
				if("weapon")usr.weaponinv=null
				if("shoes")usr.shoesinv=null
			src.equipped=0
			src.overlays=null
		else
			switch(src.armor)
				if("special")usr.specialinv=src.icon2
				if("armor")usr.armorinv=src.icon2
				if("legarmor")usr.legarmorinv=src.icon2
				if("armarmor")usr.armarmorinv=src.icon2
				if("facearmor")usr.facearmorinv=src.icon2
				if("cloak")usr.cloakinv=src.icon2
				if("weapon")usr.weaponinv=src.icon2
				if("shoes")usr.shoesinv=src.icon2
			src.equipped=1
			src.overlays+='Equipped.dmi'

		usr.Load_Overlays()
	Click()
		if(usr.inshop)
			Buy(src)
		else
			Use(usr)
			usr.UpdateEquipment()



	Headband
		icon='items gui.dmi'//this icon does NOT fit the base, its just to show object layering
		icon2 = 'headband.dmi'//for wearing
		icon_state="headband"
		armor="facearmor"
		listid="Headband"

	HokageSuit
		icon='HokageSuit.dmi'//this icon does NOT fit the base, its just to show object layering
		icon2='HokageSuit.dmi'
		icon_state="skills"
		armor="special"


	KazekageSuit
		icon='KazekageSuit.dmi'//this icon does NOT fit the base, its just to show object layering
		icon2='KazekageSuit.dmi'
		icon_state="skills"
		armor="special"


	MizukageSuit
		icon='MizukageSuit.dmi'//this icon does NOT fit the base, its just to show object layering
		icon2='MizukageSuit.dmi'
		icon_state="skills"
		armor="special"


	MizukageHat
		icon='MizukageHat.dmi'//this icon does NOT fit the base, its just to show object layering
		icon2='MizukageHat.dmi'
		icon_state="skills"
		armor="special"

	KazekageHat
		icon='KazekageHat.dmi'//this icon does NOT fit the base, its just to show object layering
		icon_state="skills"
		armor="special"

	HokageHat
		icon='HokageHat.dmi'//this icon does NOT fit the base, its just to show object layering
		icon2='HokageHat.dmi'
		icon_state="skills"
		armor="special"


	Sandals
		icon='sandals.dmi'//this icon does NOT fit the base, its just to show object layering
		icon2='sandals.dmi'
		icon_state="skills"
		armor="shoes"

////////////////////////////////////////////////////////////

	legarmor
		armor="legarmor"
		Casual
			money=200//cost
			icon='items gui.dmi'
			icon2='black pants.dmi'
			icon_state="casual_pants"
			listid="black_pants"//unique identifier


////////////////////////////////////////////////////////////

	armors
		armor="armor"
		Black
			money=100//cost
			icon='items gui.dmi'
			icon2='black shirt.dmi'
			icon_state="black_shirt"
			listid="black_shirt"


///////////////////////////////////////////////////////////////
	Suits
		armor="cloak"
		Black
			icon='suit.dmi'//this icon does NOT fit the base, its just to show object layering
			icon_state="skills"

/////////////CHUUNIN VESTS////////////////////////////////

	CVests
		armor="armor"
		Leaf
			icon='items gui.dmi'//this icon does NOT fit the base, its just to show object layering
			icon2='leafvest.dmi'
			icon_state="leaf_chuunin"

		Sand
			icon='sandvest.dmi'//this icon does NOT fit the base, its just to show object layering
			icon2='sandvest.dmi'
			icon_state="skills"

		Mist
			icon='mistvest.dmi'//this icon does NOT fit the base, its just to show object layering
			icon2='mistvest.dmi'
			icon_state="skills"




/*
obj/items/usable
	var/oname
	New()
		var/mob/X = src.loc //only spawn this object IN a player
		for(var/obj/items/usable/O in X.contents)
			if(O.type==src.type && src!=O)
				O.equipped++
				O.name="[src.oname]([equipped])"
				del(src)

		src.oname=src.name
		src.equipped+=1
		src.name="[src.oname]([equipped])" //equipped is used for the quantity variable
	proc/Refreshcount(mob/O)
		for(var/obj/items/usable/x in O.contents)
			if(istype(x,src.type))
				x.equipped--
				x.name="[src.oname]([equipped])"
				if(x!=src)
					if(x.equipped<=0)
						del(x)
		if(src.equipped<=0)
			del(src)
	proc/Refreshcountdd(mob/O)
		for(var/obj/items/x in O.contents)
			if(istype(x,src.type))
				x.name="[src.oname]([equipped])"
				if(x!=src)
					if(x.equipped<=0)
						del(x)
		if(src.equipped<=0)
			del(src)

	Bandage
		icon='skills.dmi'
		icon_state="bandage"
		equipped=1 //this is the quantity for these types of items
		proc/Use(var/mob/u)
			set hidden=1
			set category=null
			usr=u
			if(usr.stunned==0)
				usr.busy=1
				usr.stunned=4
				usr<<"Using Bandages...."
				sleep(40)
				usr<<"500 health recovered!."
				usr.health+=500
				if(usr.health>usr.max_health)
					usr.health=usr.max_health

				src.Refreshcount(usr)
		Click()
			if(usr.inshop)
				Buy(src)
			else
				Use(usr)



*/




