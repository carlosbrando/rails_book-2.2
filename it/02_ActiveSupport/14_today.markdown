## Tre nuovi metodi per le classi che interagiscono con date e orari

Le classi `Time`, `Date`, `DateTime` e `TimeWithZone` hanno ricevuto tre nuovi metodi molto utili. Questi sono `today?`, `past?` e `future?`, che talvolta ci possono rendere la vita meno difficile.

E' utile vedere come ciascuno di essi si comporta. Ecco i metodi in azione:

	date = Date.current
	# => Sat, 04 Oct 2008

	date.today?
	# => true

	date.past?
	# => false

	date.future?
	# => false

	time = Time.now
	# => Sat Oct 04 18:36:43 -0300 2008

	time.today?
	# => true
