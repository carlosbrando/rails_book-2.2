## Un ulteriore finder dinamico

In aggiunta agli esistenti finder di `ActiveRecord`, adesso abbiamo anche `find_last_by`. Gli altri sono `find_by` e `find_all_by`.

Oltre ad essere semplice, ciò offre un modo molto più elegante per recuperare - ad esempio - l'ultimo commento fatto da un determinato utente. Esempio:

	Comment.find_last_by_author("Carlos Brando")
	
		# è equivalente a
	
	Comment.last(:conditions => { :author => "Carlos Brando" })