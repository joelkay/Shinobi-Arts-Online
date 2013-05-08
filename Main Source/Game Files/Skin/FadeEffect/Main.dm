client
{
	//
	// We have JavaScript in the splashscreen.htm which send
	// information to this BYOND app and Topic is what
	// receives that information. We extract the data and
	// set the variable. In this case, we are being informed
	// about the player wanting to skip our splash screen.
	//
	Topic(href, href_list[])
	{
		var/skip = href_list["skip"];
		if (skip)
		{
			usr.m_iIsSkippingLogoScreen = 1;
		}
	}
}
mob
{
	Login()
	{
		Mob_DisplayLogoScreen();
		Mob_DisplayMainScreen();
		..();
	}
	var
	{
		m_iIsSkippingLogoScreen = 0;
	}
	proc
	{
		Mob_DisplayLogoScreen()
		{
			usr << browse_rsc('Game Files\\Graphics\\SplashScreen.htm',"SplashScreen.htm");
			usr << browse_rsc('Game Files\\Graphics\\SAO.png',"SAO.png");
			src << browse({"<meta http-equiv="Refresh" content="0; url=SplashScreen.htm">"},"window=SplashScreenBrowser");

			winset(usr, "child1", "left=SplashScreen");

			//
			// Wait for 10 seconds or however long you want
			// To loop forever until the player clicks, just set
			// the while to while(1)
			//
			var/i = 0;
			while(i++ < 100)
			{
				if (m_iIsSkippingLogoScreen)
				{
					break;
				}

				sleep(1)
			}
		}
		Mob_DisplayMainScreen()
		{
			usr.Login2();
		}
	}
}