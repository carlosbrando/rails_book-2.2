## Melhorando a performance nos métodos association\_ids

Se você tiver dois modelos: `Post` e `Comment`. Onde um post tem muitos (`has_many`) comentários. Se você executar:

	Post.first.comment_ids

O Rails usará a seguinte query para recuperar os ids:

	SELECT * FROM `comments` WHERE (`comments`.post_id = 1)

Mas neste caso, não precisamos dos objetos inteiros. A seguinte query seria mais do que suficiente para o funcionamento deste método, além de possuir uma performance melhor:

	SELECT `comments`.id FROM `comments` WHERE (`comments`.post_id = 1)

Tanto para associações `has_many`, como para associações `has_many :through` o código do Rails foi alterado para incluir esta melhora de performance a partir desta versão.
