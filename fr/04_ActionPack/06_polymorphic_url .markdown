## polymorphic\_url fonctionne maintenant avec les singletons

Jusqu'à présent, le helper `polymorphic_url` ne fonctionnait pas correctement avec les singleton.

Un nouveau patch a été inclus dans Rails pour permettre de spécifier un singleton avec des symboles, comme vous le pouvez avec des namespaces. Par exemple&nbsp;:

	# Ce code
	polymorphic_url([:admin, @user, :blog, @post])

	# fait la même chose que
	admin_user_blog_post_url(@user, @post)