## Treating the :limit option as column byte size

Starting with this version of Rails, the :limit option specifies byte size on integer columns for MySQL and PostgreSQL (on Sqlite it works this way already).

The type of column used in the database depends on the number of bytes specified. Take a look at the code snippet that determines the column type in MySQL:

	when 1; 'tinyint'
	when 2; 'smallint'
	when 3; 'mediumint'
	when nil, 4, 11; 'int(11)' # compatibility with MySQL default
	when 5..8; 'bigint'
	else raise(ActiveRecordError, "No integer type has byte size #{limit}")

And for PostgreSQL:

	when 1..2; 'smallint'
	when 3..4, nil; 'integer'
	when 5..8; 'bigint'
