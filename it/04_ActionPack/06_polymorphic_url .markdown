## Ora polymorphic\_url funziona con le singleton resources

Fino ad ora l'helper `polymorphic_url` non funzionava correttamente con le singleton resource.

E' stata aggiunta una nuova patch per permettere di indicare risorse singleton attraverso i simboli, analogamente ai namespace. Esempio:

	# Questo codice
	polymorphic_url([:admin, @user, :blog, @post])

	# è analogo al seguente
	admin_user_blog_post_url(@user, @post)