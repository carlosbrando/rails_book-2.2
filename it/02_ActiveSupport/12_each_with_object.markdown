## Nuovo metodo: each\_with\_object

Il nuovo metodo `each_with_object`, presente in Ruby 1.9, è stato aggiunto a Rails nel caso in cui non venisse eseguito in Ruby 1.9. Questo metodo è molto interessante. E' molto simile al ben noto metodo `inject`, ma con una sottile differenza. Ogni iterazione, oltre a ricevere un elemento dalla collezione, riceve anche un oggetto chiamato **memo**.

Ad esempio, supponiamo di voler riempire un hash con i valori provenienti da una collezione:

	%w(first second third).each_with_object({}) do |str, hash|
	  hash[str.to_sym] = str
	end
	# => {:second=>"second", :first=>"first", :third=>"third"}

Notiamo che nel precedente esempio l'oggetto memo è un hash vuoto (`{}`). All'interno del blocco popoliamo l'hash con gli item provenienti dalla collezione.

Fate attenzione al fatto che non dovreste utilizzare oggetti immutabili per la variabile memo, come numeri, `true` e `false`. Il codice seguente restituisce sempre 1, poiché il numero 1 (oggetto *memo*) non può essere modificato:

	(1..5).each_with_object(1) { |value, memo| memo *= value } # => 1
