## Modification de la méthode the assert\_difference

Quand nous utilisions la méthode `assert_difference` avec plus d'une expression et qu'une erreur se produisait, il était difficile de savoir quelle expression avait déclenché l'erreur puisque le message d'erreur ne le mentionnait pas.

En Rails&nbsp;2.2, le message d'erreur indique la méthode qui a déclenché l'erreur. Par exemple :

	assert_difference ['Post.count', 'current_user.posts.count'] do
	  Post.create(params)
	end

Le code affiche le message d'erreur suivant si la seconde expression ne passe pas : "<current\_user.posts.count> was expression that failed. <1> expected but was <0>."