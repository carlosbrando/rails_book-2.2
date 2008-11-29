## Indicare differenti primary\_key nelle associazioni

Una nuova opzione, chiamata `:primary_key`, è stata agiunta ai metodi `has_many` e `has_one`.

Utilizzando questa opzione potete quale metodo e modello associato restituisce la chiave primaria che sarà utilizzata nell'associazione. Ovviamente la chiave primaria standard rimane `id`.

Osservate il seguente esempio:

	has_many :clients_using_primary_key, :class_name => 'Client',
		:primary_key => 'name', :foreign_key => 'firm_name'

Il metodo `has_one` si comporta esattamente allo stesso modo.