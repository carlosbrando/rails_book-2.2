## La méthode File.atomic\_write reproduit les permissions du fichier d'origine

La méthode `File.atomic_write` vous est peut-être familière. Elle garantit que les écritures dans le fichier sont atomiques. Elle peut être très utile dans les situations où les autres processus ne doivent pas voir d'écritures partielles dans le fichier.

	File.atomic_write("important.file") do |file|
	  file.write("hello")
	end

Cette méthode écrit dans un nouveau fichier temporaire qui remplace le fichier d'origine quand l'écriture est terminée.

Dans Rails&nbsp;2.2 cette méthode reproduit les permissions du fichier d'origine sur le nouveau fichier.
