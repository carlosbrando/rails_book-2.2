## Changements dans la méthode concat

Si vous avez l'habitude d'éviter les répétitions dans les vues en créant des helpers, vous avez sûrement utilisé la méthode `concat`. Si vous ne l'avez jamais employée, c'est l'équivalent de `puts` pour les vues.

L'implémentation actuelle accepte deux paramètres, une chaîne de caractères (`String`) avec le texte à afficher et un autre paramètre appelé `binding`. Grâce à certaines améliorations apportées au code, l'argument `binding` n'est plus nécessaire bien qu'il soit encore accepté.  Cet argument est *deprecated*, c'est-à-dire que vous recevrez un warning sous Rails 2.2 si vous l'utilisez. Le paramètre sera supprimé dans une prochaine version de Rails.

Le message d'alerte est le suivant&nbsp;: "The binding argument of #concat is no longer needed. Please remove it from your views and helpers."