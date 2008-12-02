## Nuove opzioni per le associazioni: :validate

In Rails è stata aggiunta una nuova opzione per le associazioni. L'opzione `:validate` viene utilizzata per abilitare/disabilitare sugli oggetti associati al modello. Esempio:

	class AuditLog < ActiveRecord::Base
	  belongs_to :developer, :validate => false
	end

	log = AuditLog.create(:developer_id => 0 , :message => "")
	log.developer = Developer.new

	puts log.developer.valid?
	# => false

	puts log.valid?
	# => true

	puts log.save
	# => true

Come potete vedere nell'esempio, benché l'oggetto associato (`Developer`) non sia valido, l'oggetto principale (`AuditLog`) viene salvato nel database. Questo non costituiva il normale comportamento nelle precedenti versioni di Rails, dove un oggetto padre veniva salvato solo se tutti i suoi oggetti figli erano validi.

Sebbene nel precedente esempio abbiamo disabilitato la validazione per dimostrare il funzionamento della nuova feature, in Rails 2.2 il valore di default per `:validate` è impostato a `false`. Quindi `:validate => false` non sarebbe stato necessario nel codice precedente. D'altra parte, se volete avere il vecchio comportamento, è necessario specificare `:validate => true`.
