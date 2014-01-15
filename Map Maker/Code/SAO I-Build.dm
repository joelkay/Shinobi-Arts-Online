proc/loaddata()
	usr.contents+=newlist(/buildable/DEFAULT/wall,/buildable/DEFAULT/denseobj,/buildable/DEFAULT/black,/buildable/DEFAULT/grass,/buildable/DEFAULT/tree)//default
	usr.contents+=newlist(/buildable/HIDEOUT/floor,/buildable/HIDEOUT/floorwithlinegap,/buildable/HIDEOUT/walls,/buildable/HIDEOUT/door)//sound
	usr.contents+=newlist(/buildable/HIDEOUT/wallsl,/buildable/HIDEOUT/wallstop,/buildable/HIDEOUT/candala)//sound
	usr.contents+=newlist(/buildable/HIDEOUT/candalb,/buildable/HIDEOUT/candalc)//sound
	loaddatamodule1()//HIDEOUT32
	loaddatamodule2()//FLOORING
	loaddatamodule3()//MOUNTAINS32
	loaddatamodule4()//TREES
	loaddatamodule5()//SNOW




