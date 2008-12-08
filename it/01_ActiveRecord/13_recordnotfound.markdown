## Nuova versione distruttiva dei metodi find di ActiveRecord

I finder dinamici di `ActiveRecord` adesso hanno una controparte "distruttiva" che solleva un eccezione `RecordNotFound` quando l'insieme dei risultati è vuoto, anziché restituire `nil` come nel comportamento originale.

Per utilizzare tali versioni distruttive è sufficiente aggiungere un punto esclamativo alla fine del nome del metodo. Ecco un esempio:

	Topic.find_by_title!("The First Topic!")
	# => ActiveRecord::RecordNotFound
