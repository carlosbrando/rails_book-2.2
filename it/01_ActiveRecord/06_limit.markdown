## Opzione :limit come dimensione in byte sulla colonna

A partire da questa versione di Rails l'opzione `:limit` indica la dimesione in byte per colonne di tipo intero, per MySQL e PostgreSQL (su Sqlite già funzionava così).

Il tipo di colonna utilizzata nel database dipende dal numero di byte indicati. Date un'occhiata al seguente codice che determina il tipo di colonna in MySQL:

	when 1; 'tinyint'
	when 2; 'smallint'
	when 3; 'mediumint'
	when nil, 4, 11; 'int(11)' # compatibility with MySQL default
	when 5..8; 'bigint'
	else raise(ActiveRecordError, "No integer type has byte size #{limit}")

E per PostgreSQL:

	when 1..2; 'smallint'
	when 3..4, nil; 'integer'
	when 5..8; 'bigint'
