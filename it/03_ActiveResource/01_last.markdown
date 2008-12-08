## Recuperare l'ultimo record da ActiveResource

Seguendo le convenzioni di `ActiveRecord` anche il metofo find di `ActiveResource` ora accetta l'opzione `:last`:

	Person.find(:last, :from => :managers)
	# => GET /people/managers.xml

Potete utilizzarla per recuperae l'ultimo oggetto presente in una collezione di resource.
