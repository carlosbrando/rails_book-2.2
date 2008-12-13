## Nouvelle méthode each\_with\_object

La méthode `each_with_object` de Ruby&nbsp;1.9 a été ajouté a Rails, pour le cas cas où vous n'utiliseriez pas la nouvelle version de Ruby. Cette méthode est plutôt intéressante ; elle fonctionne comme la méthode `inject` bien connue avec une petite différence. Chaque itération reçoit, en plus d'un élément de la collection, un objet **memo**.

Supposons par exemple que je veuille remplir un *hash* avec les valeurs d'une collection :

	%w(first second third).each_with_object({}) do |str, hash|
	  hash[str.to_sym] = str
	end
	# => {:second=>"second", :first=>"first", :third=>"third"}

Veuillez noter que, dans l'exemple ci-dessus, l'objet memo est un hash vide (`{}`). Je remplis ce hash à l'intérieur du bloc avec les éléments de la collection.

Attention, vous ne pouvez pas utiliser d'objet immutable comme variable memo, tel qu'un nombre, `true`, ou `false`. L'exemple suivant renvoie toujours 1 puisque le nombre ne peut être modifié.

	(1..5).each_with_object(1) { |value, memo| memo *= value } # => 1
