## Nuove opzioni per il metodo composed\_of

Il metodo `composed_of` dispone di due nuove opzioni: `:constructor` e `:converter`.

L'opzione `:constructor` può ricevere un simbolo con il nome di un metodo, oppure un `Proc`.
Per default, la classe composta viene creata dal metodo `new`, ricevendo tutti gli attributi mappati come parametri, esattamente con l'ordine con cui vengono mappati. Ma, se per qualsiasi motivo, la vostra classe non seguisse tale convenzione, dovreste usare l'opzione `:constructor`.
Questa permette di modificare la modalità con cui la classe viene creata.
Osserviamo il seguente esempio, tratto dalla documentazione di Rails:

	composed_of :ip_address,
	  :class_name => 'IPAddr',
	  :mapping => %w(ip to_i),
	  :constructor => Proc.new { |ip| IPAddr.new(ip, Socket::AF_INET) }

Come potete vedere, prima di creare una nuova istanza della classe `IPAddr`, è necessario fornire un parametro aggiuntivo al costruttore. Utilizzando l'opzione `:constructor` ciò risulta semplice.

Discorso analogo per l'opzione `:converter`, anch'essa accetta un simbolo indicante un metodo nella classe `:class_name`; oppure un `Proc`, e questo viene chiamato quando il valore del campo composto viene assegnato da un'altra istanza e pertanto è richiesta una conversione.
Ecco un esempio:

	composed_of :balance,
	  :class_name => "Money",
	  :mapping => %w(balance amount),
	  :converter => Proc.new { |balance| Money.parse(balance) }

In questo esempio, il metodo `balance=` si aspetterà sempre un'istanza della classe `Money`, ma, se viene passato un altro tipo di oggetto, questo verrà convertito utilizzando il metodo `parse` dell'oggetto `Money`.

Dovreste utilizzare la nuova opzione `:converter` al posto del blocco di conversione previsto dal metodo.