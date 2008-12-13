## Inflector#parameterize facilite la création d'URL clairs

Un nouvel inflecteur que je trouve particulièrement utile a été ajouté à Rails. La méthode `parameterize` transforme un texte quelconque en un format idéal pour l'utilisation comme URL. Par exemple :

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

Incidemment, cette méthode ne fonctionnait pas avec les caractères accentués, ce qui était un problème pour beaucoup de monde autour du globe. Le lendemain de la mise en service, Michael Koziarski nous a sauvés en les ajoutant. Malgré cela, le code n'était pas parfait, et le code du *plugin* [slugalizer](http://github.com/henrik/slugalizer/tree/master) créé par Henrik Nyh a été utilisé. Maintenant c'est parfait !

Ceux qui n'utilisent pas Rails&nbsp;2.2 peuvent utiliser le *plugin*.
