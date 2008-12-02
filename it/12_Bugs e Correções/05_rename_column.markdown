## Bug corretto in rename\_column

Questa modifica consiste in una correzione del metodo `rename_column`. Per comprendere quale sia il problema, prendiamo uno scenario di esempio. Anzitutto, creiamo una **migration**:

	create_table "users", :force => true do |t|
	  t.column :name, :string, :default => ''
	end

Quindi creiamo una seconda **migration** che rinomini la colonna **name**:

	rename_column :users, :name, :first_name

Se provate questo esempio, noterete che una volta eseguito il metodo `rename_column`, la "nuova" colonna `first_name` non ha più il valore di default assegnato nella prima **migration**, come invece dovrebbe.

Questo bug è stato corretto nella corrente versione di Rails.
