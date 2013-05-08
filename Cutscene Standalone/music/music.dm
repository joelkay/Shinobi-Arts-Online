client
	New()
		..()
		src.Testsound()



	proc
		Testsound()
			var/sound/S = sound('intro.wav')
			src << S
