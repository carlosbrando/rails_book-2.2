## M�thodes Array#second � Array#tenth

La classe `Array` comportait d�j� les m�thodes `first` and `last` ; pourquoi ne pas ajouter `second`, `third`, `fourth`, etc. ? C'est ce qui vient d'�tre fait : ces m�thodes renvoient le n-i�me �l�ment du tableau.

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
