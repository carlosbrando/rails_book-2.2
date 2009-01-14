## Changement de la signature de la méthode number\_with\_delimeter

La méthode `number_with_delimiter` a été réimplémentée. En plus de rendre le code plus propre, la signature a aussi changé. Voici comment c'était avant&nbsp;:

	def number_with_delimiter(number, delimiter=",", separator=".")

	# exemples d'emploi
	number_with_delimiter(12345678) # => 12,345,678
	number_with_delimiter(12345678.05) # => 12,345,678.05
	number_with_delimiter(12345678, ".") # => 12.345.678
	number_with_delimiter(98765432.98, " ", ",")

Voici la nouvelle version&nbsp;:

	def number_with_delimiter(number, *args)

	# exemples d'emploi
	number_with_delimiter(12345678) # => 12,345,678
	number_with_delimiter(12345678.05) # => 12,345,678.05
	number_with_delimiter(12345678, :delimiter => ".") # => 12.345.678
	number_with_delimiter(12345678, :seperator => ",") # => 12,345,678
	number_with_delimiter(98765432.98, :delimiter => " ", :separator => ",")

Assurez vous donc, quand vous utilisez la méthode `number_with_delimiter`, que vous spécifiez bien les options dans un hash.