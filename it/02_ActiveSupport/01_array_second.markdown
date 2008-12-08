## Da Array#second fino a Array#tenth

Nella classe `Array` già sono presenti i metodi `first` e `last`, quindi perché non aggiungere anche `second`, `third`, `fourth` e così via? Questo è proprio ciò che è stato fatto. Questi metodi restituiscono l'elemento dell'array che si trova all'offset specificato.

Esempio:

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
