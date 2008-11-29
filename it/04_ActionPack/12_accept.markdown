## Disabilitare Accept header nelle richieste HTTP

Iniziamo con del codice di esempio;

	def index
	  @people = Person.find(:all)

	  respond_to do |format|
	    format.html
	    format.xml { render :xml => @people.to_xml }
	  end
	end

Nell'esempio Rails ha due modi per capire quale formato debba essere utilizzato nel blocco `respond_to`. Il primo, e più comune, è attraverso il formato indicato nella URL (ad esempio: /index.html); il secondo modo entra in gioco quando il primo non viene indicato, ovvero Rails usa il valore di **Accept** nell'header della richiesta (proveniente dal client, NdT).

Per chi non lo conoscesse, l'header **Accept** è utilizzato per indicare quale tipo di documenti (spesso chiamati MIME Types: http://en.wikipedia.org/wiki/MIME) il browser preferisca. Si utilizzano stringhe del tipo:

	Accept: text/plain, text/html
	Accept: text/x-dvi; q=.8; mxb=100000; mxt=5.0, text/x-c

	# recuperare questa informazine nel codice
	@request.env["HTTP_ACCEPT"] = "text/javascript"

Vedete la seguente URL per una lista dei MIME types più comunemente utilizzati:
http://www.developershome.com/wap/detection/detection.asp?page=httpHeaders

Questo header non è implementato efficientemente su molti browser, e utilizzato su siti web pubblici causa strani errori quando i robot indicizzatori effettuano le loro richieste HTTP.

Da qui la decisione di disabilitare tale header per default. E' sempre consigliabile indicare il formato richieste attraverso l'URL, ma se aveste bisogno di tale header, è sufficiente includere la seguente linea di configurazione nel vostro **environment.rb**:

	config.action_controller.use_accept_header = false

Quando disabilitato, se il formato non è indicato nell'URL Rails assume che venga richiesto comunque **.html**.

Esiste tuttavia un'eccezione alla regola, ovvero quando effettuate una richiesta ajax utilizzando l'header **X-Requested-With**. In questo caso il formato **.js** viene utilizzato anche se non è stato esplicitamente indicato (esempio: /poeple/1).
