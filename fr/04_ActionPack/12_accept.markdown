## Désactivation du *header* Accept dans les requêtes HTTP

Commençons par un exemple de code :

	def index
	  @people = Person.find(:all)

	  respond_to do |format|
	    format.html
	    format.xml { render :xml => @people.to_xml }
	  end
	end

Dans l'exemple ci-dessus, Rails a deux manières d'identifier le format qui devrait être utilisé pour le bloc `respond_to`. La première et la plus fréquente s'appuie sur le format indiqué dans l'URL (/index.xml, par exemple)&nbsp;; la seconde, quand le format n'est pas spécifié, utilise le *header* **Accept** de la requête HTTP.

Au cas où vous ne le sauriez pas, le *header* **Accept** indique le type de document désiré (souvent appelé type MIME http://fr.wikipedia.org/wiki/Multipurpose\_Internet\_Mail\_Extensions) dans des chaînes qui ressemblent à ceci&nbsp;: 

	Accept: text/plain, text/html
	Accept: text/x-dvi; q=.8; mxb=100000; mxt=5.0, text/x-c

	# recuperando esta informação via código
	@request.env["HTTP_ACCEPT"] = "text/javascript"

Vous trouverez ici une liste des types MIME les plus courants&nbsp;: http://www.developershome.com/wap/detection/detection.asp?page=httpHeaders

Le *header* est mal implémenté dans la majorité des navigateurs. Et son utilisation dans des sites publics provoque parfois des erreurs d'indexation étranges avec les moteurs de recherche.

Il a donc été décidé de désactiver ce *header* par défaut. Il vaut toujours mieux indiquer le format désiré dans vos URL, mais si vous avez besoin de ce header, ajoutez la ligne suivante dans **environment.rb**&nbsp;:

	config.action_controller.use_accept_header = false

Quand l'option est désactivée, si le format n'est pas indiqué par l'URL, Rails supposera qu'il doit utiliser le format **.html**.

Dans le cas particulier des requêtes AJAX avec le *header* **X-Requested-With**, le format **.js** sera utilisé même s'il n'était pas spécifié dans l'URL (/people/1, par exemple).
