## Nouvelle m�thode Enumerable#many?

Une nouvelle m�thode `many?` a �t� ajout�e au module `Enumerable`. Comme son nom ("plusieurs") l'indique, elle vous dit si la collection comporte plusieurs objets.

Cette m�thode est un alias pour `collection.size > 1`. Voyons quelques exemples :

	>> [].many?
	# => false

	>> [ 1 ].many?
	# => false

	>> [ 1, 2 ].many?
	# => true

En plus de ces formats, la nouvelle impl�mentation de cette m�thode lui permet de recevoir un bloc, qui fonctionne de la m�me mani�re que pour la m�thode `any?`.

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

Pour pr�ciser, cette m�thode renvoie `true` si plus d'une it�ration du bloc renvoie `true` ou, quand elle est invoqu�e sans bloc, si la collection contient plus d'un objet.

Incidemment, cette m�thode devait s'appeler `several?` avant d'�tre chang�e en `many?`.
