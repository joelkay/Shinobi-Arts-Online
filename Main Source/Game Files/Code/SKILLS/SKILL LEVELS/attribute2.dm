mob
	var
		resistanceexp=0
		resistanceMexp=1
		resistancefocus=20


		chakraforceexp=0
		chakraforceMexp=1
		chakraforcefocus=20

		agilityexp=0
		agilityMexp=1
		agilityfocus=20

		dexterityexp=1
		dexterityMexp=1
		dexterityfocus=20


		reflexexp=0
		reflexMexp=1
		reflexfocus=20

		strengthexp=0
		strengthMexp=1
		strengthfocus=20





mob
	proc
		resistanceadd(x)
			var/num=(src.resistancefocus/10)*x
			var/ammo=x+(2*num)
			src.resistanceexp+=ammo


		chakraforceadd(x)
			var/num=(src.chakraforcefocus/10)*x
			var/ammo=x+(2*num)
			src.chakraforceexp+=ammo


		agilityadd(x)
			var/num=(src.agilityfocus/10)*x
			var/ammo=x+(2*num)
			src.agilityexp+=ammo


		dexterity(x)
			var/num=(src.dexterityfocus/10)*x
			var/ammo=x+(2*num)
			src.dexterityexp+=ammo


		reflexadd(x)
			var/num=(src.reflexfocus/10)*x
			var/ammo=x+(2*num)
			src.reflexexp+=ammo


		strengthadd(x)
			var/num=(src.strengthfocus/10)*x
			var/ammo=x+(2*num)
			src.strengthexp+=ammo





mob
	proc
		attributecheckr()
			if(src.resistanceexp>src.resistanceMexp)
				src.resistanceexp=0
				src.resistance++
				src.attribute_Points++
				src<<"Resistance leveled up +1 points.."
				src.resistanceMexp=(src.resistance*src.resistance*14)

		attributecheckc()
			if(src.chakraforceexp>src.chakraforceMexp) // your level times itself times 100 plus 1000 as an offset
				src.chakraforceexp=0
				src.chakraforce++
				src.attribute_Points++
				src<<"chakraforce leveled up +1 points.."
				src.chakraforceMexp=(src.chakraforce*src.chakraforce*12)

		attributechecka()
			if(src.agilityexp>src.agilityMexp) // your level times itself times 100 plus 1000 as an offset
				src.agilityexp=0
				src.agility++
				src.attribute_Points++
				src<<"agility leveled up +1 points.."
				src.agilityMexp=(src.agility*src.agility*20) // your level times itself times 50
		attributecheckd()
			if(src.dexterityexp>src.dexterityMexp)
				src.dexterityexp=0
				src.dexterity++
				src.attribute_Points++
				src<<"dexterity leveled up +1 points.."
				src.dexterityMexp=(src.dexterity*src.dexterity*5) // your level times itself times 50
		attributecheckre()
			if(src.reflexexp>src.reflexMexp)
				src.reflexexp=0
				src.reflex++
				src.attribute_Points++
				src<<"reflex leveled up +1 points.."
				src.reflexMexp=(src.reflex*src.reflex*10) // your level times itself times 50
		attributechecks()
			if(src.strengthexp>src.strengthMexp) // your level times itself times 100 plus 1000 as an offset
				src.strengthexp=0
				src.strength++
				src.attribute_Points++
				src<<"strength leveled up +1 points.."
				src.strengthMexp=(src.strength*src.strength*25) // your level times itself times 50














mob
	proc
		totalfocus()
			var/a=src.resistancefocus
			var/b=src.chakraforcefocus
			var/c=src.agilityfocus
			var/d=src.dexterityfocus
			var/e=src.reflexfocus
			var/f=src.strengthfocus
			var/total=a+b+c+d+e+f
			return total
mob
	proc
		statfocus()
			var/a=src.resistancefocus
			var/b=src.chakraforcefocus
			var/c=src.agilityfocus
			var/d=src.dexterityfocus
			var/e=src.reflexfocus
			var/f=src.strengthfocus
			var/total=a+b+c+d+e+f
			winset(src,null,{"
			Resistance.value = "[a]";
			chakraforce.value = "[b]";
			Agility.value = "[c]";
			Dexterity.value = "[d]";
			Reflex.value = "[e]";
			Strength.value = "[f]";
			resistancelabel.text = "Resistance:+[round((a/total)*100)]";
			chakraforcelabel.text = "chakraforce:+[round((b/total)*100)]";
			agilitylabel.text = "Agility:+[round((c/total)*100)]";
			dexteritylabel.text = "Dexterity:+[round((d/total)*100)]";
			reflexlabel.text = "Reflex:+[round((e/total)*100)]";
			strengthlabel.text = "Strength:+[round((f/total)*100)]";
			"})

mob
	verb
		resistancechange()
			set hidden=1
			var/old=src.resistancefocus
			src.resistancefocus++
			var/total=totalfocus()
			if(round(total)>120)
				src.resistancefocus=old
				var/totaln=totalfocus()
				Apopup(src,"\'Resistance increase\' reduce some values first.total focus =[round(totaln)]/120")
				winset(src,null,{"
				Resistance.value = "[src.resistancefocus]";
				"})
			else
				src.statfocus()


		chakraforcechange()
			set hidden=1
			var/old=src.chakraforcefocus
			src.chakraforcefocus++
			var/total=totalfocus()
			if(round(total)>120)
				src.chakraforcefocus=old
				var/totaln=totalfocus()
				Apopup(src,"\'chakraforce increase\' reduce some values first.total focus =[round(totaln)]/120")
				winset(src,null,{"
				chakraforce.value = "[src.chakraforcefocus]";
				"})
			else
				src.statfocus()

		agilitychange()
			set hidden=1
			var/old=src.agilityfocus
			src.agilityfocus++
			var/total=totalfocus()
			if(round(total)>120)
				src.agilityfocus=old
				var/totaln=totalfocus()
				Apopup(src,"\'Agility increase\' reduce some values first.total focus =[round(totaln)]/120")
				winset(src,null,{"
				Agility.value = "[src.agilityfocus]";
				"})
			else
				src.statfocus()

		dexteritychange()
			set hidden=1
			var/old=src.dexterityfocus
			src.dexterityfocus++
			var/total=totalfocus()
			if(round(total)>120)
				src.dexterityfocus=old
				var/totaln=totalfocus()
				Apopup(src,"\'Dexterity increase\' reduce some values first.total focus =[round(totaln)]/120")
				winset(src,null,{"
				Dexterity.value = "[src.dexterityfocus]";
				"})
			else
				src.statfocus()

		reflexchange()
			set hidden=1
			var/old=src.reflexfocus
			src.reflexfocus++
			var/total=totalfocus()
			if(round(total)>120)
				src.reflexfocus=old
				var/totaln=totalfocus()
				Apopup(src,"\'Reflex increase\' reduce some values first.total focus =[round(totaln)]/120")
				winset(src,null,{"
				Reflex.value = "[src.reflexfocus]";
				"})
			else
				src.statfocus()

		strengthchange()
			set hidden=1
			var/old=src.strengthfocus
			src.strengthfocus++
			var/total=totalfocus()
			if(round(total)>120)
				src.strengthfocus=old
				var/totaln=totalfocus()
				Apopup(src,"\'Strength increase\' reduce some values first.total focus =[round(totaln)]/120")
				winset(src,null,{"
				Strength.value = "[src.strengthfocus]";
				"})
			else
				src.statfocus()





///////////////////////////////////////////////////////MINUSES////////

mob
	verb
		resistancechangem()
			set hidden=1
			if(src.resistancefocus>1)
				src.resistancefocus--
			src.statfocus()


		chakraforcechangem()
			set hidden=1
			if(src.chakraforcefocus>1)
				src.chakraforcefocus--
			src.statfocus()

		agilitychangem()
			set hidden=1
			if(src.agilityfocus)
				src.agilityfocus--
			src.statfocus()

		dexteritychangem()
			set hidden=1
			if(src.dexterityfocus>1)
				src.dexterityfocus--
			src.statfocus()

		reflexchangem()
			set hidden=1
			if(src.reflexfocus>1)
				src.reflexfocus--
			src.statfocus()

		strengthchangem()
			set hidden=1
			if(src.strengthfocus>1)
				src.strengthfocus--
			src.statfocus()
