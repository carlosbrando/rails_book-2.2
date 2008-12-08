## Pool di connessione in Rails

Uno dei problemi riscontrati da un certo numero di sviluppatori su Rails è relativo alla sua lentezza. Sappiamo bene che non è oggettivamente vero, ma sappiamo anche che molto potrebbe essere fatto per migliorare le performance di Rails.

E qualcosa è stato fatto. Un **pool di connessione** al database è stato aggiunto a Rails.

Ogni volta che viene effettuata una query al database viene sprecato del tempo per aprire una nuova connessione prima che i dati possano essere letti/salvati. A prima vista ciò potrebbe sembrare banale, ma aprire una connessione verso il database non è semplice. Infatti è necessario aprire una connessione di rete con il database server, autenticarsi, e effettuare un certo numero di verifiche. Tutto ciò richiede tempo e risorse. Dopo aver create tale connessione, Rails la utilizza per ogni richiesta effettuata verso il database, e query pesanti possono rallentare l'esecuzione di altre query. Ciò dimostra come il database possa spesso diventare il tallone di Achille per alcune progetti Rails di grandi dimensioni (o con elevati carichi, NdT).

La soluzione a tale problema consiste nel riutilizzare le connessioni precedentemente create, facendogli eseguire più task prima di essere chiuse. Ovvero, in termini più tecnici, necessitiamo di un connection pool.

In pratica funziona così: una connessione al database viene creata in modo tale da poter eseguire una query. Quindi, anziché chiuderla, viene salvata in un connection pool. Quando deve essere eseguita un'altra query il sistema recupera la connessione precedentemente salvata, riducendo in questo modo il tempo e le risorse richieste per terminare il task in esecuzione. Diverse connessioni possono essere salvate nel pool contemporaneamente, e le richieste vengono distribuite tra di esse. Questo significa che una query lenta può tranquillamente essere in esecuzione sul database mentre l'applicazione continua a ricevere richieste e ad eseguire query utilizzando le altre connessioni presenti nel pool.

In Rails, un nuovo pool viene creato ogni volta che il metodo `establish_connection` viene invocato. In altri termini, ogni database presente in **database.yml** avrà i propri connection pool.

Il pool, inizialmente vuoto, cresce finché non raggiunge il limite di default di cinque connessioni, ma è possibile aumentare tale valore aggiungendo l'opzione `pool` nella configurazione del database:

	development:
	  adapter: mysql
	  host: localhost
	  username: myuser
	  password: mypass
	  database: somedatabase
	  pool: 10
	  wait_timeout: 15

Se non è disponibile nessuna connessione, il thread attenderà una connessione libera per cinque secondi (valore di default) prima di andare in time out. Anche tale periodo di attesa può essere configurato aggiungendo l'opzione `wait_timeout` alla configurazione del database.

Se volete utilizzare i connection pool fuori da `ActionPack`, esiste un altro metodo chiamato `ActiveRecord::Base.connection_pool`, il quale vi permette di gestire manualmente la prenotazione (checking out) ed il rilascio (cheching in) delle connessioni presenti nel pool. Non dimenticate di rilasciare una connessione una volta terminato il suo uso, affinché possa essere riutilizzata da altre richieste.

	connection = ActiveRecord::Base.connection_pool.checkout
	# eseguire query sul database
	ActiveRecord::Base.connection_pool.checkin(connection)

Potete anche utilizzare il metodo `ActiveRecord::Base.connection_pool.with_connection`, il quale esegue il checkout/checkin per voi, rendendo il codice leggermente più sicuro.

	ActiveRecord::Base.connection_pool.with_connection do |connection|
	  # eseguire query sul database
	end
