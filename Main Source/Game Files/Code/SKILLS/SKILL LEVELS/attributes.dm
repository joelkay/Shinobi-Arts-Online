mob
	verb
		CheckStats()
			set hidden = 1
			if(winget(src,"showstats","is-visible")=="true")
				winshow(src,"showstats",0)

			else
				src.updatestatbars()
				//winset(src,"outputbpx","pos=110x510")
				winshow(src,"showstats",1)


	proc
		updatestatbars()
			var/a=src.resistance
			var/b=src.chakraforce
			var/c=src.agility
			var/d=src.dexterity
			var/e=src.reflex
			var/f=src.strength
			var/x=src.blevel
			winset(src,null,{"
			showstats.expbar.value="[src.exp / src.maxexp * 100]";
			showstats.agilitybar.value="[src.agilityexp / src.agilityMexp * 100]";
			showstats.chakraforcebar.value="[src.chakraforceexp / src.chakraforceMexp * 100]";
			showstats.dexteritybar.value="[src.dexterityexp / src.dexterityMexp* 100]";
			showstats.strengthbar.value="[src.strengthexp / src.strengthMexp * 100]";
			showstats.resistancebar.value="[src.resistanceexp / src.resistanceMexp* 100]";
			showstats.reflexbar.value="[src.reflexexp / src.reflexMexp* 100]";
			levellabel.text = "[x]";
			resistancelabel2.text = "[a]";
			chakraforcelabel2.text = "[b]";
			agilitylabel2.text = "[c]";
			dexteritylabel2.text = "[d]";
			reflexlabel2.text = "[e]";
			strengthlabel2.text = "[f]";
			"})