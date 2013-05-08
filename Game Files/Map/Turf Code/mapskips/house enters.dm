turf
	Kage
		Sand
			enter
				icon=""
				density=0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client&&M.Village=="Sand")
							M.loc = locate("SandKageEnter")//house 1 changed it mannnzz :P
							M.pk=0
							return
					else
						if(istype(A,/obj/)) del(A)
			exit
				icon=""
				density = 0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client)
							M.loc = locate("SandKageExit")//shop 1 changed it mannnzz :P
							M.pk=1
							return
					else
						if(istype(A,/obj/)) del(A)
		Leaf
			enter
				icon=""
				density=0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client&&M.Village=="Leaf")
							M.loc = locate("LeafKageEnter")//house 1 changed it mannnzz :P
							M.pk=0
							return
					else
						if(istype(A,/obj/)) del(A)
			exit
				icon=""
				density = 0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client)
							M.loc = locate("LeafKageExit")//shop 1 changed it mannnzz :P
							M.pk=1
							return
					else
						if(istype(A,/obj/)) del(A)

		Mist
			enter
				icon=""
				density=0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client&&M.Village=="Mist")
							M.loc = locate("MistKageEnter")//house 1 changed it mannnzz :P
							M.pk=0
							return
					else
						if(istype(A,/obj/)) del(A)
			exit
				icon=""
				density = 0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client)
							M.loc = locate("MistKageExit")//shop 1 changed it mannnzz :P
							M.pk=1
							return
					else
						if(istype(A,/obj/)) del(A)

	Shops
		Konohaweapons//Konoha weapons.
			enter
				density = 0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client&&M.Village=="Leaf")
							M.loc = locate("LeafWeaponsEnter")//house 1 changed it mannnzz :P
							M.pk=0
							M.Leafshop=1//knha economy.
							return
					else
						if(istype(A,/obj/)) del(A)
			exit
				icon=""
				density = 0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client)
							M.loc = locate("LeafWeaponsExit")//shop 1 changed it mannnzz :P
							M.pk=1
							M.Leafshop=0//knha economy.
							return
					else
						if(istype(A,/obj/)) del(A)


		Konohaclothes//Konoha CLothes.
			enter
				density = 0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client&&M.Village=="Leaf")
							M.loc = locate("LeafClothesEnter")//house 1 changed it mannnzz :P
							M.pk=0
							M.Leafshop=1//knha economy.
							return
					else
						if(istype(A,/obj/)) del(A)
			exit
				icon=""
				density = 0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client)
							M.loc = locate("LeafClothesExit")//shop 1 changed it mannnzz :P
							M.pk=1
							M.Leafshop=0//knha economy.
							return
					else
						if(istype(A,/obj/)) del(A)



		Konohabarber//Konoha CLothes.
			enter
				density = 0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client)
							M.loc = locate("LeafBarberEnter")//house 1 changed it mannnzz :P
							M.pk=0
							return
					else
						if(istype(A,/obj/)) del(A)
			exit
				density = 0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client)
							M.loc = locate("LeafBarberExit")//shop 1 changed it mannnzz :P
							M.pk=1
							return
					else
						if(istype(A,/obj/)) del(A)


		Sandweapons//Sand clothes
			enter
				density = 0
				icon_state = "enter"
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client&&M.Village=="Sand")
							M.loc = locate("SandWeaponsEnter")//house 1 changed it mannnzz :P
							M.pk=0
							M.Sandshop=1//Sand economy.
							return
					else
						if(istype(A,/obj/)) del(A)
			exit
				icon=""
				density = 0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client)
							M.loc = locate("SandWeaponsExit")//shop 1 changed it mannnzz :P
							M.pk=1
							M.Sandshop=0//Sand economy.
							return
					else
						if(istype(A,/obj/)) del(A)

		Sandpuppets//Sand clothes
			enter
				density = 0
				icon_state = "enter"
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client&&M.Village=="Sand")
							M.loc = locate("SandPuppetsEnter")//house 1 changed it mannnzz :P
							M.pk=0
							M.Sandshop=1//Sand economy.
							return
					else
						if(istype(A,/obj/)) del(A)
			exit
				icon=""
				density = 0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client)
							M.loc = locate("SandPuppetsExit")//shop 1 changed it mannnzz :P
							M.pk=1
							M.Sandshop=0//Sand economy.
							return
					else
						if(istype(A,/obj/)) del(A)



		Sandclothes//Sand clothes
			enter
				density = 0
				icon_state = "enter"
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client&&M.Village=="Sand")
							M.loc = locate("SandClothesEnter")//house 1 changed it mannnzz :P
							M.pk=0
							M.Sandshop=1//Sand economy.
							return
					else
						if(istype(A,/obj/)) del(A)
			exit
				icon=""
				density = 0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client)
							M.loc = locate("SandClothesExit")//shop 1 changed it mannnzz :P
							M.pk=1
							M.Sandshop=0//Sand economy.
							return
					else
						if(istype(A,/obj/)) del(A)

		Mistweapons//Sand clothes
			enter
				density = 0
				icon_state = "enter"
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client&&M.Village=="Mist")
							M.loc = locate("MistWeaponsEnter")//house 1 changed it mannnzz :P
							M.pk=0
							M.Mistshop=1//Mist economy.
							return
					else
						if(istype(A,/obj/)) del(A)
			exit
				icon=""
				density = 0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client)
							M.loc = locate("MistWeaponsExit")//shop 1 changed it mannnzz :P
							M.pk=1
							M.Mistshop=0//Mist economy.
							return
					else
						if(istype(A,/obj/)) del(A)


		Mistclothes//Sand clothes
			enter
				density = 0
				icon_state = "enter"
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client&&M.Village=="Mist")
							M.loc = locate("MistClothesEnter")//house 1 changed it mannnzz :P
							M.pk=0
							M.Mistshop=1//Mist economy.
							return
					else
						if(istype(A,/obj/)) del(A)
			exit
				icon=""
				density = 0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client)
							M.loc = locate("MistClothesExit")//shop 1 changed it mannnzz :P
							M.pk=1
							M.Mistshop=0//Mist economy.
							return
					else
						if(istype(A,/obj/)) del(A)

		Sandbarber//Sand clothes
			enter
				density = 0
				icon_state = "enter"
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client)
							M.loc = locate("SandBarberEnter")//house 1 changed it mannnzz :P
							M.pk=0
							return
					else
						if(istype(A,/obj/)) del(A)
			exit
				icon=""
				density = 0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client)
							M.loc = locate("SandBarberExit")//shop 1 changed it mannnzz :P
							M.pk=1
							return
					else
						if(istype(A,/obj/)) del(A)

		Mistbarber//Sand clothes
			enter
				density = 0
				icon_state = "enter"
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						M<<"Shops are not yet complete.."
						return
						if(M.client)
							M.loc = locate("MistBarberEnter")//house 1 changed it mannnzz :P
							M.pk=0
							return
					else
						if(istype(A,/obj/)) del(A)
			exit
				icon=""
				density = 0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client)
							M.loc = locate("MistBarberExit")//shop 1 changed it mannnzz :P
							M.pk=1
							return
					else
						if(istype(A,/obj/)) del(A)


						if(istype(A,/obj/)) del(A)





turf
	Hospitals
		Konoha//Hosp beii
			enter
				density = 0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client&&M.Village=="Leaf")
							M.loc = locate("LeafHospitalEnter")//house 1 changed it mannnzz :P
							M.pk=0
							return
					else
						if(istype(A,/obj/)) del(A)
			exit
				density = 0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client)
							M.loc = locate("LeafHospitalExit")//shop 1 changed it mannnzz :P
							M.pk=1
							return
					else
						if(istype(A,/obj/)) del(A)


		Sand//Hosp beii
			enter
				density = 0
				icon=""
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client&&M.Village=="Sand")
							M.loc = locate("SandHospitalEnter")//house 1 changed it mannnzz :P
							M.pk=0
							return
					else
						if(istype(A,/obj/)) del(A)
			exit
				icon=""
				density = 0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client)
							M.loc = locate("SandHospitalExit")//shop 1 changed it mannnzz :P
							M.pk=1
							return
					else
						if(istype(A,/obj/)) del(A)



		Mist//Hosp beii
			enter
				density = 0
				icon_state = "enter"
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client&&M.Village=="Mist")
							M.loc = locate("MistHospitalEnter")//house 1 changed it mannnzz :P
							M.pk=0
							return
					else
						if(istype(A,/obj/)) del(A)
			exit
				icon=""
				density = 0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client)
							M.loc = locate("MistHospitalExit")//shop 1 changed it mannnzz :P
							M.pk=1
							return
					else
						if(istype(A,/obj/)) del(A)








turf
	Academys
		Konoha//Acad beii
			enter
				density = 0
				icon_state = "enter"
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client&&M.Village=="Leaf")
							M.loc = locate("LeafAcademyEnter")//house 1 changed it mannnzz :P
							M.pk=0
							return
					else
						if(istype(A,/obj/)) del(A)
			exit
				icon=""
				density = 0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client)
							M.loc = locate("LeafAcademyExit")
							M.pk=1
							return
					else
						if(istype(A,/obj/)) del(A)
		Sand//Acad beii
			enter
				density = 0
				icon_state = "enter"
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client&&M.Village=="Sand")
							M.loc = locate("SandAcademyEnter")//house 1 changed it mannnzz :P
							M.pk=0
							return
					else
						if(istype(A,/obj/)) del(A)
			exit
				icon=""
				density = 0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client)
							M.loc = locate("SandAcademyExit")//shop 1 changed it mannnzz :P
							M.pk=1
							return
					else
						if(istype(A,/obj/)) del(A)

		Mist//Acad beii
			enter
				density = 0
				icon_state = "enter"
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client&&M.Village=="Mist")
							M.loc = locate("MistAcademyEnter")//house 1 changed it mannnzz :P
							M.pk=0
							return
					else
						if(istype(A,/obj/)) del(A)
			exit
				icon=""
				density = 0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client)
							M.loc = locate("MistAcademyExit")//shop 1 changed it mannnzz :P
							M.pk=1
							return
					else
						if(istype(A,/obj/)) del(A)


turf
	Dojos
		Konoha
			enter
				density = 0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client&&M.Village=="Leaf")
							M.loc = locate("LeafDojoEnter")//house 1 changed it mannnzz :P
							M.pk=0
							M.dojo=1
							M.Leafdojo=1
							return
					else
						if(istype(A,/obj/)) del(A)
			exit
				density = 0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client)
							M.loc = locate("LeafDojoExit")//shop 1 changed it mannnzz :P
							M.pk=1
							M.dojo=0
							M.Leafdojo=0
							return
					else
						if(istype(A,/obj/)) del(A)
		Sand
			enter
				density = 0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client&&M.Village=="Sand")
							M.loc = locate("SandDojoEnter")//house 1 changed it mannnzz :P
							M.pk=0
							M.dojo=1
							M.Sanddojo=1
							return
					else
						if(istype(A,/obj/)) del(A)
			exit

				density = 0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client)
							M.loc = locate("SandDojoExit")//shop 1 changed it mannnzz :P
							M.pk=1
							M.dojo=0
							M.Sanddojo=0
							return
					else
						if(istype(A,/obj/)) del(A)
		Mist
			enter
				density = 0
				icon_state = "enter"
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client&&M.Village=="Mist")
							M.loc = locate("MistDojoEnter")//house 1 changed it mannnzz :P
							M.pk=0
							M.dojo=1
							M.Mistdojo=1
							return
					else
						if(istype(A,/obj/)) del(A)
			exit
				density = 0
				Enter(A)
					if(ismob(A))
						var/mob/M = A
						if(M.client)
							M.loc = locate("MistDojoExit")//shop 1 changed it mannnzz :P
							M.pk=1
							M.dojo=0
							M.Mistdojo=0
							return
					else
						if(istype(A,/obj/)) del(A)