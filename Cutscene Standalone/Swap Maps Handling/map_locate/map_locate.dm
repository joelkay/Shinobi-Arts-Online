mob/var
	y1=0//your cordinate1
	y2=0//your cordinate2

	e1=542//enemy cordinate1
	e2=434//enemy cordinate2

/*

554*447:map is viewed at this size

200*200 real
to be imposed onto a
85*73 mini

85/200 = 0.425
73/200 = 0.365
*/
var/rate1=0.425
var/rate2=0.365

/*
Z levels refer to a map grid to consider.

Grid1:187,0 to 272,96//upper Leaf
Grid2:187,96 to 272,169//Bottom Leaf
Grid3://Konoha1left
Grid4:187,192 to 272,242//Konoha1
Grid5://Mist2Up
Grid6://Konohasouthwest
Grid7:187,288 to 272,315//Konoha2
Grid8://Mist2
Grid9://Mist1
Grid10://Mist
Grid11://Suna
Grid12://Suna1
Grid13:187,384 to 272,388//Suna2
*/

mob
	proc
		map_locate()
			switch(mapgrid)
				if(1)
					var/x=187//x start pos
					var/y=96//y start pos
					x+=round(src.x*rate1)//add their x location
					y-=round(src.y*rate2)//add their y location
					y1=min(x,272)//make sure its not above the max x for this grid
					y2=min(y,0)//make sure its not above the max y for this grid

				if(2)
					var/x=187//x start pos
					var/y=169//y start pos
					x+=round(src.x*rate1)//add their x location
					y-=round(src.y*rate2)//add their y location
					y1=min(x,272)//make sure its not above the max x for this grid
					y2=min(y,96)//make sure its not above the max y for this grid

				if(4)
					var/x=187//x start pos
					var/y=242//y start pos
					x+=round(src.x*rate1)//add their x location
					y-=round(src.y*rate2)//add their y location
					y1=min(x,272)//make sure its not above the max x for this grid
					y2=min(y,169)//make sure its not above the max y for this grid

				if(7)
					var/x=187//x start pos
					var/y=315//y start pos
					x+=round(src.x*rate1)//add their x location
					y-=round(src.y*rate2)//add their y location
					y1=min(x,272)//make sure its not above the max x for this grid
					y2=min(y,242)//make sure its not above the max y for this grid

				if(13)
					var/x=187//x start pos
					var/y=388//y start pos
					x+=round(src.x*rate1)//add their x location
					y-=round(src.y*rate2)//add their y location
					y1=min(x,272)//make sure its not above the max x for this grid
					y2=min(y,315)//make sure its not above the max y for this grid


			if(src.targeted)
				var/mob/M=src.targeted
				switch(M.mapgrid)
					if(1)
						var/x=187//x start pos
						var/y=96//y start pos
						x+=round(M.x*rate1)//add their x location
						y-=round(M.y*rate2)//add their y location
						e1=min(x,272)//make sure its not above the max x for this grid
						e2=min(y,0)//make sure its not above the max y for this grid

/*
			if(src.mission)
				var/mob/M=src.mission
				switch(M.mapgrid)
					if(1)
						var/x=187//x start pos
						var/y=0//y start pos
						x+=round(M.x*rate1)//add their x location
						y+=round(M.y*rate2)//add their y location
						e1=min(x,272)//make sure its not above the max x for this grid
						e2=min(y,96)/




*/




