## Il metodo ActiveRecord#count non include un alias per le associazioni

Supponiamo che abbiate la seguente associazione `has_many :through`:

	class Author < ActiveRecord::Base
	  has_many :authorships
	  has_many :books, :through => :authorships
	end

Quando cercate un libro, potete includere le informazioni dell'autore:

	author.books.find(:all, :include => :authorships,
	                  :conditions => ["authorships.primary = ?", true])

Questo non presenta alcun problema, ma provando ha fare la stessa cosa con il metodo `count`:

	author.books.count(:include => :authorships,
	                   :conditions => ["authorships.primary = ?", true])

Otteniamo un errore. Questo accade perché la tabella **authorships** viene inclusa due volte nella stessa query. 

Il metodo `find` è più intelligente, dal momento che crea un alias per la tabella, cosa che il metodo `count` non fa. Sappiamo che probabilmente l'esempio fatto non è dei migliori, ma dimostra comunque il problema in oggetto.

Questo bug è stato corretto. Adesso il metodo `count` si comporta come `find` in tutti i casi in cui si presenta un `:include`.


## Bug corretto in ActiveRecord#count

C'era un bug in `ActiveRecord#count` che si manifestava con `has_many` unitamente alle opzioni `:limit` o `:offset`. Vediamo un esempio:

	class Post < ActiveRecord::Base
	  has_many :comments, :limit=> 2
	end

Nel codice sopra, quando cercate di recuperare i commenti di un post solamente due di questi vengono restituiti.

	post.comments.length # => 2

	# Notate l'SQL generato:
	# SELECT * AS count_all FROM "comments" WHERE
	# ("comments".post_id = 1) LIMIT 2

Ma quando utilizziamo il metodo `count`:

	post.comments.count # => 3

	# Notate l'SQL generato:
	# SELECT count(*) AS count_all FROM "comments" WHERE
	# ("comments".post_id = 1)

Come potete vedere, l'errore è dovuto al fatto che la clausola `LIMIT 2` non veniva inclusa nella query SQL.

Ovviamente questo problema è stato risolto con la versione 2.2 di Rails.
