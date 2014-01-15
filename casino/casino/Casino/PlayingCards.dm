CardPack
	var/int
	var/icon
	var/suit=""
	var/list/Deck

	icon='blue_cardbackfront.dmi'

	Ace
		int=1

	Two
		int=2

	Three
		int=3

	Four
		int=4

	Five
		int=5

	Six
		int=6

	Seven
		int=7

	Eight
		int=8

	Nine
		int=9

	Ten
		int=10

	Jack
		int=11

	Queen
		int=12

	King
		int=13



	proc/Populate()
		Deck=new//our Deck to be populated

		//Flowers
		var/CardPack/Ace/Af = new()
		Af.icon='aceflower.dmi'
		Af.suit="flowers"
		var/CardPack/Two/Bf = new()
		Bf.icon='twoflower.dmi'
		Bf.suit="flowers"
		var/CardPack/Three/Cf = new()
		Cf.icon='threeflower.dmi'
		Cf.suit="flowers"
		var/CardPack/Four/Df = new()
		Df.icon='fourflower.dmi'
		Df.suit="flowers"
		var/CardPack/Five/Ef = new()
		Ef.icon='fiveflower.dmi'
		Ef.suit="flowers"
		var/CardPack/Six/Ff = new()
		Ff.icon='sixflower.dmi'
		Ff.suit="flowers"
		var/CardPack/Seven/Gf = new()
		Gf.icon='sevenflower.dmi'
		Gf.suit="flowers"
		var/CardPack/Eight/Hf = new()
		Hf.icon='eightflower.dmi'
		Hf.suit="flowers"
		var/CardPack/Nine/If = new()
		If.icon='nineflower.dmi'
		If.suit="flowers"
		var/CardPack/Ten/Jf = new()
		Jf.icon='tenflower.dmi'
		Jf.suit="flowers"
		var/CardPack/Jack/Kf = new()
		Kf.icon='jackflower.dmi'
		Kf.suit="flowers"
		var/CardPack/Queen/Lf = new()
		Lf.icon='queenflower.dmi'
		Lf.suit="flowers"
		var/CardPack/King/Mf = new()
		Mf.icon='kingflower.dmi'
		Mf.suit="flowers"
		//
		Deck.Add(Af,Bf,Cf,Df,Ef,Ff,Gf,Hf,If,Jf,Kf,Lf,Mf)

		//Diamonds
		var/CardPack/Ace/Ad = new()
		Ad.icon='acediamond.dmi'
		Ad.suit="diamonds"
		var/CardPack/Two/Bd = new()
		Bd.icon='twodiamond.dmi'
		Bd.suit="diamonds"
		var/CardPack/Three/Cd = new()
		Cd.icon='threediamond.dmi'
		Cd.suit="diamonds"
		var/CardPack/Four/Dd = new()
		Dd.icon='fourdiamond.dmi'
		Dd.suit="diamonds"
		var/CardPack/Five/Ed = new()
		Ed.icon='fivediamond.dmi'
		Ed.suit="diamonds"
		var/CardPack/Six/Fd = new()
		Fd.icon='sixdiamond.dmi'
		Fd.suit="diamonds"
		var/CardPack/Seven/Gd = new()
		Gd.icon='sevendiamond.dmi'
		Gd.suit="diamonds"
		var/CardPack/Eight/Hd = new()
		Hd.icon='eightdiamond.dmi'
		Hd.suit="diamonds"
		var/CardPack/Nine/Id = new()
		Id.icon='ninediamond.dmi'
		Id.suit="diamonds"
		var/CardPack/Ten/Jd = new()
		Jd.icon='tendiamond.dmi'
		Jd.suit="diamonds"
		var/CardPack/Jack/Kd = new()
		Kd.icon='jackdiamond.dmi'
		Kd.suit="diamonds"
		var/CardPack/Queen/Ld = new()
		Ld.icon='queendiamond.dmi'
		Ld.suit="diamonds"
		var/CardPack/King/Md = new()
		Md.icon='kingdiamond.dmi'
		Md.suit="diamonds"
		//
		Deck.Add(Ad,Bd,Cd,Dd,Ed,Fd,Gd,Hd,Id,Jd,Kd,Ld,Md)

		//Hearts
		var/CardPack/Ace/Ah = new()
		Ah.icon='aceheart.dmi'
		Ah.suit="hearts"
		var/CardPack/Two/Bh = new()
		Bh.icon='twoheart.dmi'
		Bh.suit="hearts"
		var/CardPack/Three/Ch = new()
		Ch.icon='threeheart.dmi'
		Ch.suit="hearts"
		var/CardPack/Four/Dh = new()
		Dh.icon='fourheart.dmi'
		Dh.suit="hearts"
		var/CardPack/Five/Eh = new()
		Eh.icon='fiveheart.dmi'
		Eh.suit="hearts"
		var/CardPack/Six/Fh = new()
		Fh.icon='sixheart.dmi'
		Fh.suit="hearts"
		var/CardPack/Seven/Gh = new()
		Gh.icon='sevenheart.dmi'
		Gh.suit="hearts"
		var/CardPack/Eight/Hh = new()
		Hh.icon='eightheart.dmi'
		Hh.suit="hearts"
		var/CardPack/Nine/Ih = new()
		Ih.icon='nineheart.dmi'
		Ih.suit="hearts"
		var/CardPack/Ten/Jh = new()
		Jh.icon='tenheart.dmi'
		Jh.suit="hearts"
		var/CardPack/Jack/Kh = new()
		Kh.icon='jackheart.dmi'
		Kh.suit="hearts"
		var/CardPack/Queen/Lh = new()
		Lh.icon='queenheart.dmi'
		Lh.suit="hearts"
		var/CardPack/King/Mh = new()
		Mh.icon='kingheart.dmi'
		Mh.suit="hearts"
		//
		Deck.Add(Ah,Bh,Ch,Dh,Eh,Fh,Gh,Hh,Ih,Jh,Kh,Lh,Mh)

		//Spades
		var/CardPack/Ace/As = new()
		As.icon='acespade.dmi'
		As.suit="spades"
		var/CardPack/Two/Bs = new()
		Bs.icon='twospade.dmi'
		Bs.suit="spades"
		var/CardPack/Three/Cs = new()
		Cs.icon='threespade.dmi'
		Cs.suit="spades"
		var/CardPack/Four/Ds = new()
		Ds.icon='fourspade.dmi'
		Ds.suit="spades"
		var/CardPack/Five/Es = new()
		Es.icon='fivespade.dmi'
		Es.suit="spades"
		var/CardPack/Six/Fs = new()
		Fs.icon='sixspade.dmi'
		Fs.suit="spades"
		var/CardPack/Seven/Gs = new()
		Gs.icon='sevenspade.dmi'
		Gs.suit="spades"
		var/CardPack/Eight/Hs = new()
		Hs.icon='eightspade.dmi'
		Hs.suit="spades"
		var/CardPack/Nine/Is = new()
		Is.icon='ninespade.dmi'
		Is.suit="spades"
		var/CardPack/Ten/Js = new()
		Js.icon='tenspade.dmi'
		Js.suit="spades"
		var/CardPack/Jack/Ks = new()
		Ks.icon='jackspade.dmi'
		Ks.suit="spades"
		var/CardPack/Queen/Ls = new()
		Ls.icon='queenspade.dmi'
		Ls.suit="spades"
		var/CardPack/King/Ms = new()
		Ms.icon='kingspade.dmi'
		Ms.suit="spades"
		//
		Deck.Add(As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is,Js,Ks,Ls,Ms)

		if(Deck.len==52)//succesful populate
			return 1

		else
			return 0//fail populate

