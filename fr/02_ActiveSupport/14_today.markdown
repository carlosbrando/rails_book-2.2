## Trois nouvelle méthodes pour les classes de dates et heures

Les classes `Time`, `Date`, `DateTime` et `TimeWithZone` reçoivent trois nouvelles méthodes très commodes. Elles ont maintenant `today?` (aujourd'hui), `past?` (passé) et `future?` (futur), pour nous faciliter la vie.

Je crois qu'il n'est pas besoin d'en expliquer le fonctionnement, alors voici les trois méthodes en action :

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
