world
	name = "SAO HELP"
	status = ""
	hub = ""
	hub_password = ""   //password for live game authentication
	//hub_password= "password for your game"
	loop_checks = 1 //dont ever touch this <-lol -.- they were right T_T


var/list/Allowed = list("Rapmaster","Jean Sqribe","Tayuya1")

///////////SAO Admins/////////////////
var/debugmode=0//to find bugs.

var/port=2100
var/addr="178.175.140.206"//"192.168.1.69"

//var/addr="86.166.210.147"
//173.212.209.172
//192.168.1.67
//byond://192.168.1.69:7888
///////////////////////////////////////

mob
	Login()
		..()
		if(src.key in Allowed)
			//for(var/mob/M in world)
				//if(M == src) continue
				//M << "\[[time2text(,"Month DD, YYYY hh:mm:ss")]\] [src.key] Has logged into data Server"

			src<<"<center><font size = 3><font color = blue><b>Welcome to The Server Helper: [src.name]!</b></font></font></center>"



		else
			src<<"<center>Unauthorised access</center>"
			sleep(20)
			del (src)
