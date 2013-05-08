mob/var/mapgrid=1//mapgrids for check map 1-13
mob/var/canmapskip=0//birds etc
turf
	mapskips
		density = 0
		invisibility=100
		var/gx
		var/gy
		var/gz
		var/kind=""
		Enter(A)
			var/mob/M
			if(ismob(A))
				var/mob/a=A
				if(a.client||a.canmapskip)
					M = A
				else
					return

			else
				if(istype(A,/obj/))
					del(A)
					return

			if(!M) return

			if(src.kind=="Konohatop")
				var/obj/Konohatop/S=locate()
				if(S)
					M.loc = locate(M.x,199,S.z)
					M.mapgrid=2
					return
			if(src.kind=="Konohatopb")
				var/obj/Konohatopb/S=locate()
				if(S)
					M.loc = locate(M.x,2,S.z)
					M.mapgrid=1
					return
			if(src.kind=="Konohabottom")
				var/obj/Konohabottom/S=locate()
				if(S)
					M.loc = locate(M.x,199,S.z)
					M.mapgrid=4
					return
			if(src.kind=="Konohabottomb")
				var/obj/Konohabottomb/S=locate()
				if(S)
					M.loc = locate(M.x,2,S.z)
					M.mapgrid=2
					return

///////////////////////////////////////////////////////////////////////////////////////

			if(src.kind=="Konoha1Down")
				var/obj/Konoha1Down/S=locate()
				if(S)
					M.loc = locate(M.x,199,S.z)
					M.mapgrid=7
					return

			if(src.kind=="Konoha1DownBack")
				var/obj/Konoha1DownBack/S=locate()
				if(S)
					M.loc = locate(M.x,2,S.z)
					M.mapgrid=4
					return

			if(src.kind=="Konoha1Left")
				var/obj/Konoha1Left/S=locate()
				if(S)
					M.loc = locate(199,M.y,S.z)
					M.mapgrid=3
					return

			if(src.kind=="Konoha1LeftBack")
				var/obj/Konoha1LeftBack/S=locate()
				if(S)
					M.loc = locate(2,M.y,S.z)
					M.mapgrid=4
					return

			if(src.kind=="Konoha1Right")
				var/obj/Konoha1Right/S=locate()
				if(S)
					M.loc = locate(2,M.y,S.z)
					M.mapgrid=5
					return

			if(src.kind=="Konoha1RightBack")
				var/obj/Konoha1RightBack/S=locate()
				if(S)
					M.loc = locate(199,M.y,S.z)
					M.mapgrid=4
					return
/////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////

			if(src.kind=="Konoha2Down")
				var/obj/Konoha2Down/S=locate()
				if(S)
					M.loc = locate(M.x,199,S.z)
					M.mapgrid=13
					return

			if(src.kind=="Konoha2DownBack")
				var/obj/Konoha2DownBack/S=locate()
				if(S)
					M.loc = locate(M.x,2,S.z)
					M.mapgrid=7
					return

			if(src.kind=="Konoha2Left")
				var/obj/Konoha2Left/S=locate()
				if(S)
					M.loc = locate(199,M.y,S.z)
					M.mapgrid=6
					return

			if(src.kind=="Konoha2LeftBack")
				var/obj/Konoha2LeftBack/S=locate()
				if(S)
					M.loc = locate(2,M.y,S.z)
					M.mapgrid=7
					return

///////////////////////////////////////////////////////////////////////////////////////////////////
			if(src.kind=="KonohaSouthWest")
				var/obj/KonohaSouthWest/S=locate()
				if(S)
					M.loc = locate(M.x,199,S.z)
					M.mapgrid=6
					return

			if(src.kind=="KonohaSouthWestBack")
				var/obj/KonohaSouthWestBack/S=locate()
				if(S)
					M.loc = locate(M.x,2,S.z)
					M.mapgrid=3
					return





		/////////////////SUNA////////////////////////

			if(src.kind=="Suna")
				var/obj/Suna/S=locate()
				if(S)
					M.loc = locate(199,M.y,S.z)
					M.mapgrid=12
					return

			if(src.kind=="SunaBack")
				var/obj/SunaBack/S=locate()
				if(S)
					M.loc = locate(2,M.y,S.z)
					M.mapgrid=11
					return

			if(src.kind=="Suna1")
				var/obj/Suna1/S=locate()
				if(S)
					M.loc = locate(2,M.y,S.z)
					M.mapgrid=13
					return

			if(src.kind=="Suna1Back")
				var/obj/Suna1Back/S=locate()
				if(S)
					M.loc = locate(199,M.y,S.z)
					M.mapgrid=12
					return

			if(src.kind=="Suna1Up")
				var/obj/Suna1Up/S=locate()
				if(S)
					M.loc = locate(M.x,2,S.z)
					M.mapgrid=6
					return

			if(src.kind=="Suna1UpBack")
				var/obj/Suna1UpBack/S=locate()
				if(S)
					M.loc = locate(M.x,199,S.z)
					M.mapgrid=12
					return



/////////////////////////Mist/////////////////////////////


			if(src.kind=="Mist")
				var/obj/Mist/S=locate()
				if(S)
					M.loc = locate(2,M.y,S.z)
					M.mapgrid=10
					return

			if(src.kind=="MistBack")
				var/obj/MistBack/S=locate()
				if(S)
					M.loc = locate(199,M.y,S.z)
					M.mapgrid=9
					return

			if(src.kind=="Mist1")
				var/obj/Mist1/S=locate()
				if(S)
					M.loc = locate(2,M.y,S.z)
					M.mapgrid=9
					return

			if(src.kind=="Mist1Back")
				var/obj/Mist1Back/S=locate()
				if(S)
					M.loc = locate(199,M.y,S.z)
					M.mapgrid=8
					return

			if(src.kind=="Mist2")
				var/obj/Mist2/S=locate()
				if(S)
					M.loc = locate(2,M.y,S.z)
					M.mapgrid=8
					return

			if(src.kind=="Mist2Back")
				var/obj/Mist2Back/S=locate()
				if(S)
					M.loc = locate(199,M.y,S.z)
					M.mapgrid=7
					return

			if(src.kind=="Mist2Up")
				var/obj/Mist2Up/S=locate()
				if(S)
					M.loc = locate(M.x,199,S.z)
					M.mapgrid=5
					return

			if(src.kind=="Mist2UpBack")
				var/obj/Mist2UpBack/S=locate()
				if(S)
					M.loc = locate(M.x,2,S.z)
					M.mapgrid=8
					return



//b after name means back to name
//////////////Konoha MAIN////////////////////
		Konohatop
			kind="Konohatop"
			icon='blank.dmi'

		Konohatopb
			kind="Konohatopb"
			icon='blank2.dmi'

		Konohamiddle
			kind="Konohamiddle"
			icon='blank.dmi'

		Konohamiddleb
			kind="Konohamiddleb"
			icon='blank2.dmi'

		Konohabottom
			kind="Konohabottom"
			icon='blank.dmi'

		Konohabottomb
			kind="Konohabottomb"
			icon='blank2.dmi'


//////////////////////////////////////////////
		Konoha1
			kind = "Konoha1"
			icon='blank.dmi'

		Konoha1Back
			kind = "Konoha1Back"
			icon='blank2.dmi'

		Konoha1Down
			kind = "Konoha1Down"
			icon='blank.dmi'

		Konoha1DownBack
			kind = "Konoha1DownBack"
			icon='blank2.dmi'

		Konoha1Left
			kind = "Konoha1Left"
			icon='blank.dmi'

		Konoha1LeftBack
			kind = "Konoha1LeftBack"
			icon='blank2.dmi'

		Konoha1Right
			kind = "Konoha1Right"
			icon='blank.dmi'

		Konoha1RightBack
			kind = "Konoha1RightBack"
			icon='blank2.dmi'
/////////////////////////////////////////////////////

	//////////////////////////////////////////////
		Konoha2
			kind = "Konoha2"
			icon='blank.dmi'

		Konoha2Back
			kind = "Konoha2Back"
			icon='blank2.dmi'

		Konoha2Down
			kind = "Konoha2Down"
			icon='blank.dmi'

		Konoha2DownBack
			kind = "Konoha2DownBack"
			icon='blank2.dmi'

		Konoha2Left
			kind = "Konoha2Left"
			icon='blank.dmi'

		Konoha2LeftBack
			kind = "Konoha2LeftBack"
			icon='blank2.dmi'

		Konoha2Right
			kind = "Konoha2Right"
			icon='blank.dmi'

		Konoha2RightBack
			kind = "Konoha2RightBack"
			icon='blank2.dmi'
/////////////////////////////////////////////////////




		KonohaSouthWest
			kind = "KonohaSouthWest"
			icon='blank.dmi'

		KonohaSouthWestBack
			kind = "KonohaSouthWestBack"
			icon='blank2.dmi'



///////////SUNA ENTER///////////////

		Suna
			kind="Suna"
			icon='blank.dmi'

		SunaBack
			kind="SunaBack"
			icon='blank2.dmi'


		Suna1
			kind="Suna1"
			icon='blank.dmi'

		Suna1Back
			kind="Suna1Back"
			icon='blank2.dmi'


		Suna2
			kind = "Suna2"
			icon='blank.dmi'

		Suna2Back
			kind = "Suna2Back"
			icon='blank2.dmi'

		Suna1Up
			kind = "Suna1Up"
			icon='blank.dmi'

		Suna1UpBack
			kind = "Suna1UpBack"
			icon='blank2.dmi'







	//////////////Mist//////////////

		Mist
			kind = "Mist"
			icon='blank.dmi'

		MistBack
			kind = "MistBack"
			icon='blank2.dmi'

		Mist1
			kind = "Mist1"
			icon='blank.dmi'

		Mist1Back
			kind = "Mist1Back"
			icon='blank2.dmi'

		Mist2
			kind = "Mist2"
			icon='blank.dmi'

		Mist2Back
			kind = "Mist2Back"
			icon='blank2.dmi'


		Mist2Up
			kind = "Mist2Up"
			icon='blank.dmi'

		Mist2UpBack
			kind = "Mist2UpBack"
			icon='blank2.dmi'


