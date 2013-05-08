/*
NameParser
Copyright Ryan "Lord of Water" P. 2002

Usage: use the proc ParseName() as an alternative to a line such as: src.name = input("What is your name?")
Questions and/or suggestions should be emailed to: goblin150@aol.com

ParseName() Args--

PercentUppers: percent of upper-case letters allowed in the name
	Default: 50%
PermitKey: 1 if key is allowed to be the same as name, 0 if not
	Default: 0
LowerLimit: least chars allowed in the name
	Default: 3
UpperLimit: most chars allowed in the name
	Default: 13
SavPath: name of savefile to be used in saving the names.
	Default: "PlayerSaves.sav"

Usage--

mob/Login()
	..()
	ParseName()
	src<<"Welcome to [world.name]! Your name is [src.name].."

Return nothing

*/
var/list/badlist = list("fuck","cunt","bitch","Naruto","Deidara","Jashin","gay","Uchiha","Sasuke","Uchiha Sasuke","Neji","Sakura","<",">")//add to it boi



mob/proc
	ParseName(var/PercentUppers = 50 as num,var/PermitKey = 0 as num,var/LowerLimit = 3 as num, var/UpperLimit = 13 as num)
		var/newname = ""
		newname = input("Please enter your character's name..")

		var/exists=NameSearch(newname)//search for it on the SQL db

		if(newname in badlist)
			Apopup(src,"The name [newname] has been disallowed by the owner..")
			ParseName()
		else
			if(length(newname) <= UpperLimit && length(newname) >= LowerLimit && countlowers(newname) >= LowerLimit)

				if(ckey(newname) != ckey(src.key) && PermitKey == 0)
					var/match = 1

					if(match)
						var/limit = round(length(newname)/(1+PercentUppers/100),1)

						if(countuppers(newname) < limit)
							src.name = filter(newname)

							if(exists)
								Apopup(src,"You cannot have the same name as somone else in the game..")
								ParseName()

							FinishName()

						else
							Apopup(src,"You have included too many upper case letters in your name..")
							ParseName()

					else
						Apopup(src,"You cannot have the same name as somone else in the game..")
						ParseName()

				else
					Apopup(src,"Your name cannot be the same as your key..")
					ParseName()

			else
				Apopup(src,"The name you chose is too long or too short, or there are not enough lowercase letters in your name..")
				ParseName()

mob
	var/tmp/fname=0

mob/proc
	FinishName()
		if(fname)
			return
		fname=1
		src.startout()//beginn



// From LoW's Text Handling.

proc/countlowers(var/string as text)
	var/number = 0
	var/char = ""
	anchor
	char = copytext(string,1,2)
	if(char == lowertext(char) && isnum(text2num(char)) == 0)
		var/firstchar = ckey(char)
		if(lowertext(char) == firstchar)
			number += 1
		if(uppertext(char) == firstchar)
			number += 1
	string = copytext(string,2,0)
	if(length(string) > 0) goto anchor
	else return number

proc/countuppers(var/string as text)
	var/number = 0
	var/char = ""
	anchor
	char = copytext(string,1,2)
	if(char == uppertext(char) && isnum(text2num(char)) == 0)
		var/firstchar = ckey(char)
		if(lowertext(char) == firstchar)
			number += 1
		if(uppertext(char) == firstchar)
			number += 1
	string = copytext(string,2,0)
	if(length(string) > 0) goto anchor
	else return number