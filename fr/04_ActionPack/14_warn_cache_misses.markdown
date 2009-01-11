## Recevoir des warnings au sujet de la performance

Rails a un nouveau paramètre qui contrôle l'émission des warnings dans le cas où il restitue un template situé hors des répertoires de vues. C'est une bonne chose car les fichiers hors des répertoires de vues ne sont pas stockés dans le cache, ce qui se traduit par plus d'accès disque.

Pour recevoir ces warnings, ajoutez la ligne suivante dans votre **environment.rb**&nbsp;:

	config.action_view.warn_cache_misses = true

Ceci fait, le message suivant apparaîtra si un template situé hors des répertoires de vues est restitué.

`[PERFORMANCE] Rendering a template that was
not found in view path. Templates outside the view path are
not cached and result in expensive disk operations. Move this
file into /Users/user/project/app/views or add the folder to your
view path list`

Cette option est désactivée par défaut.