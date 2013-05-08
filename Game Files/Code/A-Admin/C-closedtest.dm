client
	New()//New Client
		..()//Call the parent
		Closed_Testing()
client//You or a person who logs in
	proc
		Closed_Testing()//Name of proc
			if(testers.Find(src.key))//check the var/list to see if their key is their
				src<<"<b><font color='red'>[src]<font color='red'> you are a closed tester for the updated version of Shinobi Arts Online"//if it is send them this message.
			else//If not.
				src<<"<b><font color='red'>[src]<font color='red'> you are not a closed tester of the new version.."
				src<<"ASK ON forum TO BE ADDED TO LIST."
				world<<"<b><font color='red'>[src]<font color='red'> tried to login to [world.name].."//Sends the world this message
				del(src)//Logs the non-tester out.


var/list/testers=list("Jdog21","Shenjut","Vampirism96","Garushii","Sky_Angelz","Uchiha266","TS Sasuke","Slipher93","Winchester","Majpaj","Pimp6702","Chidori_As","Diego-Lawliet","BODEY","Prince_Kilonzo","Zchris55","Tayuya","King_O","Craig28","Im phill 1","Coolcristex","Eltigre70","Tevin64","Masterdk","Pielover101","BabyVegeta1234","Silverxjr","Josblud","Jezblud","Bjisboss","Gellenduoz","Avainer1","Danny112","Rapmaster","King clarion","69Wolfy96","Shawn265")//right this is the list of testers var. Make sure you use the capitals in your keys because it is case sensitive.
//lol delete guest when done testing "Guest", -> 4 easy copy pastin u get me
//client
	//command_prompt = "Version [version]"