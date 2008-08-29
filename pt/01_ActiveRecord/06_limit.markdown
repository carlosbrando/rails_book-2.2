## Tratando a opção :limit como bytes

À partir desta versão do Rails quando usarmos a opção **:limit** para colunas com números inteiros, em nossas migrations, estaremos nos referindo ao número de bytes, no MySQL e no PostgreSQL (no sqlite sempre foi assim).

O tipo da coluna no banco de dados dependerá da quantidade de bytes espeficida. Veja o trecho de código que identifica o tipo da coluna para o MySQL:

	when 1; 'tinyint'
	when 2; 'smallint'
	when 3; 'mediumint'
	when nil, 4, 11; 'int(11)' # compatibility with MySQL default
	when 5..8; 'bigint'
	else raise(ActiveRecordError, "No integer type has byte size #{limit}")

E para o PostgreSQL:

	when 1..2; 'smallint'
	when 3..4, nil; 'integer'
	when 5..8; 'bigint'
