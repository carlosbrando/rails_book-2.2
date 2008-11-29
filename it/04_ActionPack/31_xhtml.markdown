## Supporto all'XHTML in atom\_feed

Adesso l'helper `atom_feed` ha un builder interno che vi permette di creare XHTML semplicemente aggiungendo `:type=>"xhtml"` agli elementi `content`, `rights`, `title`, `subtitle` o `summary`. Esempio:

	entry.summary(:type => 'xhtml') do |xhtml|
	  xhtml.p "A XHTML summary"
	  xhtml.p post.body
	end

Osservate come questo blocco si innesta nella chiamata `atom_feed`:

	atom_feed do |feed|
	  feed.title("My great blog!")
	  feed.updated((@posts.first.created_at))

	  for post in @posts
	    feed.entry(post) do |entry|
	      entry.title(post.title)

	      entry.summary(:type => 'xhtml') do |xhtml|
	        xhtml.p "A XHTML summary"
	        xhtml.p post.body
	      end

	      entry.author do |author|
	        author.name("DHH")
	      end
	    end
	  end
	end

In tal modo, il builder interno di `atom_feed` includerà all'interno di un tag **div** l'XHTML generato.

Ovviamente, potete ancora utilizzare il vecchio modo di passare tutto l'HTML all'interno di una stringa, ma la nuova modalità è ovviamente più pulita.
