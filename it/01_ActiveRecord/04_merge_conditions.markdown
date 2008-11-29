## Il metodo merge\_conditions in ActiveRecord è ora pubblico

Il metodo `merge_conditions` in `ActiveRecord` è ora un metodo pubblico, il che significa che sarà disponibile in tutti i vostri modelli.

Questo metodo fa esattamente quello che dice &mdash; vi permette di specificare più `conditions` che vengono combinate in una singola condizione.

	class Post < ActiveRecord::Base
	end

	a = { :author => 'Carlos Brando' }
	b = [ 'title = ?', 'Edge Rails' ]

	Post.merge_conditions(a, b)
	# => "(\"posts\".\"author\" = 'Carlos Brando') AND (title = 'Edge Rails')"

Notate che `conditions` unisce sempre con un **AND**.