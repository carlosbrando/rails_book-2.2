## Ajout de l'option :limit à update\_all

La méthode `update_all` accepte maintenant l'option `:limit`. Très utile, car elle garantit que les choses fonctionneront encore après l'usage d'`update_all` dans les associations `has_many` qui utilisent l'option `:limit`.

