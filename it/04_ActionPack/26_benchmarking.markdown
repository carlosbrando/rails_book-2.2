## Report dei benchmarking in millisecondi

Tutti i messaggi di log che mostrano il tempo speso da un processo per la sua esecuzione sono stati modificati affinché visualizzino il tempo in millisecondi.

Ad esempio, il messaggio:

	"Completed in 0.10000 (4 reqs/sec) | Rendering: 0.04000 (40%) | DB: 0.00400 (4%) | 200 OK"

verrà adesso mostrato così:

	"Completed in 100ms (View: 40, DB: 4) | 200 OK"
