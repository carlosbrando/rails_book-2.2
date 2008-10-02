## New method: each\_with\_object

The `each_with_object` method from Ruby 1.9 has been added to Rails, in case you don't happen to be running Ruby 1.9. This method is quite interesting. It functions like the well-known `each` method, with a slight difference. Each iteration, besides receiving an element from the collection, also receives an object called **memo**.

For example, let's say that I intend to fill a hash with the values from a collection:

	%w(first second third).each_with_object({}) do |str, hash|
	  hash[str.to_sym] = str
	end
	# => {:second=>"second", :first=>"first", :third=>"third"}

Note that in the example above, the memo is an empty hash (`{}`). Inside the blog, I fill this hash with the items from my collection.

## Novo método each\_with\_object

O método `each_with_object` do Ruby 1.9 foi adicionado ao Rails, caso você ainda não esteja usando a nova versão do Ruby. Este método é bem interessante, pois ele funciona como o conhecido método `each`, com um pequeno diferencial. Cada iteração além de receber um elemento da coleção, recebe também um objeto que chamamos de **memo**.

Por exemplo, vamos dizer que eu pretenda preencher um hash com valores de uma coleção:

	%w(first second third).each_with_object({}) do |str, hash|
	  hash[str.to_sym] = str
	end
	# => {:second=>"second", :first=>"first", :third=>"third"}

Note que no exemplo acima o memo é um hash vazio (`{}`). Dentro do bloco eu preencho este hash com os itens da minha coleção.

Just be aware that you can't use unchangeable objects as your memo variable, such as numbers, `true`, and `false`. The example below always returns 1, since the number one can't be modified.

	(1..5).each_with_object(1) { |value, memo| memo *= value } # => 1