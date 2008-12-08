## Ora db:migrate:redo accetta la versione delle migration

Il task `rake db:migrate:redo` è sempre stato molto utile per testare e rieseguire le più recenti migration. Ora questo task è ancora più utile, vi permette infatti di indicare attraverso l'opzione `VERSION` quale migrazione volete eseguire di nuovo:

	rake db:migrate:redo VERSION=20080725004631