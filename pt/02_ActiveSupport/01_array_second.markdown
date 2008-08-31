## Array#second até Array#tenth

No objeto Array já tínhamos o método `first` e `last`, então porque não ter também os métodos `second`, `third`, `fourth` e assim por diante? É isso mesmo, foram acrescentados ao objeto **Array** os métodos que vão do `second` (segundo) até o `tenth` (décimo), que servem para retornar o objeto especifico dentro do **Array** (o terceiro objeto do array, por exemplo).

Vamos aos exemplos:

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
