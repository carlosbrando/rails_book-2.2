## Evitare le duplicazioni degli articoli nei feeds

Talvolta ci capita di sottoscriversi ai feed di qualche blog, e subito ci ritroviamo dei post che nonostante siano stati già letti compaiono ancora nel nostro feed reader. Vi è mai successo? Capita per una serie di motivi, ma ovviamente non vogliamo che capiti a chi usa le nostra applicazioni, giusto?

Per aiutarci ad evitare questo inconveniente, ogni entry di un feed generato con il builder `atom_feed` adesso ha una nuova opzione `:id`, che vi permette di customizzare l'id stesso.

	atom_feed({ :id => 'tag:nomedojogo.com,2008:test/' }) do |feed|
	  feed.title("My great blog!")
	  feed.updated((@posts.first.created_at))

	  for post in @posts
	    feed.entry(post, :id => "tag:nomedojogo.com,2008:" + post.id.to_s) do |entry|
	      entry.title(post.title)
	      entry.content(post.body, :type => 'html')

	      entry.author do |author|
	        author.name("Carlos Brando")
	      end
	    end
	  end
	end

Se procedete in questo modo, anche se dovrete riscrivere una porzione del codice che genera i vostri feed, oppure apportare qualche profonda modifica al contenuto del vostro sito, il campo `id` di ciascuna entry non cambierà. In tal modo il feed reader non duplicherà le vecchie entry.

I vostri lettori vi ringrazieranno.

## Aggiungere istruzioni di processamento ai vostri documenti XML

Una nuova opzione è stata aggiunta al metodo `atom_feed`. Adesso è possibile includere istruzioni per processare l'XML. Esempio:

	atom_feed(:schema_date => '2008', :instruct => {
		'xml-stylesheet' => {
			:href=> 't.css', :type => 'text/css'
		}
	}) do |feed|
		# ...
	end

Le istruzioni per processare l'XML vengono lette dall'applicazione che richiede il file. Vengono spesso utilizzate per informare l'applicazione su come dovrebbe manipolare i dati XML.

Nell'esempio precedente, stiamo dicendo all'applicazione ricevente che dovrebbe visualizzare il documento XML con uno specifico foglio di stile. Ecco il risultato:

	<?xml-stylesheet type="text/css" href="t.css"?>
	
	