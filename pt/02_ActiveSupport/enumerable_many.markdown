## Novo método Enumerable#many?

Um novo método foi adicionado ao módulo **Enumerable**: **many?**. E como o nome mesmo diz, ele verifica se a coleção possui mais de um objeto, ou em outras palavras se tem muitos objetos associados.

Este método é um alias para **collection.size > 1**. Vamos ver alguns exemplos:

	>> [].many?
	# => false

	>> [ 1 ].many?
	# => false

	>> [ 1, 2 ].many?
	# => true

Além deste formato dado nos exemplos, este método também recebeu uma nova implementação permitindo que ele aceite blocos, que funciona exatamente como o método **any?**.

Vamos aos exemplos:

	>> x = %w{ a b c b c }
	# => ["a", "b", "c", "b", "c"]

	>> x.many?
	# => true

	>> x.many? { |y| y == 'a' }
	# => false

	>> x.many? { |y| y == 'b' }
	# => true


	# um outro exemplo...
	people.many? { |p| p.age > 26 }

Apenas para relembrar e reforçar, este método só retornará **true** se mais de um objeto passar nas condições quando usado o bloco, e quando a coleção tiver mais de um objeto quando usado sem condicionais.

Só uma curiosidade, o método inicialmente se chamaria **several?**, mas foi alterado para **many?** depois.
