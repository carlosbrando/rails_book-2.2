## MigrationProxy

Supposons qu'après avoir écrit un certain nombre de migrations, vous renommiez un modèle, et que de plus une migration ultérieure y fît référence. Comme toutes les migrations étaient chargées en mémoire, qu'elles dussent être exécutées ou non, vous aviez un crash.

La classe `MigrationProxy` a été créée pour éviter ce problème. Elle stocke le nom, la version et le nom de fichier de chaque migration, et utilise ces informations pour ne charger que les migrations nécessaires et non plus toutes à la fois.
