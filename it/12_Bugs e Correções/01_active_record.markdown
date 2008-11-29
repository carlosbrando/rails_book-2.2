## ActiveRecord

### Correzioni al conflitto dei namespace tra named\_scope e :joins.

Quando utilizzavate `with_scope` insieme a `:joins`, tutti gli attributi delle tabelle secondarie venivano aggiunti al modello della tabella principale.

### Il metodo find\_all non funziona in named\_scope

Quando eseguivate il metodo `find_all` in un `named_scope`, questo non veniva reindirizzato al metodo `proxy_found` come avrebbe dovuto. Ciò sollevava l'eccezione `NoMethodError`.

	Topic.base.find_all(&:approved)
	# => NoMethodError: undefined method `find_all' for #<Class:0x19a0fb4>

Questo problema poteva essere aggirato utilizzando il metodo `to_a`:

	Topic.base.to_a.find_all(&:approved)
	# => [#<Reply:0x179e720>#<Topic:0x179e388>#<Reply:0x179e20c>]

Nella nuova versione di Rails tale problema è stato risolto.

### I partial update non aggiornavano lock\_version se nulla veniva modificato

Quando utilizzavate il locking ottimistico con i partial update venivano eseguite delle query non necessarie. Questo problema è stato risolto.
