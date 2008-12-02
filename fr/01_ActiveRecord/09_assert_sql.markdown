## Nouvel assistant de test (*test helper*) assert\_sql

Vous connaissez peut-être `assert_queries`, qui sert à vérifier le nombre de requêtes passées pendant le test. Par exemple :

	assert_queries(Firm.partial_updates? ? 0 : 1) { firm.save! }

Dans le test ci-dessus, je spécifie qu'une requête doit être faite seulement s'il y a `partial_updates` ; sinon, aucune requête ne doit être faite.

Nous disposons dorénavant d'un autre assistant pour faciliter le test des requêtes SQL produites par la couche d'abstration `ActiveRecord`. Exemple :

	def test_empty_with_counter_sql
	  company = Firm.find(:first)
	  assert_sql /COUNT/i do
	    assert_equal false, company.clients.empty?
	  end
	end

Dans cet exemple, je spécifie qu'au moins une requête produite dans le bloc devrait contenir le mot **COUNT**. Vous pouvez évidemment être plus spécifique dans l'expression régulière que vous utilisez. Voyons un autre exemple :

	assert_sql(/\(\"companies\".\"id\" IN \(1\)\)/) do
	  Account.find(1, :include => :firm)
	end
