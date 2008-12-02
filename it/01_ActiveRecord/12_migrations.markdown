## Migrazioni con transazioni in PostgreSQL

Quando una migrazione viene eseguita e si manifesta un errore, solamente il codice prima dell'errore viene eseguito sul database. Dopo ciò, la migrazione viene considerata terminata. Risolvere tali errori può causare un autentico mal di pancia.

Ma se il database (DBMS, NdT) che state utilizzando supporta i **rollbacks DDL** nelle transazioni, allora è possibile sfruttare questa feature per "disfare" tutti i cambiamenti fatti prima dell'errore. Il problema è che non tutti i motori di database supportano questa feature. MySQL, ad esempio, non la supporta. Ma PostgreSQL, SQL Server ed alcuni altri sì.

Rails è stato aggiornato per permettere l'uso delle transazioni nelle migrazioni, per i database che le supportano. Sebbene Rails suppporti tale feature, il database adapter deve essere aggiornato (semplicemente facendo in modo che il metodo `supports_ddl_transactions?` restituisca `true`) per poterla utilizzare. Nel momento in cui tale libro veniva pubblicato, solamente l'adapter per PostgreSQL supportava tale feature.
