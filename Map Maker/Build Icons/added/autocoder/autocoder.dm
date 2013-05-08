
/*
This auto coder was built based off a Snippet found on the on the forums from Shadowdarke,
after asking Shadowdarke if it was okay to release a demo of his snippet which had been modified he agreed.
Thanks to Shadowdarke for allowing me to use his snippet. Most of this file you will find was coded by myself,
but it would have been alot harder without the use of his snippet.

The purpose of this auto coder is to make it easier for developers and people who are unfamiliar with DM to code the basics of a game easily.
More functions that are a common staple in BYOND games may be added later.
If you have helpful comments or suggestions you can reach me at writerdude2004@yahoo.com
Also, bugs are probably in this code as of this release. If you find them. Notify me via pager or email.
*/




var/product1
var/product2
var/product3
var/product4
var/product5
var/product6
var/product7
var/areaname
/*

mob/verb
	Play_Music(S as sound)
		usr << sound(S)

mob/verb/Find_Size(F as file)
	var/size = length(F)
	usr<<"[F], [size]"


mob
    verb
        AutoTurf()
            var/Icon = input("Select an icon") as icon|null
            if(!Icon)
                src << "Cancelled."
                return
            var/turfname = ckey("[Icon]")
            turfname = input("Choose a name for this turf subtype.", \
				"Turf name",turfname) as null|text
            if(!turfname)
                src << "Aborted."
                return

            // check for existing file
            if(fexists("[turfname].dm"))
                switch(alert("File '[turfname].dm' already exists. \
					Do you wish to overwrite, append the file, or \
					abort?", "'[turfname].dm' already exists.", \
					"Overwrite", "Append", "Abort"))
                    if("Abort")
                        src << "Aborted."
                        return
                    if("Overwrite")
                        fdel("[turfname].dm")
                    // no need to do anything for "Append"

            var/icon/I = new(Icon)
            text2file({"// generated [time2text(world.realtime)] \
			by a nifty snippet from Shadowdarke.\nturf\n\t[turfname]\
			\n\t\ticon = '[Icon]'\n\t\ticon_state = """},\
			"[turfname].dm")

            switch(alert("Should the turf (or turfs) have opacity?", "Darkness?", "Yes","No"))
                if("Yes")
                    var/shade= input("How much?","How much opacity?") as num
                    text2file("\t\topacity = [shade]", "[turfname].dm")


            switch(alert("Should the turf (or turfs) have luminosity?", "Light?", "Yes","No"))
                if("Yes")
                    var/watts = input("How much?","How much luminosity?") as num
                    text2file("\t\tluminosity = [watts]", "[turfname].dm")


            switch(alert("Should the turf (or turfs) have density?", "Density?", "Yes","No"))
                if("Yes")
                    text2file("\t\tdensity = 1", "[turfname].dm")


            // don't include the "" state in the loop(Shadow's comment)
            for(var/state in I.IconStates() - "")
                text2file("\t\t[state]", "[turfname].dm")
                text2file({"\t\t\ticon_state = "[state]""},\
				"[turfname].dm") //end of Shadowdarke's snippet







            src << "'[turfname].dm' successfully written."

mob
    verb
        AutoArea()
            switch(alert("Do the Area(s) have an icon file?","Icon file?","Yes","No"))
                if("Yes")
                    var/Icon = input("Select an icon") as icon|null
                    if(!Icon)
                        src << "Canceled."
                        return
                    var/areaname = ckey("[Icon]")
                    areaname = input("Choose a name for this area subtype.", \
				        "Area name",areaname) as null|text
                    if(!areaname)
                        src << "Aborted."
                        return

                    // check for existing file
                    if(fexists("[areaname].dm"))
                        switch(alert("File '[areaname].dm' already exists. \
					        Do you wish to overwrite, append the file, or \
					        abort?", "'[areaname].dm' already exists.", \
					        "Overwrite", "Append", "Abort"))
                            if("Abort")
                                src << "Aborted."
                                return
                            if("Overwrite")
                                fdel("[areaname].dm")
                    // no need to do anything for "Append"

                    var/icon/I = new(Icon)
                    text2file({"// generated [time2text(world.realtime)] \
			        	by a nifty snippet from Shadowdarke.\narea\n\t[areaname]\
			        	\n\t\ticon = '[Icon]'\n\t\ticon_state = """},\
			        	"[areaname].dm")

                    // don't include the "" state in the loop
                    for(var/state in I.IconStates() - "")
                        text2file("\t\t[state]", "[areaname].dm")
                        text2file({"\t\t\t"icon_state = "[state]""},\
			    	    "[areaname].dm")
                else
                    src <<"Continuing without icon file."

                    var/areaname = ckey("[name]")
                    areaname = input("Choose a name for this area subtype.", \
				        "Area name",areaname) as null|text
                    if(!areaname)
                        src << "Aborted."
                        return

                    // check for existing file
                    if(fexists("[areaname].dm"))
                        switch(alert("File '[areaname].dm' already exists. \
					        Do you wish to overwrite, append the file, or \
					        abort?", "'[areaname].dm' already exists.", \
					        "Overwrite", "Append", "Abort"))
                            if("Abort")
                                src << "Aborted."
                                return
                            if("Overwrite")
                                fdel("[areaname].dm")
                    // no need to do anything for "Append"

                    text2file({"// generated [time2text(world.realtime)] \
			        	by a nifty snippet from Shadowdarke (modified by Rockinawsome).\narea\n\t[areaname]\
			        	"},\
			        	"[areaname].dm")




                    switch(alert("Should the area (or areas) have luminosity?", "Light?", "Yes","No"))
                        if("Yes")
                            var/watts = input("How much?","How much luminosity?") as num
                            text2file("\t\tluminosity = [watts]", "[areaname].dm")


                    switch(alert("Should the area (or areas) have density?", "Density?", "Yes","No"))
                        if("Yes")
                            text2file("\t\tdensity = 1", "[areaname].dm")

                    switch(alert("Does the Area teleport?","Area teleports usr?","Yes","No"))
                        if("Yes")
                            switch(alert("Does the teleport occur when it is stepped on (entered) or when it is activated?",,"Activated","Entered"))
                                if("Activated")
                                    switch(alert("Do you want to enter co-ordinates for the teleport or do you want it to go to an object in your game?",,"Co-Ordinates","Type"))
                                        if("Co-Ordinates")
                                            again
                                            var/xco = input("What do you want the x co-ordinate to be?") as num
                                            if(!xco)
                                                src<<"<b> No X co-ordinate entered, try again."
                                                goto again
                                            notagain
                                            var/yco = input("What do you want the y co-ordinate to be?") as num
                                            if(!yco)
                                                src<<"<b> No Y co-ordinate entered, try again."
                                                goto notagain
                                            ocrapagain
                                            var/zco = input("What do you want the z co-ordinate to be?") as num
                                            if(!zco)
                                                src<<"<b> No Z co-ordinate entered, try again."
                                                goto ocrapagain

                                            text2file({"\n\t\tverb/Teleport() \
                                            \n\t\t\tusr.Move(locate([xco],[yco],[zco])) \
                                            \n\t\t\tusr<<"You teleported to [xco],[yco],[zco]" \
                                            "},"[areaname].dm")
                                        else

                                            var/atomtype = input("What is the type of the atom?","Atom Type?") in list("Area","Turf","Obj","Mob")
                                            switch(atomtype)
                                                if("Area")
                                                    var/name = input("What is the name of the Area?") as text|null
                                                    if(!name)
                                                        src<<"Teleport verb cancelled."
                                                        return
                                                    text2file({"\n\t\tverb/Teleport() \
                                                    \n\t\t\tusr.Move(locate(/area/[name])) \
                                                    "},"[areaname].dm")
                                                if("Turf")
                                                    var/name = input("What is the name of the Turf?") as text|null
                                                    if(!name)
                                                        src<<"Teleport verb cancelled."
                                                        return
                                                    text2file({"\n\t\tverb/Teleport() \
                                                    \n\t\t\tusr.Move(locate(/turf/[name])) \
                                                    "},"[areaname].dm")
                                                if("Obj")
                                                    var/name = input("What is the name of the obj?") as text|null
                                                    if(!name)
                                                        src<<"Teleport verb cancelled."
                                                        return
                                                    text2file({"\n\t\tverb/Teleport() \
                                                    \n\t\t\tusr.Move(locate(/obj/[name])) \
                                                    "},"[areaname].dm")
                                                if("Mob")
                                                    var/name = input("What is the name of the Mob") as text|null
                                                    if(!name)
                                                        src<<"Teleport verb cancelled."
                                                        return
                                                    text2file({"\n\t\tverb/Teleport() \
                                                    \n\t\t\tusr.Move(locate(/mob/[name])) \
                                                    "},"[areaname].dm")


//now for the entered part
                                else
                                    switch(alert("Do you want to enter co-ordinates for the teleport or do you want it to go to an object in your game?",,"Co-Ordinates","Type"))
                                        if("Co-Ordinates")
                                            again
                                            var/xco = input("What do you want the x co-ordinate to be?") as num
                                            if(!xco)
                                                src<<"<b> No X co-ordinate entered, try again."
                                                goto again
                                            notagain
                                            var/yco = input("What do you want the y co-ordinate to be?") as num
                                            if(!yco)
                                                src<<"<b> No Y co-ordinate entered, try again."
                                                goto notagain
                                            ocrapagain
                                            var/zco = input("What do you want the z co-ordinate to be?") as num
                                            if(!zco)
                                                src<<"<b> No Z co-ordinate entered, try again."
                                                goto ocrapagain

                                            text2file({"\n\t\tEntered(mob/M) \
                                            \n\t\t\tusr.Move(locate([xco],[yco],[zco])) \
                                            \n\t\t\tusr<<"You teleported to [xco],[yco],[zco]" \
                                            "},"[areaname].dm")
                                        else
                                            var/atomtype = input("What is the type of the atom?","Atom Type?") in list("Area","Turf","Obj","Mob")
                                            switch(atomtype)
                                                if("Area")
                                                    var/name = input("What is the name of the Area?") as text|null
                                                    if(!name)
                                                        src<<"Teleport verb cancelled."
                                                        return
                                                    text2file({"\n\t\tverb/Teleport() \
                                                    \n\t\t\tusr.Move(locate(/area/[name])) \
                                                    "},"[areaname].dm")
                                                if("Turf")
                                                    var/name = input("What is the name of the Turf?") as text|null
                                                    if(!name)
                                                        src<<"Teleport verb cancelled."
                                                        return
                                                    text2file({"\n\t\tverb/Teleport() \
                                                    \n\t\t\tusr.Move(locate(/turf/[name])) \
                                                    "},"[areaname].dm")
                                                if("Obj")
                                                    var/name = input("What is the name of the obj?") as text|null
                                                    if(!name)
                                                        src<<"Teleport verb cancelled."
                                                        return
                                                    text2file({"\n\t\tverb/Teleport() \
                                                    \n\t\t\tusr.Move(locate(/obj/[name])) \
                                                    "},"[areaname].dm")
                                                if("Mob")
                                                    var/name = input("What is the name of the Mob") as text|null
                                                    if(!name)
                                                        src<<"Teleport verb cancelled."
                                                        return
                                                    text2file({"\n\t\tverb/Teleport() \
                                                    \n\t\t\tusr.Move(locate(/mob/[name])) \
                                                    "},"[areaname].dm")






                    src << "'[areaname].dm' successfully written."



mob
    verb
        AutoMob()

            var/Icon = input("Select an icon") as icon|null
            if(!Icon)
                src << "Cancelled."
                return
            areaname = ckey("[Icon]")
            areaname = input("Choose a name for this mob subtype.", \
				"Area name",areaname) as null|text
            if(!areaname)
                src << "Cancelled."
                return

            // check for existing file
            if(fexists("[areaname].dm"))
                switch(alert("File '[areaname].dm' already exists. \
					Do you wish to overwrite, append the file, or \
					abort?", "'[areaname].dm' already exists.", \
					"Overwrite", "Append", "Abort"))
                    if("Abort")
                        src << "Aborted."
                        return
                    if("Overwrite")
                        fdel("[areaname].dm")
                    // no need to do anything for "Append"

            var/icon/I = new(Icon)
            text2file({"// generated [time2text(world.realtime)] \
				by a nifty snippet from Shadowdarke (modified by Rockinawsome).\nmob\n\t[areaname]\
				\n\t\ticon = '[Icon]'\n\t\ticon_state = """},\
				"[areaname].dm")

            // don't include the "" state in the loop
            for(var/state in I.IconStates() - "")
                text2file("\t\t[state]", "[areaname].dm")
                text2file({"\t\t\t"icon_state = "[state]""},\
				"[areaname].dm")


            switch(alert("Should the mob (or mobs) say anything?", "Mob Should say ____.", "Yes","No"))
                if("Yes")
                    var/speak = input("What should this mob say?","Mob Says:") as null|text
                    if(!speak)
                        usr<<"Cancelled."

                    else
                        text2file({"\t\tverb/Talk()//speech done by Rockinawsome \
                        \n\t\t\tset src in oview(1) \
                        \n\t\t\tusr<< "[speak]""},"[areaname].dm")


            switch(alert("Is the mob a shopkeeper?", "Is the mob a merchant?", "Yes","No"))
                if("Yes")
                    var/currency = input("What is the name of the currency your game uses?") as null|text
                    if(!currency)
                        src << "Shopkeeping not added."
                        return
                    product1 = input("The name of the first product?",":") as null|text
                    if(!product1)
                        src << "Product Cancelled."
                        return
                    var/sellworth1 = input("How much should [product1] sell for?", "Selling Worth") as num

                    //product one
                    text2file({"\t\tverb/Buy()//merchant done by Rockinawsome \
                    \n\t\t\tset src in oview(1) //You will have to manually add the names of the products into the list below, because of the code structure, the first one is done for you.\
                    \n\t\t\tswitch(input("What do you want to buy?","Selling..."") in list("","","","","","","","Cancel")
                    \n\t\t\t\tif("[product1]")
                    \n\t\t\t\t\tswitch(alert("[product1] costs [sellworth1] [currency], buy it?","Purchase [product1]?","Yes","No")) \
                    \n\t\t\t\t\t\tif("Yes") \
                    \n\t\t\t\t\t\t\tif(usr.[currency]>=[sellworth1]) \
                    \n\t\t\t\t\t\t\t\tnew/obj/[product1](usr) \
                    \n\t\t\t\t\t\t\t\tusr<<"You bought the [product1] for [sellworth1] [currency]!" \
                    \n\t\t\t\t\t\t\telse \
                    \n\t\t\t\t\t\t\t\tusr<<"<b>You don't have that much [currency]!" \
                    \n\t\t\t\telse \
                    \n\t\t\t\t\tusr<<"[areaname]: Farewell!" \
                    "},"[areaname].dm")


                    switch(alert("You may have up to seven products, add another?","Add another product?","Yes","No"))//product2
                        if("Yes")
                            product2 = input("The name of the second product?",":") as null|text
                            if(!product2)
                                usr << "Product Cancelled."
                                return


                            var/sellworth2 = input("How much should [product2] sell for?", "Selling Worth") as num

                            //product 2
                            text2file({"
                            \n\t\t\t\tif("[product2]") \
                            \n\t\t\t\t\tswitch(alert("[product2] costs [sellworth2] [currency], buy it?","Purchase [product2]?","Yes","No")) \
                            \n\t\t\t\t\t\tif("Yes") \
                            \n\t\t\t\t\t\t\tif(usr.[currency]>=[sellworth2]) \
                            \n\t\t\t\t\t\t\t\tnew/obj/[product2](usr) \
                            \n\t\t\t\t\t\t\t\tusr<<"You bought the [product2] for [sellworth2] [currency]!" \
                            \n\t\t\t\t\t\t\telse \
                            \n\t\t\t\t\t\t\t\tusr<<"<b>You don't have that much [currency]!" \
                            \n\t\t\t\telse \
                            \n\t\t\t\t\tusr<<"[areaname]: Farewell!" \
                            "},"[areaname].dm")

                            switch(alert("You may have up to seven products, add another?","Add another product?","Yes","No"))//product3
                                if("Yes")
                                    product3 = input("The name of the third product?",":") as null|text
                                    if(!product3)
                                        usr << "Product Cancelled."
                                        return


                                    var/sellworth3 = input("How much should [product3] sell for?", "Selling Worth") as num

                                    //product 3
                                    text2file({"
                                	\n\t\t\t\tif("[product3]") \
                                	\n\t\t\t\t\tswitch(alert("[product3] costs [sellworth3] [currency], buy it?","Purchase [product3]?","Yes","No")) \
                                	\n\t\t\t\t\t\tif("Yes") \
                                	\n\t\t\t\t\t\t\tif(usr.[currency]>=[sellworth3]) \
                                	\n\t\t\t\t\t\t\t\tnew/obj/[product3](usr) \
                                	\n\t\t\t\t\t\t\t\tusr<<"You bought the [product3] for [sellworth3] [currency]!" \
                                	\n\t\t\t\t\t\t\telse \
                                	\n\t\t\t\t\t\t\t\tusr<<"<b>You don't have that much [currency]!" \
                                	\n\t\t\t\telse \
                                	\n\t\t\t\t\tusr<<"[areaname]: Farewell!"
                                	"},"[areaname].dm")

                                    switch(alert("You may have up to seven products, add another?","Add another product?","Yes","No"))//product4
                                        if("Yes")
                                            product4 = input("The name of the fourth product?",":") as null|text
                                            if(!product4)
                                                src << "Product Cancelled."
                                                return


                                            var/sellworth4 = input("How much should [product4] sell for?","Selling Worth") as num
                                            text2file({"
                                	        \n\t\t\t\tif("[product4]") \
                                	        \n\t\t\t\t\tswitch(alert("[product4] costs [sellworth4] [currency], buy it?","Purchase [product4]?","Yes","No")) \
                                	        \n\t\t\t\t\t\tif("Yes") \
                                	        \n\t\t\t\t\t\t\tif(usr.[currency]>=[sellworth4]) \
                                	        \n\t\t\t\t\t\t\t\tnew/obj/[product4](usr) \
                                	        \n\t\t\t\t\t\t\t\tusr<<"You bought the [product4] for [sellworth4] [currency]!" \
                                	        \n\t\t\t\t\t\t\telse \
                                	        \n\t\t\t\t\t\t\t\tusr<<"<b>You don't have that much [currency]!" \
                                	        \n\t\t\t\telse \
                                	        \n\t\t\t\t\tusr<<"[areaname]: Farewell!"
                                	        "},"[areaname].dm")

                                            //product5
                                            switch(alert("You may have up to seven products, add another?","Add another product?","Yes","No"))//product5
                                                if("Yes")
                                                    product5 = input("The name of the fifth product?",":") as null|text
                                                    if(!product5)
                                                        src << "Product Cancelled."
                                                        return

                                                    var/sellworth5 = input("How much should [product5] sell for?","Selling Worth") as num
                                                    text2file({"
                                	                \n\t\t\t\tif("[product5]") \
                                	                \n\t\t\t\t\tswitch(alert("[product5] costs [sellworth5] [currency], buy it?","Purchase [product5]?","Yes","No")) \
                                	                \n\t\t\t\t\t\tif("Yes") \
                                	                \n\t\t\t\t\t\t\tif(usr.[currency]>=[sellworth5]) \
                                	                \n\t\t\t\t\t\t\t\tnew/obj/[product5](usr) \
                                	                \n\t\t\t\t\t\t\t\tusr<<"You bought the [product5] for [sellworth5] [currency]!" \
                                	                \n\t\t\t\t\t\t\telse \
                                	                \n\t\t\t\t\t\t\t\tusr<<"<b>You don't have that much [currency]!" \
                                	                \n\t\t\t\telse \
                                	                \n\t\t\t\t\tusr<<"[areaname]: Farewell!"
                                	                "},"[areaname].dm")

                                                         //product6
                                                    switch(alert("You may have up to seven products, add another?","Add another product?","Yes","No"))//product6
                                                        if("Yes")
                                                            product6= input("The name of the sixth product?",":") as null|text
                                                            if(!product6)
                                                                src << "Product Cancelled."
                                                                return

                                                            var/sellworth6 = input("How much should [product6] sell for?","Selling Worth") as num
                                                            text2file({"
                                	                        \n\t\t\t\tif("[product6]") \
                                	                        \n\t\t\t\t\tswitch(alert("[product6] costs [sellworth6] [currency], buy it?","Purchase [product6]?","Yes","No")) \
                                	                        \n\t\t\t\t\t\tif("Yes") \
                                	                        \n\t\t\t\t\t\t\tif(usr.[currency]>=[sellworth6]) \
                                	                        \n\t\t\t\t\t\t\t\tnew/obj/[product6](usr) \
                                	                        \n\t\t\t\t\t\t\t\tusr<<"You bought the [product6] for [sellworth6] [currency]!" \
                                	                        \n\t\t\t\t\t\t\telse \
                                	                        \n\t\t\t\t\t\t\t\tusr<<"<b>You don't have that much [currency]!" \
                                	                        \n\t\t\t\telse \
                                	                        \n\t\t\t\t\tusr<<"[areaname]: Farewell!"
                                	                        "},"[areaname].dm")

                                                            switch(alert("You may have up to seven products, add another?","Add another product?","Yes","No"))//product5
                                                                if("Yes")
                                                                    product7= input("The name of the seventh product?",":") as null|text
                                                                    if(!product7)
                                                                        src << "Product Cancelled."
                                                                        return

                                                                    var/sellworth7 = input("How much should [product7] sell for?","Selling Worth") as num
                                                                    text2file({"
                                	                                \n\t\t\t\tif("[product7]") \
                                	                                \n\t\t\t\t\tswitch(alert("[product7] costs [sellworth7] [currency], buy it?","Purchase [product7]?","Yes","No")) \
                                	                                \n\t\t\t\t\t\tif("Yes") \
                                	                                \n\t\t\t\t\t\t\tif(usr.[currency]>=[sellworth7]) \
                                	                                \n\t\t\t\t\t\t\t\tnew/obj/[product7](usr) \
                                	                                \n\t\t\t\t\t\t\t\tusr<<"You bought the [product7] for [sellworth7] [currency]!" \
                                	                                \n\t\t\t\t\t\t\telse \
                                	                                \n\t\t\t\t\t\t\t\tusr<<"<b>You don't have that much [currency]!" \
                                	                                \n\t\t\t\telse \
                                	                                \n\t\t\t\t\tusr<<"[areaname]: Farewell!"
                                	                                "},"[areaname].dm")






            src << "'[areaname].dm' successfully written."

*/

mob
    verb
        AutoObj()

            var/Icon = input("Select an icon") as icon|null
            if(!Icon)
                src << "Cancelled."
                return
            var/objname = ckey("[Icon]")
            objname = input("Choose a name for this turf subtype.", \
				"Turf name",objname) as null|text
            if(!objname)
                src << "Aborted."
                return

            // check for existing file
            if(fexists("[objname].dm"))
                switch(alert("File '[objname].dm' already exists. \
					Do you wish to overwrite, append the file, or \
					abort?", "'[objname].dm' already exists.", \
					"Overwrite", "Append", "Abort"))
                    if("Abort")
                        src << "Aborted."
                        return
                    if("Overwrite")
                        fdel("[objname].dm")
                    // no need to do anything for "Append"

            var/icon/I = new(Icon)
            text2file({"// generated [time2text(world.realtime)] \
			by a nifty snippet from Shadowdarke (modified by Rockinawsome).\nobj\n\t[objname]\
			\n\t\ticon = '[Icon]'\n\t\ticon_state = """},\
			"[objname].dm")


            for(var/state in I.IconStates() - "")
                text2file("\t\t[state]", "[objname].dm")
                text2file({"\t\t\ticon_state = "[state]""}, "[objname].dm")
                text2file({"\t\t\tbuild = /buildable/[objname]/[state]"},\
				"[objname].dm") //end of Shadowdarke's snippet



//src << "'[objname].dm' successfully written."

/*

//now for the entered part
                        else
                            switch(alert("Do you want to enter co-ordinates for the teleport or do you want it to go to an object in your game?",,"Co-Ordinates","Type"))
                                if("Co-Ordinates")
                                    again
                                    var/xco = input("What do you want the x co-ordinate to be?") as num
                                    if(!xco)
                                        src<<"<b> No X co-ordinate entered, try again."
                                        goto again
                                    notagain
                                    var/yco = input("What do you want the y co-ordinate to be?") as num
                                    if(!yco)
                                        src<<"<b> No Y co-ordinate entered, try again."
                                        goto notagain
                                    ocrapagain
                                    var/zco = input("What do you want the z co-ordinate to be?") as num
                                    if(!zco)
                                        src<<"<b> No Z co-ordinate entered, try again."
                                        goto ocrapagain

                                    text2file({"\n\t\tEntered(mob/M) \
                                    \n\t\t\tusr.Move(locate([xco],[yco],[zco])) \
                                    \n\t\t\tusr<<"You teleported to [xco],[yco],[zco]" \
                                    "},"[objname].dm")
                                else
                                    switch(alert("What is the type of the atom?",,"Area","Turf","Obj","Mob"))
                                        if("Area")
                                            var/name = input("What is the name of the Area?") as text|null
                                            if(!name)
                                                src<<"Teleport verb cancelled."
                                                return
                                            text2file({"\n\t\tEntered(mob/M) \
                                            \n\t\t\tusr.Move(locate(/area/[name])) \
                                            "},"[objname].dm")
                                        if("Turf")
                                            var/name = input("What is the name of the Turf?") as text|null
                                            if(!name)
                                                src<<"Teleport verb cancelled."
                                                return
                                            text2file({"\n\t\tEntered(mob/M) \
                                            \n\t\t\tusr.Move(locate(/turf/[name])) \
                                            "},"[objname].dm")
                                        if("Obj")
                                            var/name = input("What is the name of the Obj?") as text|null
                                            if(!name)
                                                src<<"Teleport verb cancelled."
                                                return
                                            text2file({"\n\t\tEntered(mob/M) \
                                            \n\t\t\tusr.Move(locate(/obj/[name])) \
                                            "},"[objname].dm")
                                        if("Mob")
                                            var/name = input("What is the name of the Mob") as text|null
                                            if(!name)
                                                src<<"Teleport verb cancelled."
                                                return
                                            text2file({"\n\t\tEntered(mob/M) \
                                            \n\t\t\tusr.Move(locate(/mob/[name])) \
                                            "},"[objname].dm")
                        else
                            switch(alert("Do you want to enter co-ordinates for the teleport or do you want it to go to an object in your game?",,"Co-Ordinates","Type"))
                                if("Co-Ordinates")
                                    again
                                    var/xco = input("What do you want the x co-ordinate to be?") as num
                                    if(!xco)
                                        src<<"<b> No X co-ordinate entered, try again."
                                        goto again
                                    notagain
                                    var/yco = input("What do you want the y co-ordinate to be?") as num
                                    if(!yco)
                                        src<<"<b> No Y co-ordinate entered, try again."
                                        goto notagain
                                    ocrapagain
                                    var/zco = input("What do you want the z co-ordinate to be?") as num
                                    if(!zco)
                                        src<<"<b> No Z co-ordinate entered, try again."
                                        goto ocrapagain

                                    text2file({"\n\t\tEntered(mob/M) \
                                    \n\t\t\tusr.Move(locate([xco],[yco],[zco])) \
                                    \n\t\t\tusr<<"You teleported to [xco],[yco],[zco]" \
                                    "},"[objname].dm")














var/clientormob = ""
var/namemob = ""
var/bgcolor = ""
var/fontcolor = ""
var/where = ""
var/where2 = ""
var/wheretext = ""
var/picture1
var/picture2
var/width = ""
var/width2 = ""
var/height = ""
var/height2 = ""
var/gamename = ""
var/clientswitch = ""
var/nameofdefaultmob = "PC"










mob/verb/Auto_Text_Box()
	var/textboxname = ""
	var/clientormob = ""
	var/objname = ckey("[name]")
	objname = input("Choose a name for this  Text Box (like a web page).", \
	"Text Box Name",objname) as null|text
	if(!objname)
		src << "Aborted."
		return

	if(fexists("[objname].dm"))
		switch(alert("File '[objname].dm' already exists. \
				Do you wish to overwrite, append the file, or \
				abort?", "'[objname].dm' already exists.", \
				"Overwrite", "Append", "Abort"))
			if("Abort")
				src << "Aborted."
				return
			if("Overwrite")
				fdel("[objname].dm")

	switch(alert("Is this a Client or Mob based verb?","Client or Mob?","Client","Mob"))
		if("Client")
			clientormob = "client"
		if("Mob")
			clientormob = "mob"

			namemob = input("What is the mob's name?",namemob) as text|null
			if(!namemob)
				usr<<"<b> Verb will be for default mob of game..."

	fartfantastic	// a senseless label for an easy loop

	bgcolor = input("What color is the background?") as text|null
	if(!bgcolor)
		usr<<"<b> You must enter a background color ex: white, green, black, blue, red, yellow or a hex code such as #000000..."
		goto fartfantastic

	fartfantango

	fontcolor = input("What color is the font's color?") as text|null
	if(!fontcolor)
		usr<<"<b> You must enter a background color ex: white, green, black, blue, red, yellow or a hex code such as #000000..."
		goto fartfantango


	switch(alert("Do you wish to add a picture to the text box?","Add Picture?","Yes","No"))
		if("Yes")
			picture1 = input("Select a picture file (preferably a .png") as icon|null
			if(!picture1)
				src << "<b> You must select an icon!"

			switch(input("Where do you wish to place the picture?","Where?",where) in list("Center","Top","Right","Left","Bottom","Skip"))
				if("Center")
					where = "center"
				if("Top")
					where = "top"
				if("Bottom")
					where = "bottom"
				if("Right")
					where = "right"
				if("Left")
					where = "left"

			widthagain

			width = input("How wide is the picture?") as num|null
			if(!width)
				usr<<"<b> You must enter a size!"
				goto widthagain
			//no need to do anything for "skip"

			heightagain

			height = input("How tall is the picture?") as num|null
			if(!height)
				usr<<"<b> You must enter a size!"
				goto heightagain

			switch(alert("Do you wish to add a second picture to the text box?","Add Picture?","Yes","No"))
				if("Yes")
					picture2 = input("Select a picture file (preferably a .png") as icon|null
					if(!picture2)
						src << "<b> You must select an icon!"

					switch(input("Where do you wish to place the picture?","Where?",where) in list("Center","Top","Right","Left","Bottom","Skip"))
						if("Center")
							where2 = "center"
						if("Top")
							where2 = "top"
						if("Bottom")
							where2 = "bottom"
						if("Right")
							where2 = "right"
						if("Left")
							where2 = "left"


					widthagain2

					width2 = input("How wide is the picture?") as num|null
					if(!width2)
						usr<<"<b> You must enter a size!"
						goto widthagain2
			//no need to do anything for "skip"

					heightagain2

					height2 = input("How tall is the picture?") as num|null
					if(!height2)
						usr<<"<b> You must enter a size!"
						goto heightagain2


		else
			src <<"<b> Continuing without a picture..."


	rename

	textboxname = input("What Should the Name of the Text Verb be?",textboxname) as text|null
	if(!textboxname)
		usr<<"<b> Sorry! You need to name your verb!"
		goto rename
	if(findtext(textboxname," "))
		usr<<"<b> Sorry! No spaces allowed!"
		goto rename



	else
		var/what2say = ""
		what2say = input("What should the Text Box Verb say?",what2say) as text|null
		var/what2sayagain = ""
		what2sayagain = input("Add more text if you wish - otherwise leave this blank") as text|null
		if(what2sayagain)
			switch(input("Align this Text?","Where?",wheretext) in list("Center","Top","Right","Left","Bottom","Skip"))
				if("Center")
					wheretext = "center"
				if("Top")
					wheretext = "top"
				if("Bottom")
					wheretext = "bottom"
				if("Right")
					wheretext = "right"
				if("Left")
					wheretext = "left"


		text2file("var/const/[textboxname] = {\"  \  ","[objname].dm")
		text2file({" \n
		<html> \n \
		<head><title>[textboxname]</title></head> \n \
		<body bgcolor = "[bgcolor]"> \n \
		<font color = "[fontcolor]"> \n \
		[what2say] \
		<img src =[picture1] align=[where] width=[width] height=[height]>
		<img src =[picture2] align=[where2] width=[width2] height=[height2]>
		<p align =[wheretext]>[what2sayagain] </p> \
		</body> \n \
		</html> \n \
		\"}
		"},"[objname].dm")


		if(picture1 && !picture2)
			if(clientormob == "mob")
				text2file({"[clientormob]/[namemob] \
				\n\tverb/[textboxname]() \
				\n\t\tset src in oview(1)
				\n\t\tusr << browse('[picture1]',"display = 0") \
				\n\t\tusr << browse([textboxname],"window = [textboxname]") \
				\t"},"[objname].dm")
			else
				text2file({"[clientormob]/[namemob] \
				\n\tverb/[textboxname]() \
				\n\t\tusr << browse('[picture1]',"display = 0") \
				\n\t\tusr << browse([textboxname],"window = [textboxname]") \
				\t"},"[objname].dm")

		if(picture1 && picture2)
			if(clientormob == "client")
				text2file({"[clientormob]/[namemob] \
				\n\tverb/[textboxname]() \
				\n\t\tset src in oview(1)
				\n\t\tusr << browse('[picture1]',"display = 0") \
				\n\t\tusr << browse('[picture2]',"display = 0") \
				\n\t\tusr << browse([textboxname],"window = [textboxname]") \
				\t"},"[objname].dm")
			else
				text2file({"[clientormob]/[namemob] \
				\n\tverb/[textboxname]() \
				\n\t\tusr << browse('[picture1]',"display = 0") \
				\n\t\tusr << browse('[picture2]',"display = 0") \
				\n\t\tusr << browse([textboxname],"window = [textboxname]") \
				\t"},"[objname].dm")

		usr<<"<b> The text box verb is finished!"
		return




mob/verb/help()
	usr<<{"To use this Auto Coder - based on a snippet from Shadowdarke, modified by Rockinawsome:
	 \n Select the type of ATOM you wish to make (Atom, Turf, Object, Mob) and follow the step by step instructions.
	 \n <center><b>FAQ</b></center>
	 \n Q:What is the Sub Type?
	 \n A:The Sub Type is the name of the atom being created, in conjunction with the name of the file for the purpose of this Auto Coder.
	 \n
	 \n Q:The file has been created, where does it go?
	 \n A:Close Dream Seeker, in Dream Maker (the compiler), the code has been made into a code file in the same directory as the autocoder itself.
	 \n To access the code, click the "Update" button next to the Show all files box on the left hand side of the compiler.
	 \n
	 \n Q:How do I add more to the same file?
	 \n A:In order to add more to a current file, look at the name of the code file (blah.dm for instance), then enter it under the sub type, this will give you the options of overwriting, appending, or aborting, select "Append", this will add the new code to the old code in
        same file.
	 \n Q: What is density, opacity, and luminosity?
	 \n A: Consult the help file in the compiler (Dream Maker) by pressing F1 and search for the answer.
	 \n
	 \n Q: What is a text box?
	 \n A: A text box is like a web page, except that it can be displayed only inside the byond module (game or program). \
	 \n Since a text box can be added to a mob in your game by specifying its name, this can come in handy. To give it an alternate way to speak to the players, \
	 \n Or, if you want - you can specify no name, and the default verb will become the default for mobs in the game (just "mob"), this is useful for displaying virtual web pages, or for setting up stories or help files. \
	 \n
	 \n If you have helpful suggestions or comments, email writerdude2004@yahoo.com
	 "}




mob/verb/Auto_Beginning()
	var/objname = "start"
	objname = input("Choose a name for the code file", \
	"TCode File Name",objname) as null|text
	if(!objname)
		src << "Aborted."
		return

	if(fexists("[objname].dm"))
		switch(alert("File '[objname].dm' already exists. \
				Do you wish to overwrite, append the file, or \
				abort?", "'[objname].dm' already exists.", \
				"Overwrite", "Append", "Abort"))
			if("Abort")
				src << "Aborted."
				return
			if("Overwrite")
				fdel("[objname].dm")



	gamename = input("What is the name of your new byond project?") as text|null
	if(!gamename)
		usr<<"<b> You need a name for your project!"
		return
	var/keyname = ckey("[name]")
	keyname = input("What is the name of your byond key that you wish to publish this under?") as text|null
	if(!keyname)
		usr<<"<b> You need a key to publish this under!"
		return

	switch(alert("Is the player only a client, or a mob as well?","Client  Based (generally for MUDS) or Mob  Based (everything else)?","Client","Mob"))
		if("Client")
			clientswitch = "client"
		if("Mob")
			clientswitch = "mob"
			nameofdefaultmob = input("What is the name of the player's mob in the game (make mob by itself if they are all the same)? Don't include a slash at the end as this is already included.") as text|null
			if(nameofdefaultmob)
				nameofdefaultmob += "/"


	if(clientswitch == "mob")
		text2file({"world \n \
		\tname = "[gamename]" \n \
		\tmob =  /mob/[nameofdefaultmob] \n \
		\thub = "[keyname].[gamename]" \n \
		\n
		mob
			[nameofdefaultmob]
		"},"[objname].dm")
	else
		text2file({"\n
		world \n \
		\tname = "[gamename]" \n \
		\thub = "[keyname].[gamename]" \
		\n
		\n
		"},"[objname].dm")

	usr<<"<b> The beginning has been created. Note: You will have to add your own Login() script until I feel like adding it to the Auto Coder!"

*/