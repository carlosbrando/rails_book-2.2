## Adesso Time#advance riconosce giorni e settimane parziali

Dopo il rilascio di Rails 2.1 il metodo `Time#advance` smise di funzionare correttamente con i periodi di tempo parziali. Esempio:

	>> Time.stubs(:now).returns Time.local(2000)
	
	>> 1.5.days.ago == 36.hours.ago
	# => false

Questo bug è stato corretto in Rails 2.2.
