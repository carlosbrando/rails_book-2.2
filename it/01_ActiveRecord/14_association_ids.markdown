## Migliorare le performance nei metodi association\_id

Se avete due modelli, `Post` e `Comment`, dove un post ha più commenti (`has_many`), se eseguite il codice:

	Post.first.comment_ids

Rails utilizzerà la seguente query per recuperare gli id:

	SELECT * FROM `comments` WHERE (`comments`.post_id = 1)

Ma in questo caso, non siamo interessati agli oggetti completi. La seguente query sarebbe più che sufficiente per realizzare il precedente metodo, e sarebbe anche più veloce:

	SELECT `comments`.id FROM `comments` WHERE (`comments`.post_id = 1)

Per entrambe le associazioni `has_many` e `has_many :through`, il codice base di Rails è stato aggiornato per includere da questa versione in poi tale miglioramento delle performance.
