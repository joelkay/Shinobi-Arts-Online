mob
	var/tmp/stats=0
	var/tmp/damagemultiplier=0

mob
	proc
		dmgboost(a)
			if(!src)return
			var/num=(src.damagemultiplier/a)*(a*src.damagemultiplier)// level over damage * damage times level
			a+=num
			return a


		statboost(a)
			if(src.Personality=="Eager")
				if(src.stats<40)
					src.stats+=a
					src.agilityboost+=src.stats*1.9
					src.strengthboost+=src.stats/3
					src.chakraforceboost+=src.stats/2
					src.dexterityboost+=src.stats/2
					src.resistanceboost+=src.stats/2
					src.reflexboost+=src.stats*1.89
					spawn(100)
						src.stats=null
						src.agilityboost=null
						src.strengthboost=null
						src.chakraforceboost=null
						src.dexterityboost=null
						src.resistanceboost=null
						src.reflexboost=null

