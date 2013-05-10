var/version="0.3"
var/version_display=0.3


var/Main = {"
	<html>
	<body><STYLE>BODY {background: black; color: white}</STYLE>

	<b>Shinobi Arts Online version<font color = green>:[version]</b><br>

	<font color = red><a href=?Credits>Credits</a><br>
	<br>

	<hr><font face = courier>

	<a href="http://shinobi-arts-online.wikia.com">To find out more about this game and upcoming features, click this link to the wiki</font></a><br>

	<br>
	<font color = green><center>Updates</center><br>
	- <font color = blue>0.3-</font><font color = green><b>Massive skill system rework, optimised some skills to run faster.<br>
	- <font color = blue>0.3-</font><font color = green><b>Uchiha Clan has recieved improvements(Mangekyou!, Sharingan Copy).<br>
	- <font color = blue>0.3-</font><font color = green><b>Save System changes, can now Delete characters.<br>


	- <font color = gray>0.2-</font><font color = green><b>Save System changes, skill levels are now saved(Remote Saving).<br>
	- <font color = gray>0.2-</font><font color = green><b>Haku and water moves are fixed.<br>
	- <font color = gray>0.2-</font><font color = green><b>C3 disable untill rework.<br>
	- <font color = gray>0.2-</font><font color = green><b>Old saves being wiped since they are incopatible, all characters that log in before version 1 are given founder status.<br>
	- <font color = gray>0.2-</font><font color = green><b>If a skill fails to execute, it is put off cooldown and you get your chakra back.<br>
	- <font color = gray>0.2-</font><font color = green><b>Added Hyuuga Radar for byakuugan.<br>
	- <font color = gray>0.2-</font><font color = green><b>Lowered Kaiten duration.(Hyuuga)<br>

	- <font color = gray>0.1-</font><font color = green><b>Game has gone under redevolpment, look forward to many changes!.<br>
	</font>
	<br>

	</body>
	</html>
	"}

var/Credits = {"
	<html>
	<head><title>Credits</title></head>
	<body><STYLE>BODY {background: black; color: white}</STYLE>
	<div align="right"><a href = ?Back>Back</a></div>
	<B>Credits</b><HR>
	<center><B>Programing/Interface<br>
	<font color = red>Rapmaster<BR></font>
	<br>
	<center><B>Pixel Art<br>
	<font color = red>Danny112<BR></font>
	<font color = red>Mitch<BR></font>
	<br>
	<center><B>Map<br>
	<font color = red>Danny112<BR></font>
	<br>
	<center><B>Interface GFX<br>
	<font color = red>Tetsu<BR></font>
	<br>
	<center><B>Contributors<br>
	<font color = red>I.loves.ninjas<BR></font>
	<font color = red>Vampirism(Ruki)<BR></font>
	<font color = red>LummoxJR(swapmaps library)<BR></font>
	<font color = red>Spuzzum(s_damage library)<BR></font>
	</body>
	</html>
	"}



var/Close



mob/Login()//User Logs In
	..()
	winset(src,null,{"
	Login.version.text = "Version: [version]";
	default.menu= null
	"})
	src.Menu()

	//Apopup(src,"Welcome to beta testing version 0.1 please be aware that some bugs till exist and this is not a final product...")//You May Delete This If You Wish




mob
	proc
		Menu()
			usr << browse(Main,"window=Updates;[htmlop]")//User Browses The Main Menu Window



var/htmlop = "border=0;can_close=0;can_resize=0;can_minimize=0;titlebar=0"//HTML OPTIONS You May Change These Any Time {{border=1;can_close=1;can_resize=1;can_minimize=1;titlebar=1}}

///Add a first remove the last. //green,yellow,blue


mob
	proc
		adverts()
			src<<"<font size=3><font color = blue><b><u><a href='http://www.shinobiartsonline.tk/'>Visit the Forum</a></font>."//forum bish
			src<<"<font size=2><font color = blue><b><u><a href='http://www.byond.com/games/JeanSqribe/ShinobiArtsOnlineBuild'>Want to make some custom maps?</a></font>."

			spawn(36000) adverts()//every hour