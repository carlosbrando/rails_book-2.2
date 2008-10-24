## Suporte a XHTML no atom\_feed

O helper `atom_feed` agora possui um builder interno que permite a criação de XHTML simplesmente acrescentando `:type=>"xhtml"` em qualquer elemento `content`, `rights`, `title`, `subtitle` ou `summary`. Assim:

	entry.summary(:type => 'xhtml') do |xhtml|
	  xhtml.p "A XHTML summary"
	  xhtml.p post.body
	end

Veja como este bloco se encaixa dentro do `atom_feed`:

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

Desta forma o builder interno do `atom_feed` irá incluir o XHTML gerado dentro de uma tag DIV.

Claro que ainda podemos fazer da forma antiga passando todo o HTML dentro de uma string, mas desta forma nosso código fica mais limpo.
