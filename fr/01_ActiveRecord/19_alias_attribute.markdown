## alias\_attribute fonctionne avec des objets modifi�s (*Dirty Objects*)

Pour comprendre cette �volution, analysons un fragment de code ex�cut� sous les versions ant�rieures et 2.2 de Rails. Examinons cet exemple :

	class Comment < ActiveRecord::Base
	  alias_attribute :text, :body
	end

Nous remarquons que j'utilise la m�thode `alias_attribute`pour cr�er un alias nomm� `text` pour l'attribut `body`. En th�orie, cette m�thode devrait r�pliquer toutes les m�thodes dynamiques cr��es par `ActiveRecord` pour `body`. Mais voyez cet exemple de code ex�cut� sous Rails&nbsp;2.1 ou ant�rieur :

	c = Comment.first
	# => #<Comment id: 1, body: "mon commentaire">

	c.body
	# => "mon commentaire"

	c.text
	# => "mon commentaire"

	c.body = "nouveau message"
	# => "nouveau message"

	c.body_changed?
	# => true

	c.text_changed?
	# => NoMethodError: undefined method `text_changed?' ...

L'ex�cution de la m�thode `text_changed?` provoque une erreur, car `alias_attribute` ne r�plique pas les m�thodes de suivi. Ceci a �t� corrig�, voici le m�me code ex�cut� sous Rails&nbsp;2.2 :

	c = Comment.first
	# => #<Comment id: 1, body: "mon commentaire">

	c.body
	# => "mon commentaire"

	c.text
	# => "mon commentaire"

	c.body = "nouveau message"
	# => "nouveau message"

	c.body_changed?
	# => true

	c.text_changed?
	# => true

	c.text_change
	# => ["mon commentaire", "nouveau message"]