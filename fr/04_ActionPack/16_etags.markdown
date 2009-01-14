## Amélioration de la performance avec les ETags

Avant d'en parler, permettez-moi d'expliquer ce que sont les Etags (Entity Tags). En gros, ce sont des identificateurs qui sont associés à chaque ressource pour déterminer si un fichier sur le serveur est le même que celui qui est dans le cache du navigateur. C'est souvent du HTML, mais ça pourrait aussi être du XML ou du JSON. 

C'est le serveur qui doit vérifier que la ressource demandée est la même des deux côtés. Si le serveur le confirme, au lieu de renvoyer le contenu complet de la ressource, il peut renvoyer un statut **304*** (*Not Modified*), qui indique au navigateur d'utiliser le fichier en cache.

Des serveurs web comme Apache et IIS savent déjà le faire pour des pages statiques, mais quand le contenu est dynamique, ce qui est le cas pour la plupart des pages d'un projet Ruby on Rails, c'est de votre responsabilité.

L'objet `response` a deux nouveaux attributs&nbsp;: `last_modified` et `etag`. Les valeurs affectées à ces attributs sont directement passées dans les headers `HTTP_IF_MODIFIED_SINCE` et `HTTP_IF_NONE_MATCH` respectivement. Quand une nouvelle requête pour une ressource est émise, l'objet `request` reviendra avec ces headers, ce qui vous permettra de les comparer avec les valeurs courantes et de déterminer si le cache de l'utilisateur est aussi récent que le contenu de la ressource. Si la version cachée est la plus récente, au lieu de restituer la ressource à nouveau, vous pouvez simplement renvoyer un statut "304 Not Modified" au navigateur qui utilisera la version cachée.

Pour ce faire, deux méthodes sont disponibles selon la situation&nbsp;: `stale?` et `fresh_when`.
Voyons un exemple&nbsp;:

	class ArticlesController < ApplicationController
	  def show
	    @article = Article.find(params[:id])

	    if stale?(:last_modified => @article.published_at.utc, :etag => @article)
	      respond_to do |wants|
	        wants.html
	        wants.xml { render :xml => @article }
	      end
	    end    
	  end
	end

Dans cet exemple, si les valeurs des headers de `request` sont différentes de celles qui sont passées dans l'appel à `stale?`, cela signifie que le cache utilisateur n'est pas à jour, donc le bloc `respond_to` est appelé et les valeurs passées à `stale?` sont affectées aux attributs `last_modified` et `etag` de l'objet `response`.

Si les valeurs sont égales, cela signifie que le cache utilisateur est à jour. Le bloc `respond_to` n'est pas appelé et un statut "304 Not Modified" est renvoyé.

Nous avons aussi la méthode `fresh_when`, qui est une version simplifiée de la méthode `stale?`. Voyez cet exemple&nbsp;:

	def show
	  @article = Article.find(params[:id])
	  fresh_when(:etag => @article, :last_modified => @article.created_at.utc)
	end


Simplement, cette méthode affecte les valeurs reçues à leurs attributs respectifs de l'objet `response` et vérifie qu'elles sont égales à celles de l'objet `request`. Si elles sont différentes (*stale*), elle restitue le *template* approprié. Si elles sont sont égales (*fresh*), le statut "304 Not Modified" est renvoyé.

Dans certains cas, if faudra passer un `Array` à l'option `:etag`, comme dans l'exemple suivant&nbsp;:

	fresh_when(:etag => [@article, current_user], :last_modified => @article.created_at.utc)
	
	# ou bien
	
	if stale?(:last_modified => @article.published_at.utc, :etag => [@article, current_user])
		# ...
	end
