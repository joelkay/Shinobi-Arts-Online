/////////////////////////all water should go under here.
obj
	WATER
		parent_type = /obj/triggerable

		icon='flooring.dmi'


		SteppedOn(atom/movable/a)
			..()
			if(ismob(a))
				var/mob/O=a
				O.inwater=1//in the move proc add the water move. also for Suiton water drag.

		SteppedOff(atom/movable/a)
			..()
			if(ismob(a))
				var/mob/O=a
				O.inwater=0//in the move proc add the water move. also for Suiton water drag.


		water2
			icon_state = "water2"


		deletable
			icon_state = "water"
			New()
				..()
				spawn(300)//move lasts 30 secs
					del src
		water
			icon_state = "water"
			layer=2

		watert
			icon_state = "top"
			layer=2

		waterb
			icon_state = "bottom"
			layer=2

		waterl
			icon_state = "left"
			layer=2

		waterr
			icon_state = "right"
			layer=2

		water2
			icon_state = "water2"


turf
	flooring
		icon='flooring.dmi'
		grass
			icon_state = "grass"

		road
			icon_state = "road"

		dirt4
			icon_state = "dirt4"

		dirttip
			icon_state = "dirttip"


		shade
			icon_state = "shade"
			layer=3

		shade2
			icon_state = "shadetip"

		shade3
			icon_state = "shadetip2"

		FootprintSand/sand
			icon_state = "sand"

		FootprintSand/sand2
			icon_state = "sand2"

		hosp
			icon_state = "hosp"

		b1
			icon_state = "b1"
			density=1
		b2
			icon_state = "b2"
			density=1

		b3
			icon_state = "b3"
			density=1
		b4
			icon_state = "b4"
			density=1

		b5
			icon_state = "b5"
			density=1

		b6
			icon_state = "b6"
			density=1

		b7
			icon_state = "b7"
			density=1

		b8
			icon_state = "b8"
			density=1

		wood
			icon_state = "wood"

		wood2
			icon_state = "wood2"

		stair
			icon_state = "stair"

		stair2
			icon_state = "stair2"

		stair3
			icon_state = "stair3"

		stair4
			icon_state = "stair4"

		darkgrass
			icon_state = "darkgrass"

		darkgrass1
			icon_state = "d1"

		darkgrass2
			icon_state = "d2"

		darkgrass3
			icon_state = "d3"

		darkgrass4
			icon_state = "d4"
		dirt
			icon_state = "dirt"

		dirt2
			icon_state = "dirt2"

		dirt3
			icon_state = "dirt3"
		tip
			icon_state = "1"
			layer=3

		tip2
			icon_state = "2"
			layer=3

		tip3
			icon_state = "3"
			layer=3

		tip4
			icon_state = "4"
			layer=3

		edge
			icon_state = "tip"

		edge2
			icon_state = "tip2"

		edge3
			icon_state = "tip3"

		edge4
			icon_state = "tip4"

		grass2
			icon_state = "grass2"

		tip5
			icon_state = "5"
			layer=3

		tip6
			icon_state = "6"
			layer=3

		tip7
			icon_state = "7"
			layer=3

		tip8
			icon_state = "8"
			layer=3

		tip9
			icon_state = "9"
			layer=3

		tip10
			icon_state = "10"
			layer=3

		tip11
			icon_state = "11"
			layer=3

		tip12
			icon_state = "12"
			layer=3

		tip13
			icon_state = "13"
			layer=3

		tip14
			icon_state = "14"
			layer=3

		tip15
			icon_state = "15"
			layer=3

		tip16
			icon_state = "16"
			layer=3

		tip17
			icon_state = "17"
			layer=3

		tip18
			icon_state = "18"
			layer=3

		tip19
			icon_state = "19"
			layer=3

		tip20
			icon_state = "20"
			layer=3

		tip21
			icon_state = "21"
			layer=3

		tip22
			icon_state = "22"
			layer=3

		tip23
			icon_state = "23"
			layer=3

		tip24
			icon_state = "24"
			layer=3

		dgrass
			icon_state = "dgrass"
			layer=3

		dgrass2
			icon_state = "dgrass2"
			layer=3

		dgrass3
			icon_state = "dgrass3"
			layer=3

		dgrass4
			icon_state = "dgrass4"
			layer=3

		peble
			icon_state = "peble"

		peble2
			icon_state = "peble2"

		diagonal
			icon_state = "diagonalgrass"
			layer=3

		diagonal2
			icon_state = "diagonalgrass2"
			layer=3

		diagonal3
			icon_state = "diagonalgrass3"
			layer=3

		diagonal4
			icon_state = "diagonalgrass4"
			layer=3


		cliff
			icon_state = "c1"
			density=1

		cliff1
			icon_state = "c2"
			density=1

		cliff2
			icon_state = "c3"
			density=1

		cliff3
			icon_state = "c4"
			density=1

		flower
			icon_state = "flower"

		flower2
			icon_state = "flower2"

		tile
			icon_state = "tile"

		tile2
			icon_state = "tile2"

		tile3
			icon_state = "tile3"

		tile4
			icon_state = "tile4"

		side
			icon_state = "side"
			density=1
			opacity=1


		side1
			icon_state = "side1"
			density=1
			opacity=1


		side2
			icon_state = "side2"
			density=1
			opacity=1


		side3
			icon_state = "side3"
			density=1
			opacity=1


		side4
			icon_state = "side4"
			density=1
			opacity=1


		side5
			icon_state = "side5"
			density=1
			opacity=1


		corner
			icon_state = "corner"
			density=1
			opacity=1


		corner1
			icon_state = "corner1"
			density=1
			opacity=1


		corner2
			icon_state = "corner2"
			density=1
			opacity=1


		corner3
			icon_state = "corner3"
			opacity=1
			density=1

		log
			icon_state = "log"
			density=1

		log1
			icon_state = "log1"
			density=1

		log2
			icon_state = "log2"
			density=1

		log3
			icon_state = "log3"
			density=1

		moss
			icon_state = "moss"
			density=1

		moss1
			icon_state = "moss1"
			density=1

		moss2
			icon_state = "moss2"
			density=1

		moss3
			icon_state = "moss3"
			density=1

turf
	mountain
		icon='Mountains2.dmi'
		mount
			icon_state = "1"

		mount2
			icon_state = "2"

		mount3
			icon_state = "3"

		mount4
			icon_state = "4"

		mount5
			icon_state = "5"

		mount6
			icon_state = "6"

		mount7
			icon_state = "7"

		mount8
			icon_state = "8"

		mount9
			icon_state = "9"

		mount10
			icon_state = "10"

		mount11
			icon_state = "11"

		mount12
			icon_state = "12"

		mount13
			icon_state = "13"

		mount14
			icon_state = "14"



	patches
		icon='patch.dmi'
		dirtpatch
			icon_state = "dirtpatch"


	deadtree
		icon='tree.dmi'
		tree2
			icon_state = "1"
			density=1

		tree3
			icon_state = "2"
			layer=MOB_LAYER+1

turf
	marble
		icon = 'hosp.dmi'
		icon_state = "marble"

turf
	Fence
		icon='Fence.dmi'

		t1
			icon_state="1"
			density=1

		t2
			icon_state="2"
			density=1
		t3
			icon_state="3"
			layer=MOB_LAYER+1
		t4
			icon_state="4"
			layer=MOB_LAYER+1
		t5
			icon_state="5"
			density=1

		t6
			icon_state="6"
			density=1

		t7
			icon_state="7"
			density=1

		t8
			icon_state="8"
			density=1
		t9
			icon_state="9"
			density=1
		t10
			icon_state="10"
			density=1
		t11
			icon_state="11"
			density=1
		t12
			icon_state="12"
			density=1
		t13
			icon_state="13"
			density=1
		t14
			icon_state="14"
		t15
			icon_state="15"
			density=1
		t16
			icon_state="16"
			layer=MOB_LAYER+1
		t17
			icon_state="17"
		t18
			icon_state="18"
			layer=MOB_LAYER+1

		t19
			icon_state="19"
			layer=MOB_LAYER+1

		t20
			icon_state="20"
			density=1

		t21
			icon_state="21"
			layer=3

		t22
			icon_state="22"
			layer=MOB_LAYER+1

		t23
			icon_state="23"
			layer=3

		t24
			icon_state="24"
			layer=3

		t25
			icon_state="25"
			layer=MOB_LAYER+1

		t26
			icon_state="26"
			layer=MOB_LAYER+1

		t27
			icon_state="27"
			layer=MOB_LAYER+1

		t28
			icon_state="28"
			layer=MOB_LAYER+1

		t29
			icon_state="29"
			layer=4

		t30
			icon_state="30"
			layer=MOB_LAYER+1

		t31
			icon_state="31"
			layer=MOB_LAYER+1

		t32
			icon_state="32"
			layer=4

		t33
			icon_state="33"
			layer=MOB_LAYER+1

		t34
			icon_state="34"
			layer=MOB_LAYER+1

		t35
			icon_state="35"
			layer=MOB_LAYER+1

		t36
			icon_state="36"
			layer=MOB_LAYER+1



turf
	scenery
		icon='scenery.dmi'
		bush
			icon_state = "1"

		mirrors
			icon_state="2"
			density=1

		mirrors2
			icon_state="3"
			density=1

		mirrors3
			icon_state="4"
			density=1

		mirrors4
			icon_state="5"
			density=1

		mirrors5
			icon_state="6"
			density=1

		mirrors6
			icon_state="7"
			density=1

		signs
			icon_state="8"
			density=1


turf
	bigrock
		icon='rocks.dmi'
		rock
			icon_state = "1"


turf
	shelf
		icon='household.dmi'
		shelf
			icon_state = "1"

		shelf2
			icon_state = "2"

		shelf3
			icon_state = "3"

		scrollcab
			icon_state = "scroll cabinet"

		table
			icon_state = "4"

		table2
			icon_state = "5"

		table3
			icon_state = "6"
			layer=MOB_LAYER+1

		table4
			icon_state = "7"
			layer=MOB_LAYER+1

		rack
			icon_state = "rack1"

		rack2
			icon_state = "rack2"

		goldpuppet
			icon_state = "wall puppet"

		shopt
			icon_state = "shopt"
			layer=MOB_LAYER+1

		shopt1
			icon_state = "shopt1"
			layer=MOB_LAYER+1

		shopt2
			icon_state = "shopt2"
			layer=MOB_LAYER+1

		shopt3
			icon_state = "shopt3"
			layer=MOB_LAYER+1

		shopt4
			icon_state = "shopt4"
			layer=MOB_LAYER+1

		shopt5
			icon_state = "shopt5"
			layer=MOB_LAYER+1

		shopt6
			icon_state = "shopt6"

		shopt7
			icon_state = "shopt7"

		shopt8
			icon_state = "shopt8"

		shopt9
			icon_state = "shopt9"

		shopt10
			icon_state = "shopt10"

		mist
			icon_state = "mist"

		sand
			icon_state = "sand"

		leaf
			icon_state = "leaf"

turf
	housestuff
		icon='house stuff.dmi'
		sofa
			icon_state = "sofa1"
			density=1

		sofa2
			icon_state = "sofa2"
			density=1

		plant
			icon_state = "plant"
			density=1

		plant1
			icon_state = "plant1"
			density=1

		window
			icon_state = "window"
			density=1

		wall
			icon_state = "1"
			density=1

		wall2
			icon_state = "2"
			density=1

		wall3
			icon_state = "3"
			density=1

		wall4
			icon_state = "4"
			density=1

		wall5
			icon_state = "5"
			density=1

		wall6
			icon_state = "6"
			density=1

		wall7
			icon_state = "7"
			density=1

		wall8
			icon_state = "8"
			density=1

		wall9
			icon_state = "9"
			density=1

		wall10
			icon_state = "10"
			density=1

		wall11
			icon_state = "11"
			density=1

		wall12
			icon_state = "12"
			density=1

		wall13
			icon_state = "13"
			density=1

		wall14
			icon_state = "14"
			density=1

		wall15
			icon_state = "15"
			density=1

		wall16
			icon_state = "16"
			density=1

		wall17
			icon_state = "17"
			density=1

		wall18
			icon_state = "18"
			density=1

		wall19
			icon_state = "19"
			density=1

		wall20
			icon_state = "20"
			density=1

		wall21
			icon_state = "21"
			density=1

		wall22
			icon_state = "22"
			density=1

		wall23
			icon_state = "23"
			density=1

		wall24
			icon_state = "24"
			density=1

		wall25
			icon_state = "25"
			density=1

		wall26
			icon_state = "26"
			density=1

		wall27
			icon_state = "27"
			density=1

		table
			icon_state = "t1"
			density=1

		table1
			icon_state = "t2"
			density=1

		table2
			icon_state = "t3"
			density=1

		chair
			icon_state = "chair"

		chair2
			icon_state = "chair2"

		board
			icon_state = "board"

		test
			icon_state = "test"
			density=1
			/*
			Click()
				if(usr.rank=="Student")
					usr.gexam()
			*/

		test2
			icon_state = "test2"
			density=1

			/*
			Click()
				if(usr.rank=="Student")
					usr.gexam()
			*/

		test3
			icon_state = "test3"
			density=1

			/*
			Click()
				if(usr.rank=="Student")
					usr.gexam()
			*/

		test4
			icon_state = "test4"
			density=1

			/*
			Click()
				if(usr.rank=="Student")
					usr.gexam()
			*/


		door
			icon_state = "d1"
			density=1

		door2
			icon_state = "d2"
			density=1
			var/open=0
			var/list/candidates=list()
			Entered(atom/movable/b)//bed gives life and starts regen process.
				if(ismob(b)&&open)
					var/mob/a=b
					a<<"Good luck.."
					a.loc=locate(src.x,src.y+4,src.z)
					candidates.Add(a)

			proc/open()
				if(!open)
					open=1
				else
					open=0

			proc/send()
				for(var/mob/a in candidates)
					spawn() a.Proceed()
		sign
			icon_state = "sign"
			density=1

		sign2
			icon_state = "sign2"
			density=1

		sign3
			icon_state = "sign3"
			density=1

		sign4
			icon_state = "sign4"
			density=1

turf
	beds
		Entered(atom/movable/b)//bed gives life and starts regen process.
			if(ismob(b))
				var/mob/a=b
				a.canmove=0
				a<<"You lie down in bed.."
				a.icon_state=""
				a.inbed=1
				if(a.life<=0)
					a.life=1
				if(a.life>=100)
					a.life=100
					a.canmove=1
					a.inbed=0
					return
				while(a.inbed&&a.life<100)
					a.life+=rand(10,15)
					sleep(10)
					if(a.life>=100)
						a.canmove=1
						a.life=100
						a.inbed=0
						return


		Exited(atom/movable/a)
			if(ismob(a))
				var/mob/O=a
				if(O)
					O.inbed=0


		Leaf_Bed
			icon='leaf bed.dmi'

			part1
				icon_state="1"
				layer=MOB_LAYER+1
			part2
				icon_state="2"
				layer=MOB_LAYER+1
			part3
				icon_state="3"
			part4
				icon_state="4"
				layer=MOB_LAYER+1
			part5
				icon_state="5"
				layer=MOB_LAYER+1
			part6
				icon_state="6"


		hosp
			icon='other bed.dmi'

			hbed
				icon_state="1"

			hbed2
				icon_state="2"

			mistbed
				icon_state="m1"
				layer=MOB_LAYER+1

			mistbed2
				icon_state="m2"
				layer=MOB_LAYER+1

			mistbed3
				icon_state="m3"

			sandbed
				icon_state="s1"
				layer=MOB_LAYER+1

			sandbed2
				icon_state="s2"
				layer=MOB_LAYER+1

			sandbed3
				icon_state="s3"

			sandbed4
				icon_state="s4"
				layer=MOB_LAYER+1

			sandbed5
				icon_state="s5"
				layer=MOB_LAYER+1

			sandbed6
				icon_state="s6"

turf

	trees
		pine1
			icon = 'pine.png'
			layer=MOB_LAYER+1

		pine2
			icon = 'pine2.png'

		bigtree
			icon = 'big tree1.png'
			layer=MOB_LAYER+1

		bigtree2
			icon = 'big tree2.png'
			layer=MOB_LAYER+1

		deadtree
			icon = 'dead tree.png'
			layer=MOB_LAYER+1

		medtree
			icon = 'med tree.png'
			layer=MOB_LAYER+1

		smalltree
			icon = 'small tree1.png'
			layer=MOB_LAYER+1

		smalltree2
			icon = 'small tree2.png'




turf

	rocks
		rock1
			icon = 'rocks.dmi'
			icon_state = "1"

		rock2
			icon = 'rocks.dmi'
			icon_state = "2"

		rock3
			icon = 'rocks.dmi'
			icon_state = "3"

turf
	chuunin
		cfloor1
			icon = 'new chuunin.dmi'
			icon_state = "1"
		fodgrass
			icon = 'chuunin.dmi'
			icon_state = "fod"

		cfloor2
			icon = 'new chuunin.dmi'
			icon_state = "2"

		cfloor3
			icon = 'new chuunin.dmi'
			icon_state = "3"

		cfloor4
			icon = 'new chuunin.dmi'
			icon_state = "4"

		cfloor5
			icon = 'new chuunin.dmi'
			icon_state = "5"

		cstair
			icon = 'new chuunin.dmi'
			icon_state = "6"

		cstair2
			icon = 'new chuunin.dmi'
			icon_state = "7"

		cstair3
			icon = 'new chuunin.dmi'
			icon_state = "8"

		cstair4
			icon = 'new chuunin.dmi'
			icon_state = "9"

		cstair5
			icon = 'new chuunin.dmi'
			icon_state = "10"

		cstair6
			icon = 'new chuunin.dmi'
			icon_state = "11"

		cstair7
			icon = 'new chuunin.dmi'
			icon_state = "12"

		cstair8
			icon = 'new chuunin.dmi'
			icon_state = "13"

		cdoor
			icon = 'new chuunin.dmi'
			icon_state = "14"

		cdoor1
			icon = 'new chuunin.dmi'
			icon_state = "15"
			layer=MOB_LAYER+1

		cdoorw
			icon = 'new chuunin.dmi'
			icon_state = "16"
			layer=MOB_LAYER+1

		cdoorw1
			icon = 'new chuunin.dmi'
			icon_state = "17"
			layer=MOB_LAYER+1

		cdoorw2
			icon = 'new chuunin.dmi'
			icon_state = "18"
			layer=MOB_LAYER+1


		cwall2
			icon = 'chuunin wall.dmi'
			icon_state = "2"


		cwall3
			icon = 'chuunin wall.dmi'
			icon_state = "3"


		cwall4
			icon = 'chuunin wall.dmi'
			icon_state = "4"


	statue

		st1
			icon = 'chuunin statue.dmi'
			icon_state = "1"
			layer=3

		st2
			icon = 'chuunin statue.dmi'
			icon_state = "2"
			layer=3

		st3
			icon = 'chuunin statue.dmi'
			icon_state = "3"
			layer=3

		st4
			icon = 'chuunin statue.dmi'
			icon_state = "4"
			layer=3

		st5
			icon = 'chuunin statue.dmi'
			icon_state = "5"
			layer=3

		st6
			icon = 'chuunin statue.dmi'
			icon_state = "6"
			layer=3

		st7
			icon = 'chuunin statue.dmi'
			icon_state = "7"
			layer=3

		st8
			icon = 'chuunin statue.dmi'
			icon_state = "8"
			layer=3

		st9
			icon = 'chuunin statue.dmi'
			icon_state = "9"
			layer=3

		st10
			icon = 'chuunin statue.dmi'
			icon_state = "10"
			layer=3

		st11
			icon = 'chuunin statue.dmi'
			icon_state = "11"
			layer=3

		st12
			icon = 'chuunin statue.dmi'
			icon_state = "12"
			layer=3

		st13
			icon = 'chuunin statue.dmi'
			icon_state = "13"
			layer=3

		st14
			icon = 'chuunin statue.dmi'
			icon_state = "14"
			layer=3

		st15
			icon = 'chuunin statue.dmi'
			icon_state = "15"
			layer=3

		st16
			icon = 'chuunin statue.dmi'
			icon_state = "16"
			layer=4

		st17
			icon = 'chuunin statue.dmi'
			icon_state = "17"
			layer=4

		st18
			icon = 'chuunin statue.dmi'
			icon_state = "18"
			layer=4

		st19
			icon = 'chuunin statue.dmi'
			icon_state = "19"
			layer=4

		st20
			icon = 'chuunin statue.dmi'
			icon_state = "20"
			layer=4

		st21
			icon = 'chuunin statue.dmi'
			icon_state = "21"
			layer=3

		st22
			icon = 'chuunin statue.dmi'
			icon_state = "22"
			layer=3

		st23
			icon = 'chuunin statue.dmi'
			icon_state = "23"
			layer=3

		st24
			icon = 'chuunin statue.dmi'
			icon_state = "24"
			layer=3

		st25
			icon = 'chuunin statue.dmi'
			icon_state = "25"
			layer=3

		st26
			icon = 'chuunin statue.dmi'
			icon_state = "26"
			layer=3

		st27
			icon = 'chuunin statue.dmi'
			icon_state = "27"
			layer=3

		st28
			icon = 'chuunin statue.dmi'
			icon_state = "28"
			layer=3

		st29
			icon = 'chuunin statue.dmi'
			icon_state = "29"
			layer=3

		st30
			icon = 'chuunin statue.dmi'
			icon_state = "30"
			layer=3

		st31
			icon = 'chuunin statue.dmi'
			icon_state = "31"
			layer=3

		st32
			icon = 'chuunin statue.dmi'
			icon_state = "32"
			layer=3

		st33
			icon = 'chuunin statue.dmi'
			icon_state = "33"
			layer=3

		st34
			icon = 'chuunin statue.dmi'
			icon_state = "34"
			layer=3

		st35
			icon = 'chuunin statue.dmi'
			icon_state = "35"
			layer=3

		st36
			icon = 'chuunin statue.dmi'
			icon_state = "36"
			layer=3

		st37
			icon = 'chuunin statue.dmi'
			icon_state = "37"
			layer=3

		st38
			icon = 'chuunin statue.dmi'
			icon_state = "38"
			layer=3

		st39
			icon = 'chuunin statue.dmi'
			icon_state = "39"
			layer=3

		st40
			icon = 'chuunin statue.dmi'
			icon_state = "40"
			layer=3

		st41
			icon = 'chuunin statue.dmi'
			icon_state = "41"
			layer=3

		st42
			icon = 'chuunin statue.dmi'
			icon_state = "42"
			layer=3

		st43
			icon = 'chuunin statue.dmi'
			icon_state = "43"
			layer=3

		st44
			icon = 'chuunin statue.dmi'
			icon_state = "44"
			layer=3

		st45
			icon = 'chuunin statue.dmi'
			icon_state = "45"
			layer=3

		st46
			icon = 'chuunin statue.dmi'
			icon_state = "46"
			layer=3

		st47
			icon = 'chuunin statue.dmi'
			icon_state = "47"
			layer=3

		st48
			icon = 'chuunin statue.dmi'
			icon_state = "48"
			layer=3

		st49
			icon = 'chuunin statue.dmi'
			icon_state = "49"
			layer=3

		st50
			icon = 'chuunin statue.dmi'
			icon_state = "50"
			layer=3

		st51
			icon = 'chuunin statue.dmi'
			icon_state = "51"
			layer=3

		st52
			icon = 'chuunin statue.dmi'
			icon_state = "52"
			layer=3

		st53
			icon = 'chuunin statue.dmi'
			icon_state = "53"
			layer=3

		st54
			icon = 'chuunin statue.dmi'
			icon_state = "54"
			layer=3

		st55
			icon = 'chuunin statue.dmi'
			icon_state = "55"
			layer=3

		st56
			icon = 'chuunin statue.dmi'
			icon_state = "56"
			layer=3

		st57
			icon = 'chuunin statue.dmi'
			icon_state = "57"
			layer=3

		st58
			icon = 'chuunin statue.dmi'
			icon_state = "58"
			layer=3

		st59
			icon = 'chuunin statue.dmi'
			icon_state = "59"
			layer=3

		st60
			icon = 'chuunin statue.dmi'
			icon_state = "60"
			layer=3

		st61
			icon = 'chuunin statue.dmi'
			icon_state = "61"
			layer=3

		st62
			icon = 'chuunin statue.dmi'
			icon_state = "62"
			layer=3

		st63
			icon = 'chuunin statue.dmi'
			icon_state = "63"
			layer=3

		st64
			icon = 'chuunin statue.dmi'
			icon_state = "64"
			layer=3

		st65
			icon = 'chuunin statue.dmi'
			icon_state = "65"
			layer=3

		st66
			icon = 'chuunin statue.dmi'
			icon_state = "66"
			layer=3

		st67
			icon = 'chuunin statue.dmi'
			icon_state = "67"
			layer=3

		st68
			icon = 'chuunin statue.dmi'
			icon_state = "68"
			layer=3

		st69
			icon = 'chuunin statue.dmi'
			icon_state = "69"
			layer=3

		st70
			icon = 'chuunin statue.dmi'
			icon_state = "70"
			layer=3

		st71
			icon = 'chuunin statue.dmi'
			icon_state = "71"
			layer=3

		st72
			icon = 'chuunin statue.dmi'
			icon_state = "72"
			layer=3

		st73
			icon = 'chuunin statue.dmi'
			icon_state = "73"
			layer=3

		st74
			icon = 'chuunin statue.dmi'
			icon_state = "74"
			layer=3

		st75
			icon = 'chuunin statue.dmi'
			icon_state = "75"
			layer=3

		st76
			icon = 'chuunin statue.dmi'
			icon_state = "76"
			layer=3

		st77
			icon = 'chuunin statue.dmi'
			icon_state = "77"
			layer=3

		st78
			icon = 'chuunin statue.dmi'
			icon_state = "78"
			layer=3

		st79
			icon = 'chuunin statue.dmi'
			icon_state = "79"
			layer=3

		st80
			icon = 'chuunin statue.dmi'
			icon_state = "80"
			layer=3

		st81
			icon = 'chuunin statue.dmi'
			icon_state = "81"
			layer=3

		st82
			icon = 'chuunin statue.dmi'
			icon_state = "82"
			layer=3

		st83
			icon = 'chuunin statue.dmi'
			icon_state = "83"
			layer=3

		st84
			icon = 'chuunin statue.dmi'
			icon_state = "84"
			layer=3

		st85
			icon = 'chuunin statue.dmi'
			icon_state = "85"
			layer=3

		st86
			icon = 'chuunin statue.dmi'
			icon_state = "86"
			layer=3

		st87
			icon = 'chuunin statue.dmi'
			icon_state = "87"
			layer=3

		st88
			icon = 'chuunin statue.dmi'
			icon_state = "88"
			layer=3

		st89
			icon = 'chuunin statue.dmi'
			icon_state = "89"
			layer=3

		st90
			icon = 'chuunin statue.dmi'
			icon_state = "90"
			layer=3

		st91
			icon = 'chuunin statue.dmi'
			icon_state = "91"
			layer=3


		st92
			icon = 'chuunin statue.dmi'
			icon_state = "92"
			layer=3

		st93
			icon = 'chuunin statue.dmi'
			icon_state = "93"
			layer=3

		st94
			icon = 'chuunin statue.dmi'
			icon_state = "94"
			layer=3

		st95
			icon = 'chuunin statue.dmi'
			icon_state = "95"
			layer=3

		st96
			icon = 'chuunin statue.dmi'
			icon_state = "96"
			layer=3

		st97
			icon = 'chuunin statue.dmi'
			icon_state = "97"
			layer=3

		st98
			icon = 'chuunin statue.dmi'
			icon_state = "98"
			layer=3

		st99
			icon = 'chuunin statue.dmi'
			icon_state = "99"
			layer=3

		st100
			icon = 'chuunin statue.dmi'
			icon_state = "100"
			layer=3

		st101
			icon = 'chuunin statue.dmi'
			icon_state = "101"
			layer=3

		st102
			icon = 'chuunin statue.dmi'
			icon_state = "102"
			layer=3

		st103
			icon = 'chuunin statue.dmi'
			icon_state = "103"
			layer=3

		st104
			icon = 'chuunin statue.dmi'
			icon_state = "104"
			layer=3

		st105
			icon = 'chuunin statue.dmi'
			icon_state = "105"
			layer=3

		st106
			icon = 'chuunin statue.dmi'
			icon_state = "106"
			layer=3

		st107
			icon = 'chuunin statue.dmi'
			icon_state = "107"
			layer=3

		st108
			icon = 'chuunin statue.dmi'
			icon_state = "108"
			layer=3

		st109
			icon = 'chuunin statue.dmi'
			icon_state = "109"
			layer=3

		st110
			icon = 'chuunin statue.dmi'
			icon_state = "110"
			layer=3

		st111
			icon = 'chuunin statue.dmi'
			icon_state = "111"
			layer=3

		st112
			icon = 'chuunin statue.dmi'
			icon_state = "112"
			layer=3

		st113
			icon = 'chuunin statue.dmi'
			icon_state = "113"
			layer=3

		st114
			icon = 'chuunin statue.dmi'
			icon_state = "114"
			layer=3

		st115
			icon = 'chuunin statue.dmi'
			icon_state = "115"
			layer=3

		st116
			icon = 'chuunin statue.dmi'
			icon_state = "116"
			layer=3

		st117
			icon = 'chuunin statue.dmi'
			icon_state = "117"
			layer=3

		st118
			icon = 'chuunin statue.dmi'
			icon_state = "118"
			layer=3

		st119
			icon = 'chuunin statue.dmi'
			icon_state = "119"
			layer=3

		st120
			icon = 'chuunin statue.dmi'
			icon_state = "120"
			layer=3


turf
	hideout
		hfloor
			icon = 'hideout.dmi'
			icon_state = "1"

		hfloor2
			icon = 'hideout.dmi'
			icon_state = "2"

		hfloor3
			icon = 'hideout.dmi'
			icon_state = "3"

		hfloor4
			icon = 'hideout.dmi'
			icon_state = "4"

		hfloor5
			icon = 'hideout.dmi'
			icon_state = "5"

		hfloor6
			icon = 'hideout.dmi'
			icon_state = "6"

		hfloor7
			icon = 'hideout.dmi'
			icon_state = "7"

		hfloor8
			icon = 'hideout.dmi'
			icon_state = "8"

		hfloor9
			icon = 'hideout.dmi'
			icon_state = "9"

		hfloor10
			icon = 'hideout.dmi'
			icon_state = "10"

		hfloor11
			icon = 'hideout.dmi'
			icon_state = "11"

		hfloor12
			icon = 'hideout.dmi'
			icon_state = "12"

		hfloor13
			icon = 'hideout.dmi'
			icon_state = "13"

		hfloor14
			icon = 'hideout.dmi'
			icon_state = "14"

		hfloor15
			icon = 'hideout.dmi'
			icon_state = "15"

		hfloor16
			icon = 'hideout.dmi'
			icon_state = "16"

		hfloor17
			icon = 'hideout.dmi'
			icon_state = "17"

		hfloor18
			icon = 'hideout.dmi'
			icon_state = "18"

		hfloor19
			icon = 'hideout.dmi'
			icon_state = "19"

		hfloor20
			icon = 'hideout.dmi'
			icon_state = "20"

		candle1
			icon = 'hideout.dmi'
			icon_state = "candle1"

		candle2
			icon = 'hideout.dmi'
			icon_state = "candle2"

		candle3
			icon = 'hideout.dmi'
			icon_state = "candle3"

		candle4
			icon = 'hideout.dmi'
			icon_state = "candle4"

		candle5
			icon = 'hideout.dmi'
			icon_state = "candle5"

		candle6
			icon = 'hideout.dmi'
			icon_state = "candle6"
