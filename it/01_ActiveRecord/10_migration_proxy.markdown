## MigrationProxy

Supponiamo che dopo avere eseguito un certo numero di migrazioni, un determinato modello venga rinominato. Ora supponiamo che, prima che ciò avvenga, un'altra migrazione faccia riferimento a tale modello. Poiché tutte le migrazioni vengono caricate indipendentemente dal fatto che vengano eseguite o meno, questa situazione causerebbe un errore e bloccherebbe l'esecuzione delle migrazioni stesse.

Per arginare tale problema è stata introdotta una nuova classe chiamata `MigrationProxy`, la quale conserva il nome, la versione ed il nome del file di ciascuna migrazione. Quindi utilizza questa informazione per caricare le migrazioni solamente quando necessario, in tal modo non vengono caricate tutte insieme.
