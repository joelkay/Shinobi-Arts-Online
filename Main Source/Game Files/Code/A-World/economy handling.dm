var
	Leafeconomm=1//minus
	Leafeconomp=1//plus
	Leafprices
	Sandeconomm=1//minus
	Sandeconomp=1//plus
	Sandprices
	Misteconomm=1//minus
	Misteconomp=1//plus
	Mistprices
	LAGDELAY=10

proc
	econom()
		set background=1
		while(1)
			sleep(LAGDELAY)
			if(Leafeconomp>=50)
				Leafeconomp=50
			if(Leafeconomm<=-50)
				Leafeconomm=-50
			Leafprices=round((Leafeconomp-Leafeconomm)+1)*5

			if(Sandeconomp>=50)
				Sandeconomp=50
			if(Sandeconomm<=-50)
				Sandeconomm=-50
			Sandprices=round((Sandeconomp-Sandeconomm)+1)*5


			if(Misteconomp>=50)
				Misteconomp=50
			if(Misteconomm<=-50)
				Misteconomm=-50
			Mistprices=round((Misteconomp-Misteconomm)+1)*5










/*
var/mob/z
	for(z in world)
		z<<"Leaf's Economy is now at +/-[Leafprices].."


var/mob/m
	for(m in world)
		M<<"Leaf's Economy is now at +/-[Sandprices].."

var/mob/x
	for(x in world)
		x<<"Mist's Economy is now at +/-[Mistprices].."
*/