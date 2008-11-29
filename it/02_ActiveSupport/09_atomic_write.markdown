## File.atomic\_write copies the original file's permissions

## File.atomic\_write copia i permessi del file origine

Qualcuno di voi potrebbe avere familiarità con il metodo `File.atomic_write`. Come indica il nome, tale metodo ci assicura che la scrittura di un file sia atomica. E' molto utile in tutte quelle situazioni in cui vogliamo essere certi che altri processi o thread non possano accedere ad un file scritto a metà.

	File.atomic_write("important.file") do |file|
	  file.write("hello")
	end

Tale metodo crea un file temporaneo durante la scrittura, terminata la quale sostituisce il contenuto del vecchio file con il nuovo.

La nuova feature di Rails 2.2 è costituita dal fatto che il nuovo file ha i medesimi permessi del vecchio.
