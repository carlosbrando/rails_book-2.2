## Aggiunta di Memoizable per il caching degli attributi

Le performance sono importanti, e uno dei metodi più usati per migliorare la velocità di esecuzione del codice è il caching. Avrete probabilmente scritto codice del genere:

	class Person < ActiveRecord::Base
	  def age
	    @age ||= a_very_complex_calculation
	  end
	end

Con la nuova versione di Rails abbiamo un metodo più elegante per ottenere ciò, ovvero utilizzando il metodo `memoize` (è effettivamente `memoize` e non **memorize**). Riscriviamo l'esempio precedente utilizzando la nuova funzionalità:

	class Person < ActiveRecord::Base
	  def age
	    a_very_complex_calculation
	  end
	  memoize :age
	end

Il metodod `age` verrà eseguito solo la prima volta, e il suo valore di ritorno sarà salvato in memoria e successivamente recuperato per le future chiamate allo stesso metodo.

C'è solo una differenza tra i due esempi precedenti. Nel primo caso, dal momento che il metodo viene sempre eseguito se il valore presente in `@age` è `nil` o `false`, il complesso calcolo (indicato con `a_very_complex_computation`) viene eseguito nuovamente. Nel secondo esempio il metodo `age` viene eseguito solamente una volta, ed il valore di ritorno viene restituito sempre, per ogni chiamata futura (anche se è `nil` o `false`).

Se avete bisogno di disabilitare o abilitare nuovamente il caching degli attributi memoized, potete utilizzare i metodi `unmemoize_all` a `memoize_all`:

	@person = Person.first

	# Per disabilitare il caching del metodo age
	@person.unmemoize_all

	# Per abilitare nuovamente il cachind del metodo age
	@person.memoize_all
