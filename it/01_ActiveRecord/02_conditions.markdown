## Nuovi metodi per indicare conditions con un Hash

Nell'utilizzare le query sul database, spesso vi potreste trovare nella condizione di usare l'opzione `:join`, sia per migliorare le performance dell'applicazione, sia per necessità di recuperare informazioni dipendenti da risultati su più tabelle.

Per esempio, se voleste recuperare tutti gli utenti che hanno acquistato articoli rossi, dovreste utilizzare una query del genere:

	User.all :joins => :items, :conditions => ["items.color = ?", 'red']

Questa sintassi è poco gradevole, dal momento che dovete includere il nome di una tabella (**items** nel nostro caso) all'interno di una stringa.

In Rails 2.2 esiste un nuovo metodo per fare ciò, ovvero utilizzando una chiave di un hash per identificare la tabella:

	User.all :joins => :items, :conditions => {
	  :age => 10,
	  :items => { :color => 'red' }
	}

	# un ulteriore esempio per rendere il codice più comprensibile
	User.all :joins => :items, :conditions => {
	  :users => { :age => 10 },
	  :items => { :color => 'red' }
	}

E' nostra opinione che in questo modo il codice appare molto più leggibile, specialmente quando avete bisogno di indicare condizioni su più campi di diverse tabelle.

Non dimenticate che la chiave utilizzata è il nome plurale della tabella (o un alias, se lo avete utilizzato nella query).
