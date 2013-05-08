var/list/wlist=list()
var/list/wlistA=list()
var/list/wlistB=list()


proc
	initiatewlist()
		wlist=new
//////////RATON/////////////
		wlist += newlist(/Weapon/Sword,/Weapon/KSword,/Weapon/Kunai,/Weapon/Shuriken)
		return wlist


