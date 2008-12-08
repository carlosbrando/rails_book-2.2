## StringInquirer

Una nuova classe, `StringInquirer`, è stata aggiunta a Rails.

Per comprenderne il funzionamento, è necessario fare un esempio. Creiamo una classe `Client`, che contiene un metodo che restituisce lo `status` di un client:

	class Client
	  def status
	    "active"
	  end
	end

	c = Client.new
	c.status
	# => "active"

	c.status == "active"
	# => true

	c.status == "inactive"
	# => false

Fin qui nulla di strano. Adesso modifichiamo l'implementazione del metodo `status` utilizzando la classe  `StringInquirer`. Ricordiamo che il valore restituito da `status` generalmente proviene da una colonna del database (ovviamente) &mdash; questo è solo un esempio:

	class Client
	  def status
	    ActiveSupport::StringInquirer.new("active")
	  end
	end

	c = Client.new
	c.status
	# => "active"

	# Notate la differenza:
	c.status.active?
	# => true

	c.status.inactive?
	# => false

Per verificare che lo `status` del client, anziché confrontare `String` utilizziamo un metodo con il valore dello status ed un punto interrogativo.

L'uso di questa tecnica è già stato introdotto in Rails stesso. Ad esempio, se occorre verificare che Rails sia attivo sull'ambiente di produzione, è sufficiente rimpiazzare il vecchio `Rails.env == "production"` con:

	Rails.env.production?
