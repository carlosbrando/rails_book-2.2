## Pretty URLs facili con Inflector#parameterize

E' stato aggiunto un nuovo inflector, che troviamo particolarmente utile. Il metodo `parametrize` rende ogni testo "URL friendly". Osserviamo il seguente esempio:

Modello:

	class User
	  def to_param
	    "#{id}-#{name.parameterize}"
	  end
	end

Controller:

	@user = User.find(1)
	# => #<User id: 1, name: "Carlos E. Brando">

View:

	link_to @user.name, user_path
	# => <a href="/users/1-carlos-e-brando">Carlos E. Brando</a>

E' interessante notare come l'implementazione iniziale di questa feature non funzionava correttamente con le lettere accentate, un bel problema per molte persone sparse sul globo.
Un giorno Michael Koziarski ha aggiunto tale supporto. Nonostante ciò, il codice non era ancora perfezionato, così l'eccellente plugin [slugalizer](http://github.com/henrik/slugalizer/tree/master), creato da Henrik Nyh, è stato utilizzato a tale scopo. Ora funziona correttamente!

Tutti coloro che ancora non utilizzano Rails 2.2 possono avvalersi del plugin slugalizer.