mob
	var
		tmp/loggedIn=0
		tmp/promptopen=0
		tmp/busyscene=0
		initiated=0////////////////////////////////////////////
		timesaved=0

	proc
		Save(var/num=0)//default is zero
			Save_Mob(src,num)//do a custom save


var/list/Ghosts = list()
var/cansave=1
proc
	Save_Mob(mob/M,var/num=0)
		set background=1
		if(!M.client)return

		if(!cansave)
			if(debug)world<<"This character can not save."
			return

		M.totaltime+=M.logintime//update it

		if(debug)world<<"Timesaved:[M.timesaved]"
		M.timesaved+=1
		if(debug)world<<"Timesaved updated to:[M.timesaved]"

		M.last_x=M.x
		M.last_y=M.y
		M.last_z=M.z

		M.save_char()//make a local copy, incase the server is slow?

		//SAVE ONTO THE SQL SERVER//
		if(!num)
			SaveSQL(M)

		else
			Ghosts.Add(M.name)//list of mobs to save onto sql


		return 1




/*
	proc
		AutoLoop()
			set background=1
			if(!src.client)return

			while(src) //constant loop
				sleep(autotime)
				src.save_char()
*/


mob/proc/loader(var/num=0)
	set background=1
	//src.check()
	src.loggedin=1
	if(src.style)
		src.showmacros()// initiated at end
	src.adverts()
	spawn()
		src.loadfirst()
	removejoinbutton()

	if(Ghosts.Find(src.name))
		spawn(20)
			src.Save(num)//update the sql server with your stuff.
		Ghosts.Remove(src.name)

	world<<"World: <font color=white>[src.name] has logged in!" // tells world you logged in
	/*
	world<<"World: <font color=white>[src.name] has logged out!!!!!" // tells world you logged in
	if(src.WAR)//If the guy is in
		if(src.Village==Attacker)
			Attackpoints-=1
		if(src.Village==Defender)
			Defendpoints-=1

	for(var/mob/NPC/Shadow_Clone/B in world)
		if(B.owner == src)
			flick("smoke2.dmi",B)
			del(B)
	*/
	src.loadvalues()
	src.delpreviews()



mob/proc/loadvalues()
	set background=1
	if(src.Village=="Leaf")
		if(src.kage)
			world<<"<font color=green>The Leaf Kage [src] has joined.."
		if(Leafoption1)
			src.learningcurve=Leaf_maxrate
		if(Leafoption2)
			src.dexterityplus=Leaf_poweratk
			src.reflexplus=Leaf_poweratk
		if(Leafoption3)
			src.dexterityplus=Leaf_powerdef
			src.reflexplus=Leaf_powerdef
		else
			src.learningcurve=40
		return

	if(src.Village=="Sand")
		if(src.kage)
			world<<"<font color=yellow>The Sand Kage [src] has joined.."
		if(Sandoption1)
			src.learningcurve=Sand_maxrate
		if(Sandoption2)
			src.dexterityplus=Sand_poweratk
			src.reflexplus=Sand_poweratk
		if(Sandoption3)
			src.dexterityplus=Sand_powerdef
			src.reflexplus=Sand_powerdef
		else
			src.learningcurve=40
		return

	if(src.Village=="Mist")
		if(src.kage)
			world<<"<font color=blue>The Mist Kage [src] has joined.."
		if(Mistoption1)
			src.learningcurve=Mist_maxrate
		if(Mistoption2)
			src.dexterityplus=Mist_poweratk
			src.reflexplus=Mist_poweratk
		if(Mistoption3)
			src.dexterityplus=Mist_powerdef
			src.reflexplus=Mist_powerdef
		else
			src.learningcurve=40
		return

	else
		src.learningcurve=40
		return
mob
	proc
		loadfirst()
			set background=1
			if(!src.client)
				return
			src.busyscene=0
			src.client.eye = src
			src.sight |= (SEE_MOBS|SEE_OBJS|SEE_TURFS)  // turn on several bits at once
			//vis.is_not_a(src.name)//make you visible to others/ not doing cutscenes anymore

			src.style=1//to load macro bar.
			inscenes=0
			src.doing=0//they can do jutsus
			src.clickedc=0//so they can buy agen.

			src.canmove=1//enable di-Rs
			src.mdelay=0
			src.inmove=0

			spawn() src.regeneration()

			src.logintime=world.time
			src.align()//show chat bar

			spawn() if(!people.Find(src)) people.Add(src)

			spawn()
				src.Affirm_Icon()
				src.Load_Overlays()


			///HOST///
			src.InitiateHost()

			//hand out admin//
			src.admin()

			if(src.kage)
				src.verbs += typesof(/mob/hokage/verb)

			if(src.factionll)
				src.verbs += typesof(/mob/FactionL/verb)

			if(src.proctorLeaf||src.proctorMist||src.proctorSand)
				src.verbs += typesof(/mob/proctor/verb)

			//ADD GROUPLEADER,GROUPMEMBER when fixed.
			spawn() Teamage()
		//	src.initiatebars()
		//	src.Teamage()

			src.client.show_verb_panel = 1
			src.fixjutsus=1//jutsu fix
			src.canmove=1
			src.inmove=0
			src.mdelay=0
			src.UpdateSkills()
			versionchecker(src)
			////src.Show_Radar()

			src.finalise()//respec e.t.c

			if(src.loc==locate(1,1,1))
				src.Respawn()

			if(src.life<=0)
				src.Death(src)

		//	spawn() src.AutoLoop()//auto save lyk





