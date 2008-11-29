## Migliorare le performance con gli ETags

Prima di addentrarci nel presente capitolo, introduciamo il concetto di ETags (Entity Tags). In prima approssimazione, possiamo dire che essi sono degli identificatori associati ad ogni risorsa, e determinano se un dato file sul server è identico a quello presente nella cache del browser. Tali "risorse" spesso sono pagine HTML, ma possono anche essere documenti XML o JSON.

Il server ha l'onore di verificare che le risorse richieste siano le medesime su entrambi i lati. Se il server è in grado di verificare ciò, anziché inviare l'intero contenuto della risorsa al client gli restituisce il codice **304**, che suggerisce al browser di utilizzare il file contenuto nella propria cache.

I web server come Apache o IIS già sono in grado di utilizzare tale meccanismo per le pagine statiche; ma quando il contenuto è dinamico, come in molti casi nei progetti Rails, è nostra responsabilità gestire tale meccanismo.

L'oggetto `response` ha due nuove attributi: `last_modified` e `etag`. Quando vengono assegnati dei valori a tali attributi, questi vengono assegnati anche agli header HTTP `HTTP_IF_MODIFIED_SINCE` e `HTTP_IF_NONE_MATCH`, rispettivamente. Quando viene effettuata una nuova richiesta per una data risorsa l'oggetto `request` restituito contiene questi due attributi, il che vi permette di confrontarli con i valori attuali della risorsa ed agire di conseguenza. Se la versione presente nella cache dell'utente è la più recente, anziché inviare nuovamente la risorsa sarà sufficiente inviare un codice "304 Not Modified", che indica al browser di visualizzare la versione presente nella sua cache.

Per fare tutto ciò sono disponibili due metodi, a seconda della situazione: `stale?` e `fresh_when`.

Esempio:

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

Nel precedente esempio, se i valori dell'header di `request` differiscono da quelli presenti nella chiamata a `stale?` significa che la cache dell'utente non è aggiornata. In tal caso il blocco `respond_to` viene invocato e i valori presenti in `stale?` vengono assegnati agli attributi `last_modified` ed `etag` dell'oggetto `response.`

Se i valori coincidono significa che la cache dell'utente è aggiornata. In questo caso il blocco `respond_to` non viene invocato, e viene restituito lo stato "304 Not Modified".

Abbiamo a disposizione anche il metodo `fresh_when`, che è una versione semplificata del metodo `stale?`. Osservate l'esempio:

	def show
	  @article = Article.find(params[:id])
	  fresh_when(:etag => @article, :last_modified => @article.created_at.utc)
	end

Questo metodo assegna i valori che riceve ai rispettivi attributi dell'oggetto `response` e verifica che siano uguali a quelli dell'oggetto `request`. Se differiscono (stale) visualizza l'opportuno template. Se sono uguali (fresh) restituisce lo status "304 Not Modified" anziché visualizzare il template.

In alcuni casi potrebbe essere necessario passare un `Array` alle opzioni `:etag`, come nel seguente esempio:

	fresh_when(:etag => [@article, current_user], :last_modified => @article.created_at.utc)
	
	# or
	
	if stale?(:last_modified => @article.published_at.utc, :etag => [@article, current_user])
		# ...
	end