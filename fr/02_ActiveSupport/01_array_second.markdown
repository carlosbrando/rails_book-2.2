## Méthodes Array#second à Array#tenth

La classe `Array` comportait déjà les méthodes `first` and `last` ; pourquoi ne pas ajouter `second`, `third`, `fourth`, etc. ? C'est ce qui vient d'être fait : ces méthodes renvoient le n-ième élément du tableau.

Voici un exemple :

	array = (1..10).to_a

	array.second  # => array[1]
	array.third   # => array[2]
	array.fourth  # => array[3]
	array.fifth   # => array[4]
	array.sixth   # => array[5]
	array.seventh # => array[6]
	array.eighth  # => array[7]
	array.ninth   # => array[8]
	array.tenth   # => array[9]
