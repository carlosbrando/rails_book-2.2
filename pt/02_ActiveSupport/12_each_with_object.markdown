## Novo método each\_with\_object

O método `each_with_object` do Ruby 1.9 foi adicionado ao Rails, caso você ainda não esteja usando a nova versão do Ruby. Este método é bem interessante, pois ele funciona como o conhecido método `each`, com um pequeno diferencial. Cada iteração além de receber um elemento da coleção, recebe também um objeto que chamamos de **memo**.

Por exemplo, vamos dizer que eu pretenda preencher um hash com valores de uma coleção:

	%w(first second third).each_with_object({}) do |str, hash|
	  hash[str.to_sym] = str
	end
	# => {:second=>"second", :first=>"first", :third=>"third"}

Note que no exemplo acima o memo é um hash vazio (`{}`). Dentro do bloco eu preencho este hash com os itens da minha coleção.

Apenas um alerta: Não podemos usar objetos imutáveis como memo, tais como números, `true` e `false`. No exemplo abaixo o retorno sempre será 1, já que o número um não pode ser alterado:

	(1..5).each_with_object(1) { |value, memo| memo *= value } # => 1
