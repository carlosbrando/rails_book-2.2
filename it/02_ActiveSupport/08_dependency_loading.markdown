## Abilitare e disabilitare il caricamento delle dipendenze

Un nuovo parametro di inizializzazione è stato aggiunto per permettervi di abilitare/disabilitare il caricamento di nuove classi durante una richiesta. 

	config.dependency_loading = true
	# oppure
	config.dependency_loading = false

Se `dependency_loading` è `true`, durante una richiesta Rails caricherà in memoria ogni classe che non è stata già caricata durante l'inizializzazione. Se è `false`, queste classi vengono ignorate.

Se volete eseguire il vostro progetto in un ambiente multithread dovreste disabilitare tale opzione e caricare tutte le classi attraverso l'"eager loading", oppure utilizzare il metodo `require` durante l'inizializzazione del sistema.
