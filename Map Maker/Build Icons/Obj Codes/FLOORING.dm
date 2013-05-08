proc/loaddatamodule2()
	usr.contents+=newlist(/buildable/FLOORING/grass2,/buildable/FLOORING/grassnew,/buildable/FLOORING/grassnewf,/buildable/FLOORING/dgrass,/buildable/FLOORING/dgrass2,)//dgrass2
	usr.contents+=newlist(/buildable/FLOORING/dgrass3,/buildable/FLOORING/dgrass4,/buildable/FLOORING/dirt,)//dirt
	usr.contents+=newlist(/buildable/FLOORING/twentyone,/buildable/FLOORING/twentytwo,/buildable/FLOORING/twentythree,)//twentythree
	usr.contents+=newlist(/buildable/FLOORING/twentyfour,/buildable/FLOORING/dirt3,/buildable/FLOORING/dirt2,)//dirt2

	usr.contents+=newlist(/buildable/FLOORING/darkgrass,/buildable/FLOORING/d1,/buildable/FLOORING/d2,)//d2
	usr.contents+=newlist(/buildable/FLOORING/d3,/buildable/FLOORING/d4,/buildable/FLOORING/five,)//five
	usr.contents+=newlist(/buildable/FLOORING/six,/buildable/FLOORING/seven,/buildable/FLOORING/eight,)//eight
	usr.contents+=newlist(/buildable/FLOORING/c1,/buildable/FLOORING/c2,/buildable/FLOORING/c3,)//c3

	usr.contents+=newlist(/buildable/FLOORING/c4,/buildable/FLOORING/tile,/buildable/FLOORING/tile2,)//tile2
	usr.contents+=newlist(/buildable/FLOORING/flower,/buildable/FLOORING/tile3,/buildable/FLOORING/tile4,)//tile4
	usr.contents+=newlist(/buildable/FLOORING/flower,/buildable/FLOORING/peble,/buildable/FLOORING/peble2,)//peble2
	usr.contents+=newlist(/buildable/FLOORING/grass,/buildable/FLOORING/diagonalgrass,/buildable/FLOORING/diagonalgrass2,)//diagonalgrass2

	usr.contents+=newlist(/buildable/FLOORING/diagonalgrass3,/buildable/FLOORING/diagonalgrass4,/buildable/FLOORING/one,)//one
	usr.contents+=newlist(/buildable/FLOORING/two,/buildable/FLOORING/three,/buildable/FLOORING/four,)//four
	usr.contents+=newlist(/buildable/FLOORING/tip,/buildable/FLOORING/tip2,/buildable/FLOORING/tip3,)//peble2
	usr.contents+=newlist(/buildable/FLOORING/tip4,/buildable/FLOORING/side,/buildable/FLOORING/side2,)//side2

	usr.contents+=newlist(/buildable/FLOORING/side3,/buildable/FLOORING/side4,/buildable/FLOORING/side5,)//side5
	usr.contents+=newlist(/buildable/FLOORING/corner,/buildable/FLOORING/corner1,/buildable/FLOORING/corner2,)//corner2
	usr.contents+=newlist(/buildable/FLOORING/corner3,/buildable/FLOORING/b1,/buildable/FLOORING/b2,)//b2
	usr.contents+=newlist(/buildable/FLOORING/b3,/buildable/FLOORING/b4,/buildable/FLOORING/b5,)//b5

	usr.contents+=newlist(/buildable/FLOORING/b6,/buildable/FLOORING/b7,/buildable/FLOORING/b8,)//b8
	usr.contents+=newlist(/buildable/FLOORING/wood,/buildable/FLOORING/stair,/buildable/FLOORING/shade,)//shade
	usr.contents+=newlist(/buildable/FLOORING/sand2,/buildable/FLOORING/nine,/buildable/FLOORING/ten,)//ten
	usr.contents+=newlist(/buildable/FLOORING/eleven,/buildable/FLOORING/twelve,/buildable/FLOORING/sand,)//sand

	usr.contents+=newlist(/buildable/FLOORING/thirteen,/buildable/FLOORING/fourteen,/buildable/FLOORING/fifteen,)//tile2
	usr.contents+=newlist(/buildable/FLOORING/sixteen,/buildable/FLOORING/dirt4,/buildable/FLOORING/seventeen,)//seventeen
	usr.contents+=newlist(/buildable/FLOORING/eighteen,/buildable/FLOORING/nineteen,/buildable/FLOORING/twenty,)//twenty
	usr.contents+=newlist(/buildable/FLOORING/dirttip,/buildable/FLOORING/shadetip,/buildable/FLOORING/shadetip2,)//shadetip2

	usr.contents+=newlist(/buildable/FLOORING/log,/buildable/FLOORING/log1,/buildable/FLOORING/log2,)//log3
	usr.contents+=newlist(/buildable/FLOORING/log3,/buildable/FLOORING/moss,/buildable/FLOORING/moss1,)//tile4
	usr.contents+=newlist(/buildable/FLOORING/moss2,/buildable/FLOORING/moss3,/buildable/FLOORING/hosp,)//hosp
	usr.contents+=newlist(/buildable/FLOORING/stair2,/buildable/FLOORING/stair3,/buildable/FLOORING/stair4,)//diagonalgrass2

	usr.contents+=newlist(/buildable/FLOORING/wood2,/buildable/FLOORING/water,/buildable/FLOORING/top,)//top
	usr.contents+=newlist(/buildable/FLOORING/bottom,/buildable/FLOORING/right,/buildable/FLOORING/left,)//left
//WOOOT

buildable
	FLOORING
		icon = 'flooring2.dmi'


		grass2
			icon_state = "grass2"
			build = /buildable/FLOORING/grass2

		grassnew
			icon_state = "grassb"
			build = /buildable/FLOORING/grassnew

		grassnewf
			icon_state = "grassb2"
			build = /buildable/FLOORING/grassnewf

		dgrass
			icon_state = "dgrass"
			build = /buildable/FLOORING/dgrass
		dgrass2
			icon_state = "dgrass2"
			build = /buildable/FLOORING/dgrass2
		dgrass3
			icon_state = "dgrass3"
			build = /buildable/FLOORING/dgrass3
		dgrass4
			icon_state = "dgrass4"
			build = /buildable/FLOORING/dgrass4
		dirt
			icon_state = "dirt"
			build = /buildable/FLOORING/dirt
		twentyone
			icon_state = "21"
			build = /buildable/FLOORING/21
		twentytwo
			icon_state = "22"
			build = /buildable/FLOORING/22
		twentythree
			icon_state = "23"
			build = /buildable/FLOORING/23
		twentyfour
			icon_state = "24"
			build = /buildable/FLOORING/24
		dirt3
			icon_state = "dirt3"
			build = /buildable/FLOORING/dirt3
		dirt2
			icon_state = "dirt2"
			build = /buildable/FLOORING/dirt2
		darkgrass
			icon_state = "darkgrass"
			build = /buildable/FLOORING/darkgrass
		d1
			icon_state = "d1"
			build = /buildable/FLOORING/d1
		d2
			icon_state = "d2"
			build = /buildable/FLOORING/d2
		d3
			icon_state = "d3"
			build = /buildable/FLOORING/d3
		d4
			icon_state = "d4"
			build = /buildable/FLOORING/d4
		five
			icon_state = "five"
			build = /buildable/FLOORING/five
		six
			icon_state = "six"
			build = /buildable/FLOORING/six
		seven
			icon_state = "seven"
			build = /buildable/FLOORING/seven
		eight
			icon_state = "eight"
			build = /buildable/FLOORING/eight
		c1
			icon_state = "c1"
			build = /buildable/FLOORING/c1
		c2
			icon_state = "c2"
			build = /buildable/FLOORING/c2
		c3
			icon_state = "c3"
			build = /buildable/FLOORING/c3
		c4
			icon_state = "c4"
			build = /buildable/FLOORING/c4
		tile
			icon_state = "tile"
			build = /buildable/FLOORING/tile
		tile2
			icon_state = "tile2"
			build = /buildable/FLOORING/tile2
		flower
			icon_state = "flower"
			build = /buildable/FLOORING/flower
		tile3
			icon_state = "tile3"
			build = /buildable/FLOORING/tile3
		tile4
			icon_state = "tile4"
			build = /buildable/FLOORING/tile4
		flower2
			icon_state = "flower2"
			build = /buildable/FLOORING/flower2
		peble
			icon_state = "peble"
			build = /buildable/FLOORING/peble
		peble2
			icon_state = "peble2"
			build = /buildable/FLOORING/peble2
		grass
			icon_state = "grass"
			build = /buildable/FLOORING/grass
		diagonalgrass
			icon_state = "diagonalgrass"
			build = /buildable/FLOORING/diagonalgrass
		diagonalgrass3
			icon_state = "diagonalgrass3"
			build = /buildable/FLOORING/diagonalgrass3
		diagonalgrass4
			icon_state = "diagonalgrass4"
			build = /buildable/FLOORING/diagonalgrass4
		diagonalgrass2
			icon_state = "diagonalgrass2"
			build = /buildable/FLOORING/diagonalgrass2
		one
			icon_state = "one"
			build = /buildable/FLOORING/one
		two
			icon_state = "two"
			build = /buildable/FLOORING/two
		three
			icon_state = "three"
			build = /buildable/FLOORING/three
		four
			icon_state = "four"
			build = /buildable/FLOORING/four
		tip
			icon_state = "tip"
			build = /buildable/FLOORING/tip
		tip2
			icon_state = "tip2"
			build = /buildable/FLOORING/tip2
		tip3
			icon_state = "tip3"
			build = /buildable/FLOORING/tip3
		tip4
			icon_state = "tip4"
			build = /buildable/FLOORING/tip4
		side
			icon_state = "side"
			build = /buildable/FLOORING/side
		side1
			icon_state = "side1"
			build = /buildable/FLOORING/side1
		side2
			icon_state = "side2"
			build = /buildable/FLOORING/side2
		side3
			icon_state = "side3"
			build = /buildable/FLOORING/side3
		corner
			icon_state = "corner"
			build = /buildable/FLOORING/corner
		corner1
			icon_state = "corner1"
			build = /buildable/FLOORING/corner1
		corner2
			icon_state = "corner2"
			build = /buildable/FLOORING/corner2
		corner3
			icon_state = "corner3"
			build = /buildable/FLOORING/corner3
		side4
			icon_state = "side4"
			build = /buildable/FLOORING/side4
		side5
			icon_state = "side5"
			build = /buildable/FLOORING/side5
		b1
			icon_state = "b1"
			build = /buildable/FLOORING/b1
		b2
			icon_state = "b2"
			build = /buildable/FLOORING/b2
		b3
			icon_state = "b3"
			build = /buildable/FLOORING/b3
		b4
			icon_state = "b4"
			build = /buildable/FLOORING/b4
		b5
			icon_state = "b5"
			build = /buildable/FLOORING/b5
		b6
			icon_state = "b6"
			build = /buildable/FLOORING/b6
		b7
			icon_state = "b7"
			build = /buildable/FLOORING/b7
		b8
			icon_state = "b8"
			build = /buildable/FLOORING/b8
		wood
			icon_state = "wood"
			build = /buildable/FLOORING/wood
		stair
			icon_state = "stair"
			build = /buildable/FLOORING/stair
		shade
			icon_state = "shade"
			build = /buildable/FLOORING/shade
		sand2
			icon_state = "sand2"
			build = /buildable/FLOORING/sand2
		nine
			icon_state = "nine"
			build = /buildable/FLOORING/nine
		ten
			icon_state = "ten"
			build = /buildable/FLOORING/ten
		eleven
			icon_state = "eleven"
			build = /buildable/FLOORING/eleven
		twelve
			icon_state = "twelve"
			build = /buildable/FLOORING/twelve
		sand
			icon_state = "sand"
			build = /buildable/FLOORING/sand
		thirteen
			icon_state = "thirteen"
			build = /buildable/FLOORING/thirteen
		fourteen
			icon_state = "fourteen"
			build = /buildable/FLOORING/fourteen
		fifteen
			icon_state = "fifteen"
			build = /buildable/FLOORING/fifteen
		sixteen
			icon_state = "sixteen"
			build = /buildable/FLOORING/sixteen
		dirt4
			icon_state = "dirt4"
			build = /buildable/FLOORING/dirt4
		seventeen
			icon_state = "seventeen"
			build = /buildable/FLOORING/seventeen
		eighteen
			icon_state = "eighteen"
			build = /buildable/FLOORING/eighteen
		nineteen
			icon_state = "nineteen"
			build = /buildable/FLOORING/nineteen
		twenty
			icon_state = "twenty"
			build = /buildable/FLOORING/twenty
		dirttip
			icon_state = "dirttip"
			build = /buildable/FLOORING/dirttip
		shadetip
			icon_state = "shadetip"
			build = /buildable/FLOORING/shadetip
		shadetip2
			icon_state = "shadetip2"
			build = /buildable/FLOORING/shadetip2
		log
			icon_state = "log"
			build = /buildable/FLOORING/log
		log1
			icon_state = "log1"
			build = /buildable/FLOORING/log1
		log2
			icon_state = "log2"
			build = /buildable/FLOORING/log2
		log3
			icon_state = "log3"
			build = /buildable/FLOORING/log3
		moss
			icon_state = "moss"
			build = /buildable/FLOORING/moss
		moss1
			icon_state = "moss1"
			build = /buildable/FLOORING/moss1
		moss2
			icon_state = "moss2"
			build = /buildable/FLOORING/moss2
		moss3
			icon_state = "moss3"
			build = /buildable/FLOORING/moss3
		hosp
			icon_state = "hosp"
			build = /buildable/FLOORING/hosp
		stair2
			icon_state = "stair2"
			build = /buildable/FLOORING/stair2
		stair3
			icon_state = "stair3"
			build = /buildable/FLOORING/stair3
		stair4
			icon_state = "stair4"
			build = /buildable/FLOORING/stair4
		wood2
			icon_state = "wood2"
			build = /buildable/FLOORING/wood2
		water
			icon_state = "water"
			build = /buildable/FLOORING/water
		top
			icon_state = "top"
			build = /buildable/FLOORING/top
		bottom
			icon_state = "bottom"
			build = /buildable/FLOORING/bottom
		right
			icon_state = "right"
			build = /buildable/FLOORING/right
		left
			icon_state = "left"
			build = /buildable/FLOORING/left
