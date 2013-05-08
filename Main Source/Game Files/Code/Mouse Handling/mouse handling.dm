client
	mouse_pointer_icon=null

mob
	MouseEntered()
		..()
		var/nameentered="[src.namefirst]-[src.name]"
		var/icon/E = new('mouseovers.dmi',"[src.Village]")
		usr.client.mouse_pointer_icon=E
		spawn() src.Name(nameentered,usr)



	MouseExited()//when you dont hover it anymore
		usr.client.mouse_pointer_icon=null

obj
	letters
		icon='Letters.dmi'
		layer=MOB_LAYER+99



mob
	var
		color=rgb(0,0,0)

mob/var/tmp/list/Loaded=new/list()
mob//Mob hmmm, let me think...
	proc//We all know what a proc is.
		Name(text as text,person)//Make it so the proc requires some text.
			set background=1
			if(!text||!src.client)
				return
			var/mob/M=person
			if(text in M.Loaded)return//stop loading more than once

			M.Loaded.Add(text)

			if(length(text)>=21)//If the text has more than 20 characters;
				text=copytext(text,1,21)//Make the text the first 21 characters;
				text+="...."//And for fun lets add the "....".

			var/list/letters=list()//Make a list for later.
			var/CX//Another variable, for the pixel x.
			var/OOE=(lentext(text))//A variable so you can center it.
			if(OOE%2==0)//If you don't know what an if statment is, you probably shouldn't download this.
				CX+=11-((lentext(text))/2*5)//We do want it centered?
			else
				CX+=12-((lentext(text))/2*5)//Right. P.S. Don't fool around with this unless you know exactly what you are doing.
			for(var/a=1, a<lentext(text)+1, a++)//Cut all of the letters up;
				letters+=copytext(text,a,a+1)//And add them to our letters list().
			for(var/X in letters)//For EVERY character in the letters list();
				var/obj/letters/O=new/obj/letters//Make a new letter obj.
				O.icon_state=X//Make the obj look like the character.
				O.pixel_x=CX//Set it on the correct pixel x, like in a map.
				O.pixel_y=40//Put underneath the player.
				//O.icon=O.icon-src.color//Remove any color; just for fun.
				CX+=6//Increase the pixel x variable so they won't all end up on top of each other.
				var/image/B = image(O,src)

				M.client.images += B//Add the letter to the players overlays.
				spawn(30)
					if(M&&M.loggedin)
						M.Loaded=new
						M.client.images -= B

