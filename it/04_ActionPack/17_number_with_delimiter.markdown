## Modifica alla signature del metodo number\_with\_delimeter

Il metodo `number_with_delimiter` è stato riscritto. Oltre a rendere il codice più chiaro, la signature del metodo è stata modificata. Prima era così:

	def number_with_delimiter(number, delimiter=",", separator=".")

	# usage examples
	number_with_delimiter(12345678) # => 12,345,678
	number_with_delimiter(12345678.05) # => 12,345,678.05
	number_with_delimiter(12345678, ".") # => 12.345.678
	number_with_delimiter(98765432.98, " ", ",")

Questa è la nuova versione:

	def number_with_delimiter(number, *args)

	# usage examples
	number_with_delimiter(12345678) # => 12,345,678
	number_with_delimiter(12345678.05) # => 12,345,678.05
	number_with_delimiter(12345678, :delimiter => ".") # => 12.345.678
	number_with_delimiter(12345678, :seperator => ",") # => 12,345,678
	number_with_delimiter(98765432.98, :delimiter => " ", :separator => ",")

Quindi siate sicuri, prima di utilizzare il metodo `number_with_delimiter`, di aver indicato le opzioni tramite un hash di simboli.
