## render :template accepte maintenant :locals

Les méthodes `render :action` et `render :partial` vous autorisent à passer, avec l'option `:locals`, un `Hash` qui contient les données que vous voulez afficher, mais `render :template` ne le permettait pas.

Ça marche maintenant dans cette version de Rails&nbsp;:

	render :template => "weblog/show", :locals => {:customer => Customer.new}