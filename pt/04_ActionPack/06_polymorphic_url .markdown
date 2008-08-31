## polymorphic\_url agora é capaz de lidar com recursos singleton

Para mais detalhes sobre o que são rotas singulares veja o capítulo "Informações Adicionais" no fim deste livro.

Até agora o helper `polymorphic_url` não estava tratando singleton resources corretamente.

Um novo patch foi incluído no Rails para permitir que especifiquemos um singular resource usando símbolos, assim como fazemos com namespaces. Exemplo:

	# este código
	polymorphic_url([:admin, @user, :blog, @post])

	# é a mesma coisa que
	admin_user_blog_post_url(@user, @post)
