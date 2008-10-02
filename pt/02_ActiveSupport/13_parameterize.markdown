## Edge Rails: Inflector#parameterize simplifica a criação de URLs elegantes

Um novo inflector foi incluído no Rails, e particularmente acho este é muito útil. O `parameterize` transforma um texto qualquer em um formato ideal para o uso em URLs. Por exemplo:

Model:

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

Um fato interessante é que logo de inicio a implementação feita não aceitava o uso de caracteres acentuados, o que significava um problema para muita gente ao redor do mundo, inclusive nós brasileiros. Mas um dia depois da primeira implementação, Michael Koziarski salvou nossas vidas incluindo este suporte.

Para aqueles que ainda não estão fazendo uso do Rails 2.2, recomendo o plugin [slugalizer](http://github.com/henrik/slugalizer/tree/master) criado por Henrik Nyh.
