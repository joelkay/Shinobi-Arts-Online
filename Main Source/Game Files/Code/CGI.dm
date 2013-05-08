#include <Dantom/CGI> //common sense
#include <Dantom/htmllib>
#include <Deadron/TextHandling>
#include <Deadron/Test>
var/list/Pages=list()
world/New()
	..()
	Pages["index"]={"Welcome to the DMCGI demo.  Thanks to airjoe who helped me improve
	and stabilize the code, and make it easier for beginners to understand.
It's pretty simple, to add a page, add <br>
<font color=blue>Page\["Link_To_Page"]="PUT THE CONTENTS HERE"</font>
<br>to the World/New()
<br><br>I tried to make this tutorial in the mind that people know too little about
DMCGI, and that it's boundries are limitless."}
	Pages["Page1"]="Page one."
	Pages["Page2"]="Page two."
CGI//Important! You need this to activate CGI websites!
	Topic(href,hreflist[])
		var/Display
		if(!href)href="index"
		if(href in Pages)
			Display=Pages[href]
		usr<<browse("[header][Display][footer]")

var/
	title="<h1>Welcome to the DMCGI Test Demo!</h1>"

	header={"<html><head>
<title>Welcome to my site!</title>
<body text=white bgcolor=black>
<div id="container">
<div id="menu">
<center>

<div class="menu_box"><B>[title]<hr color=red>

<a href="?Page1">Page 1</a> :
<a href="?Page2">Page 2</a> :
<a href="?index">Return Home</a>

</center>
</div>
<div id="content">
<hr color=red>
<div class="news_area">
</body>
</html>"}

	footer={"<br><br><br><br><small>
This is a footer, what goes at the bottom of a page (like a copywrite)
</small>"}