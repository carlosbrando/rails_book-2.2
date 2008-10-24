## Alterada a mensagem do método assert\_difference

Quando usávamos o método `assert_difference` com múltiplas expressões e um erro ocorria era difícil de saber qual das expressões não teve seu valor alterado, já que a mensagem de erro não informava isto.

No Rails 2.2 a mensagem devolvida pelo método informará exatamente qual expressão não passou no teste. Por exemplo:

	assert_difference ['Post.count', 'current_user.posts.count'] do
	  Post.create(params)
	end

O código acima retornará a seguinte mensagem, caso a segunda expressão não tenha passado: "<current\_user.posts.count> was expression that failed. <1> expected but was <0>.".
