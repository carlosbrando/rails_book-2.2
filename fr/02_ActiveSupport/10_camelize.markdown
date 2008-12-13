## camelize(:lower)

Par défaut la méthode `camelize` sert à convertir une chaîne de caractères au format **UpperCamelCase**, c'est-à-dire que le premier mot de la chaîne aura une majuscule comme tous les morts suivants. Il est aussi possible de convertir une chaîne en **lowerCamelCase** (premier mot avec une minuscule initiale et mots suivants avec une majuscule) avec l'argument `:lower`. Mais si vous essayez le code suivant en Rails&nbsp;2.1.1 ou antérieur :

	'Capital'.camelize(:lower)
	# => "Capital"

La première lettre n'est pas une minuscule. Ceci a été corrigé ; voici le résultat en Rails&nbsp;2.2 :

	'Capital'.camelize(:lower)
	# => "capital"
