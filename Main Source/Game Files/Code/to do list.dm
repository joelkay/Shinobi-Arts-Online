
//Made Chidori make the mob move faster. if we add the lightning clan this can be their default speed :P

//Finally fixed the inventory previes, but Im using maps so idk if it will be laggy ^_^


//TO DO 2

html

-> finish Clan upforms

->update medic skills

-> non-Clans get stuff at login screen.

->techsnew2. at the end fix it.


turf/medal_door
  density = 1
  icon_state = "closed"
  var/medal = "Dragon slayer"

  verb/Knock()
    usr<<"<b>Guard:</b> Just checking your credentials....."
    var/hasmedal = world.GetMedal(medal, usr)
    if(hasmedal)
      usr<<"<b>Guard:</b> Go right in.."
      icon_state = "open"
      density = 0
    else if(!isnull(hasmedal))
      usr<<"<b>Guard:</b> Sorry, no admittance without a <b>[medal]</b> badge.."
    else
      usr<<"<b>Guard:</b> Sorry, I lost the paperwork. Try again later.."


http://www.byond.com/developer/Forum_account/Region  for regions