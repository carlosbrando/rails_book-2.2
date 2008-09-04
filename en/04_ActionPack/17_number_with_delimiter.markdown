## Alteração na assinatura do método number\_with\_delimiter

O método `number_with_delimiter` recebeu uma nova implementação. Além de uma melhora no código para que fique mais limpo a assinatura do método também mudou. Veja a antiga:

	def number_with_delimiter(number, delimiter=",", separator=".")

	# Exemplos de uso
	number_with_delimiter(12345678) # => 12,345,678
	number_with_delimiter(12345678.05) # => 12,345,678.05
	number_with_delimiter(12345678, ".") # => 12.345.678
	number_with_delimiter(98765432.98, " ", ",")

E a nova:

	def number_with_delimiter(number, *args)

	# Exemplos de uso
	number_with_delimiter(12345678) # => 12,345,678
	number_with_delimiter(12345678.05) # => 12,345,678.05
	number_with_delimiter(12345678, :delimiter => ".") # => 12.345.678
	number_with_delimiter(12345678, :seperator => ",") # => 12,345,678
	number_with_delimiter(98765432.98, :delimiter => " ", :separator => ",")

Então atenção, agora ao usarmos o método `number_with_delimiter` devemos informar as opções na chamada do método.
