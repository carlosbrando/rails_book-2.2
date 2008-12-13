## Nouvelle syntaxe de test

Une nouvelle manière de déclarer les tests a été ajoutée, avec `test/do`. Voyez :

	test "verify something" do
	  # ...
	end

C'est la nouvelle norme pour les tests Rails. Voici un test unitaire généré dans cete version :

	require 'test_helper'

	class PostTest < ActiveSupport::TestCase
	  # Replace this with your real tests.
	  test "the truth" do
	    assert true
	  end
	end

La manière classique, avec des méthodes, continuera à fonctionner, ainsi vos anciens tests continueront à passer.
