## Introduction de Memoizable pour cacher les attributs

La performance est importante, et le cache est l'une des méthodes les plus utilisées pour augmenter la vitesse. Vous avez déjà dû écrire ce genre de code :

	class Person < ActiveRecord::Base
	  def age
	    @age ||= calcul_tres_complexe
	  end
	end

Dans cette version de Rails, nous avons une manière de faire plus élégante grâce à la méthode `memoize` (c'est vraiment `memoize` et pas **memorize**). Modifions l'exemple ci-dessus pour profiter de cette nouvelle fonctionnalité.

	class Person < ActiveRecord::Base
	  def age
	    calcul_tres_complexe
	  end
	  memoize :age
	end

La méthode `age` sera exécutée une seule fois et la valeur renvoyée sera stockée en mémoire et retournée lors des invocations futures de la méthode.

Mais il y a une différence entre les deux exemples. Dans le premier, comme la méthode est appelée si la valeur d'`@age` est `nil` ou `false`, le calcul très complexe sera ré-exécuté jusqu'à ce qu'on ait l'âge de la personne. 

Dans le second exemple, la méthode `age` sera exécutée une seule fois et la valeur stockée sera toujours retournée même si c'est `nil` ou `false`.

Si vous voulez désactiver ou réactiver le cache des attributs, vous pouvez utiliser les méthodes `unmemoize_all` et `memoize_all` :

	@person = Person.first

	# Pour arrêter de cacher la méthode age
	@person.unmemoize_all

	# Pour recommencer à cacher la méthode age
	@person.memoize_all
