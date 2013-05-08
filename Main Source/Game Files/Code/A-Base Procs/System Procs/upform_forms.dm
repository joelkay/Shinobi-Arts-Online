upForm/global_css = " body, table { font-family: Verdana; font-size: 10pt } "
// Form Definitions

upForm
	interface_bgstyle = "background-color: #2e2e2e"
	reward
		// A closewindow is a window designed to be Xed out by the viewers
		// The instance is deleted right after it displays the page to the viewers
		form_name = "Quest"
		window_size = "300x220"
		form_type = UPFORM_CLOSEWINDOW
		GenerateBody()
			var/page = {"<body bgcolor="black" text="#00ff00">
				You have completed the [usr.typeq]-rank quest !<br />
				[usr.sponsor] takes [usr.object] and rewards you with \an [usr.Rew].<br />
				You recieved [usr.mon] yen.<br />
				</body>
			"}

			UpdatePage(page)

upForm
	interface_bgstyle = "background-color: #2e2e2e"
	check
		// A closewindow is a window designed to be Xed out by the viewers
		// The instance is deleted right after it displays the page to the viewers
		form_name = "Quest"
		window_size = "300x220"
		form_type = UPFORM_CLOSEWINDOW
		GenerateBody()
			var/page = {"<body bgcolor="black" text="#00ff00">
				Rank: [usr.typeq]
				Quest giver: [usr.sponsor].<br />
				Description: [usr.descript].<br />
				Status: [usr.currnum]% complete.<br />
				</body>
			"}

			UpdatePage(page)

///////////////////////////////

upForm
	Clans
		interface_bgstyle = "background-color: #2e2e2e"

		Puppet

			// A closewindow is a window designed to be Xed out by the viewers
			// The instance is deleted right after it displays the page to the viewers
			form_name = "charcreate.browser"
			window_size = "400x300"
			form_type =  UPFORM_INTERFACE
			GenerateBody()
				var/page = {"<body bgcolor="black" text="#00ff00">
					Pupeteers are one of the most tactical Clan in the game. When one is in controll of a puppet they have a devestating force but however their body is left wide open for any form of attack.
					</body>
				"}

				UpdatePage(page)




		Deidara
			// A closewindow is a window designed to be Xed out by the viewers
			// The instance is deleted right after it displays the page to the viewers
			form_name = "charcreate.browser"
			window_size = "400x300"
			form_type =  UPFORM_INTERFACE
			GenerateBody()
				var/page = {"<body bgcolor="black" text="#00ff00">
					Members of this Clan specialise in "Clay-Art" and usualy rely on their explosive creations in battle.
					</body>
				"}

				UpdatePage(page)



		lee
			// A closewindow is a window designed to be Xed out by the viewers
			// The instance is deleted right after it displays the page to the viewers
			form_name = "charcreate.browser"
			window_size = "400x300"
			form_type =  UPFORM_INTERFACE
			GenerateBody()
				var/page = {"<body bgcolor="black" text="#00ff00">
					Members of this Clan specialise in Taijutsu and also reduce no life costs from gate stages 1-4 because of their will to become ninja.
					</body>
				"}

				UpdatePage(page)


		medic
			// A closewindow is a window designed to be Xed out by the viewers
			// The instance is deleted right after it displays the page to the viewers
			form_name = "charcreate.browser"
			window_size = "400x300"
			form_type =  UPFORM_INTERFACE
			GenerateBody()
				var/page = {"<body bgcolor="black" text="#00ff00">
					Medics have a higher heal rate than other Clans. Also all medic jutsu do double damage and such make these worthy adversaries.
					</body>
				"}

				UpdatePage(page)


		genius
			// A closewindow is a window designed to be Xed out by the viewers
			// The instance is deleted right after it displays the page to the viewers
			form_name = "charcreate.browser"
			window_size = "400x300"
			form_type =  UPFORM_INTERFACE
			GenerateBody()
				var/page = {"<body bgcolor="black" text="#00ff00">
					As a genius you recieve skillpoints much faster than anyone else in the game. Also members with this trait will be able to use forbiden jutsu or even rarely aquire operations to recieve other Clan abilities like Sharingan.
					</body>
				"}

				UpdatePage(page)

		weapons
			// A closewindow is a window designed to be Xed out by the viewers
			// The instance is deleted right after it displays the page to the viewers
			form_name = "charcreate.browser"
			window_size = "400x300"
			form_type =  UPFORM_INTERFACE
			GenerateBody()
				var/page = {"<body bgcolor="black" text="#00ff00">
					Weapon users specialise in high wound moves that reduce an opponets life over time.
					</body>
				"}

				UpdatePage(page)


		Gaara
			// A closewindow is a window designed to be Xed out by the viewers
			// The instance is deleted right after it displays the page to the viewers
			form_name = "charcreate.browser"
			window_size = "400x300"
			form_type =  UPFORM_INTERFACE
			GenerateBody()
				var/page = {"<body bgcolor="black" text="#00ff00">
					As the host of Shukaku, Gaara possessed the ability to manipulate Sand, typically moving it through the air to serve various purposes. The amount of Sand he can control at one time is, fairly immense.
					</body>
				"}

				UpdatePage(page)


		uzumaki
			// A closewindow is a window designed to be Xed out by the viewers
			// The instance is deleted right after it displays the page to the viewers
			form_name = "charcreate.browser"
			window_size = "400x300"
			form_type =  UPFORM_INTERFACE
			GenerateBody()
				var/page = {"<body bgcolor="black" text="#00ff00">
					The uzumaki Clan's definitive characteristic in battle is his immense amount of chakra. While naturally having a significant amount of chakra on his own, he can summon a gargantuan amount given to him by the Nine-Tailed Demon Fox.
					</body>
				"}

				UpdatePage(page)



		Uchiha
			// A closewindow is a window designed to be Xed out by the viewers
			// The instance is deleted right after it displays the page to the viewers
			form_name = "charcreate.browser"
			window_size = "400x300"
			form_type =  UPFORM_INTERFACE
			GenerateBody()
				var/page = {"<body bgcolor="black" text="#00ff00">
					The Uchiha-Clan is the most famous and most powerful Clan of the Leaf. They have the rare and very famous Sharingan bloodline ability. They are know throughout the world for their power.
					</body>
				"}

				UpdatePage(page)

		None
			// A closewindow is a window designed to be Xed out by the viewers
			// The instance is deleted right after it displays the page to the viewers
			form_name = "charcreate.browser"
			window_size = "400x300"
			form_type =  UPFORM_INTERFACE
			GenerateBody()
				var/page = {"<body bgcolor="black" text="#00ff00">

					</body>
				"}

				UpdatePage(page)


		Kaguya
			// A closewindow is a window designed to be Xed out by the viewers
			// The instance is deleted right after it displays the page to the viewers
			form_name = "charcreate.browser"
			window_size = "400x300"
			form_type =  UPFORM_INTERFACE
			GenerateBody()
				var/page = {"<body bgcolor="black" text="#00ff00">
					The Kaguya is a Clan which possess the ability to manipulate and change their skeleton frame. They use their own bones as deadly weapons.
					</body>
				"}

				UpdatePage(page)


		Hyuuga
			// A closewindow is a window designed to be Xed out by the viewers
			// The instance is deleted right after it displays the page to the viewers
			form_name = "charcreate.browser"
			window_size = "400x300"
			form_type =  UPFORM_INTERFACE
			GenerateBody()
				var/page = {"<body bgcolor="black" text="#00ff00">
					The Hyuga Clan is one of oldest noble Clans in Leaf. Clan members possess a kekkei genkai, the Byakugan, which they utilize in the associated Gentle Fist style. Members of the Clan are typified by their lavender eyes, which lack pupils.
					</body>
				"}

				UpdatePage(page)


		Akimichi
			// A closewindow is a window designed to be Xed out by the viewers
			// The instance is deleted right after it displays the page to the viewers
			form_name = "charcreate.browser"
			window_size = "400x300"
			form_type =  UPFORM_INTERFACE
			GenerateBody()
				var/page = {"<body bgcolor="black" text="#00ff00">
					The Akimichi Clan is one of the four noble Clans of Leaf. They are able to convert calories into chakra, which they then use in their hidden technique, Multi-Size Technique and its various related jutsu.
					</body>
				"}

				UpdatePage(page)


		Nara
			// A closewindow is a window designed to be Xed out by the viewers
			// The instance is deleted right after it displays the page to the viewers
			form_name = "charcreate.browser"
			window_size = "400x300"
			form_type =  UPFORM_INTERFACE
			GenerateBody()
				var/page = {"<body bgcolor="black" text="#00ff00">
					The Nara Clan is known for their manipulation of shadows and tending of deer, which graze in a large area of Nara Clan forest. They have kept a book with medicine preparations and effects for generations. Among the medicine described in this book are the secret pills used by the Akimichi Clan.
					</body>
				"}

				UpdatePage(page)


		Haku
			// A closewindow is a window designed to be Xed out by the viewers
			// The instance is deleted right after it displays the page to the viewers
			form_name = "charcreate.browser"
			window_size = "400x300"
			form_type =  UPFORM_INTERFACE
			GenerateBody()
				var/page = {"<body bgcolor="black" text="#00ff00">
					Haku has the kekkei genkai ability of Ice Release, which allow him to control two types of nature chakra. He is able to control both water and wind chakra; this gives Haku the ability to use ice chakra, a mixture of the two.
					</body>
				"}

				UpdatePage(page)



		Jashin
			// A closewindow is a window designed to be Xed out by the viewers
			// The instance is deleted right after it displays the page to the viewers
			form_name = "charcreate.browser"
			window_size = "400x300"
			form_type =  UPFORM_INTERFACE
			GenerateBody()
				var/page = {"<body bgcolor="black" text="#00ff00">
					Jashin is the "successful experiment of the Jashin religion's secret jutsu", which allows him to become immortal, whether it is fatal wounds or dismemberment (though he needs his head to be attached to his body in order to move). He uses this to advantage to otherwise fatally injure himself while he is linked to his opponent in order to kill them. If he goes without killing people for a certain amount of time, he loses his immortality.
					</body>
				"}

				UpdatePage(page)

