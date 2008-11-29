## threadsafe!

Ora Rails ha un nuovo metodo di configurazione per abilitare la modalità multithread:

	config.threadsafe!

Quando questo metodo è presente nei vostri file di configurazione (generalmente in **environments/production.rb**) abilitate le azioni dei vostri controller ad accettare più richieste contemporaneamente, utilizzando più connessioni al database. Dipendentemente dalla vostra applicazione, e dall'ambiente di esercizio, ciò permette di gestire più richieste poiché meno copie di Rails vengono caricate in memoria (lasciandola, quindi, libera - NdT).

Tutto ciò, inoltre, disabilita il caricamento post-istallazione delle dipendenze. Per maggiori informazioni fate riferimento al capitolo "Abilitare e disabilitare il caricamento delle dipendenze" nel capitolo **ActiveSupport**.
