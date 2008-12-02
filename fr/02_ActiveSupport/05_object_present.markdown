## Nouvelle méthode : Object#present?

Une nouvelle méthode a été ajoutée à la classe de base *Object*. La méthode `present?` est équivalente à `!Object#blank?`.

Autrement dit, un objet est présent s'il n'est pas vide (*empty*). Mais qu'est-ce exactement qu'un objet vide ?

	class EmptyTrue
	  def empty?() true; end
	end

	a = EmptyTrue.new
	b = nil
	c = false
	d = ''
	e = '   '
	g = "  \n\t  \r "
	g = []
	h = {}

	a.present? # => false
	b.present? # => false
	c.present? # => false
	d.present? # => false
	e.present? # => false
	f.present? # => false
	g.present? # => false
	h.present? # => false

Tous ces objets sont vides, ou autrement dit, ne sont pas présents.

Mais soyez prudents, certaines personnes s'emmêlent. Voici quelques objets non vides, et donc présents :

	class EmptyFalse
	  def empty?() false; end
	end

	a = EmptyFalse.new
	b = Object.new
	c = true
	d = 0
	e = 1
	f = 'a'
	g = [nil]
	h = { nil => 0 }

	a.present? # => true
	b.present? # => true
	c.present? # => true
	d.present? # => true
	e.present? # => true
	f.present? # => true
	g.present? # => true
	h.present? # => true

Tout objet qui contient une valeur est présent, et c'est même vrai d'un `Array` qui contient `nil`, car il n'est pas vide.

