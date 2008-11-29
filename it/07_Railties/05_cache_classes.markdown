## Ora cache\_classes è abilitato per default

Nei file di configurazione del vostro progetto c'è sicuramente la seguente linea di codice:

	config.cache_classes = false

In pratica dice a Rails di non mettere in cache il codice del vostro progetto; ovvero, per ogni richiesta dei client deve ricaricare nuovamente tutto il codice. Benché ciò rallenti l'esecuzione, è ideale in fase di sviluppo perché vi evita di dover far ripartire il server ad ogni modifica che fate sul codice.

In produzione, al contrario, è cruciale abilitare tale opzione.

In Rails 2.1 se la precedente linea di codice non era presente nel vostro file di configurazione, Rails assume di non dover metter in cache le classi &mdash; questo per default.

In Rails 2.2 tale comportamento è stato invertito; se non viene trovata questa opzione di configurazione allora tutte le classi vengono messe in cache. Ciò aiuta gli utenti Rails meno esperti a non installare i propri progetti con la modalità di sviluppo.
