## Définir le critère de comptage de validates\_length\_of

`validates_length_of` est l'une des nombreuses méthodes de validation d'`ActiveRecord`. Celle-ci vérifie que la valeur stockée dans la base a une certaine longueur. Vous pouvez spécifier une longueur minimum, maximum, exacte ou même un intervalle de longueurs.

Mais le concept de longueur est relatif; il s'agit souvent du nombre de caractères du texte. Mais imaginez le cas où la limite d'un champ de formulaire n'est pas définie en caractères mais en mots, comme "rédigez un paragraphe de 100 mots au moins", par exemple dans une page où l'utilisateur doit saisir une rédaction.

Avant Rails&nbsp;2.2, il aurait fallu créer une méthode de validation personnalisée, mais maintenant vous pouvez personnaliser `validates_length_of` avec l'option `:tokenizer`. L'exemple suivant résout le problème énoncé :

	validates_length_of :essay,
	                    :minimum => 100,
	                    :too_short => "Votre paragraphe doit comporter %d mots au moins."),
	                    :tokenizer => lambda {|str| str.scan(/\w+/) }

Ce n'est qu'un exemple de ce que vous pouvez faire avec cette nouvelle option. Vous pourriez aussi l'utiliser pour ne compter que les chiffres, le nombre de fois qu'un mot est utilisé, etc.
