mob
	var
		sharidel=0
		Sharinganon=0
		copied=""
		copiedchakracost
		copiedcooldown


var/tmp/rem
var/tmp/nem
var/tmp/cem
var/tmp/dem
var/tmp/can


proc
	sharicopy(mob/A)
		for(var/mob/M in view(A))
			if(!M.Sharinganon)
				return
			if(!rem)
				return
			M<<output("'Sharingan-copy' - press Z to remember [rem]", "combatlog")
mob
	proc
		Sharinganc()
			can=0
			if(!src.pk)
				src<<"You are in a non pk zone"
				return
			if(!src.Sharinganon)
				src<<"turn on Sharingan.."
				can=0
				src.doing=0
				return
			if(!src.copied)
				src.doing=0
				return
			if(src.copiedchakracost>src.chakra)
				src.doing=0
				src<<output("Not enough chakra [src.chakra]/[src.copiedchakracost]", "combatlog")
				can=0
				return
			if(cem)
				src<<"You have to wait 1 minute every time to use Sharingan copy "
				can=0
				src.doing=0
				return
			else
				can=1
		Sharingancopy()//lol advanced shizle
			if(!src.Sharinganon)
				return
			if(src.Sharinganon)
				src.Sharinganc()
				if(can)
					src.chakra-=src.copiedchakracost
					src.Skills("[rem]")//will need a rework due to procedure stuff
					cem=1
					sleep(src.copiedcooldown)
					cem=0
			else
				src<<"turn on Sharingan.."
				can=0


	verb
		sharicoped()
			set hidden = 1
			if(!src.Sharinganon)
				return
			src.copied=rem
			src.copiedchakracost=nem
			src.copiedcooldown=dem
			src.overlays+='sharicopy.dmi'
			src<<"'Sharingancopy'-Remembered [rem]"
			src.doing=0
			src.overlays-='sharicopy.dmi'
			sleep(10)

