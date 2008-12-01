## Nouvelle méthode Enumerable#many?

Une nouvelle méthode `many?` a été ajoutée au module `Enumerable`. Comme son nom ("plusieurs") l'indique, elle vous dit si la collection comporte plusieurs objets.

Cette méthode est un alias pour `collection.size > 1`. Voyons quelques exemples :

	>> [].many?
	# => false

	>> [ 1 ].many?
	# => false

	>> [ 1, 2 ].many?
	# => true

En plus de ces formats, la nouvelle implémentation de cette méthode lui permet de recevoir un bloc, qui fonctionne de la même manière que pour la méthode `any?`.

Quelques exemples :

	>> x = %w{ a b c b c }
	# => ["a", "b", "c", "b", "c"]

	>> x.many?
	# => true

	>> x.many? { |y| y == 'a' }
	# => false

	>> x.many? { |y| y == 'b' }
	# => true


	# un autre exemple...
	people.many? { |p| p.age > 26 }

Pour préciser, cette méthode renvoie `true` si plus d'une itération du bloc renvoie `true` ou, quand elle est invoquée sans bloc, si la collection contient plus d'un objet.

Incidemment, cette méthode devait s'appeler `several?` avant d'être changée en `many?`.
