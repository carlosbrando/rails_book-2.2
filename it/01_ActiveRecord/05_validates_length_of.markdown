## Definire il comportamento di validates\_length\_of

Uno dei tanti metodi di validazione presenti in `ActiveRecord` è `validates_length_of`. Questo particolare metodo ci permette di assicurarci che il valore immagazzinato in una particolare colonna del database abbia una certa lunghezza. Ci permette di indicare una lunghezza massima, una lunghezza minima, una lunghezza esatta, oppure un insieme di lunghezze valide.

"Lunghezza", comunque, è un concetto relativo. Dicendo "lunghezza" (length) ci riferiamo, generalmente, al numero di caratteri presenti in un testo. Ma immaginiamo di avere un campo di un form in cui il limite non è definito dal numero di caratteri, ma dal numero di parole - ad esempio "Scrivi un paragrafo con almeno 100 parole" (un esempio migliore potrebbe essere "Scrivi con commento con non più di 100 parole"). Immaginate una pagina dove un utente deve inserire un breve tema, per esempio.

Prima di Rails 2.2 la nostra unica possibilità era quella di creare un metodo di validazione apposito, ma adesso possiamo personalizzare `validates_length_of` usando l'opzione `:tokenizer`. Il seguente esempio risolve il problema suesposto:

	validates_length_of :essay,
	                    :minimum => 100,
	                    :too_short => "Il suo tema deve contenere almeno 100 parole.",
	                    :tokenizer => lambda {|str| str.scan(/\w+/) }

Questo è solo un esempio di cosa potete fare con questa nuova opzione. Oltre a ciò, potete utilizzarla per contare solamente il numero di cifre inserite, il numero di volte che una certa parola viene ripetuta, etc.
