## camelize(:lower)

Per default, il metodo `camelize` viene utilizzato in Rails per convertire una stringa nel formato **UpperCamelCase**, ovvero in cui la prima parola della stringa - al pari delle successive parole - ha la prima lettera maiuscola. Ora è possibile convertire una stringa nel formato **lowerCamelCase** (la prima parola in minuscolo, le successive hanno solamente la prima lettera in maiuscolo) utilizzando l'argomento `:lower`. In ogni caso, se nella precedente versione di Rails provaste ad eseguire il seguente codice:

	'Capital'.camelize(:lower)
	# => "Capital"

la prima lettera non sarebbe minuscola. Ciò è stato corretto. Il medesimo codice eseguito in Rails 2.2 produrrebbe:

	'Capital'.camelize(:lower)
	# => "capital"
