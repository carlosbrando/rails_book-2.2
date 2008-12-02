## alias\_attribute fonctionne avec des objets modifiés (*Dirty Objects*)

Pour comprendre cette évolution, analysons un fragment de code exécuté sous les versions antérieures et 2.2 de Rails. Examinons cet exemple :

	class Comment < ActiveRecord::Base
	  alias_attribute :text, :body
	end

Nous remarquons que j'utilise la méthode `alias_attribute`pour créer un alias nommé `text` pour l'attribut `body`. En théorie, cette méthode devrait répliquer toutes les méthodes dynamiques créées par `ActiveRecord` pour `body`. Mais voyez cet exemple de code exécuté sous Rails&nbsp;2.1 ou antérieur :

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

L'exécution de la méthode `text_changed?` provoque une erreur, car `alias_attribute` ne réplique pas les méthodes de suivi. Ceci a été corrigé, voici le même code exécuté sous Rails&nbsp;2.2 :

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