##  Nuova opzione :from per i metodi di calcolo in ActiveRecord

Una nuova opzione è stata aggiunta nei metodi di calcolo di `ActiveRecord` (`count`, `sum`, `average`, `minimum` e `maximum`).

Quando utilizzate l'opzione `:from` potete fare l'override del nome della tabella generata dalla query `ActiveRecord`, il che non sembra molto utile ad un primo sguardo, ma la cosa interessante è che vi permette di forzare MySQL ad utilizzare uno specifico indice per il calcolo.

Vediamo qualche esempio:

	# Forza MySQL ad utilizzare un index per un calcolo
	Edge.count :all, :from => 'edges USE INDEX(unique_edge_index)',
	           :conditions => 'sink_id < 5')

	# Effettua il calcolo in una tabella della classe associata
	Company.count :all, :from => 'accounts'