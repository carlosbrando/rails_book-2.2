## Migrations transactionnelles avec PostgreSQL

Quand une migration est exécutée et qu'une erreur se produit, tout ce qui a déjà été exécuté est appliqué à la base et ce qui suit l'erreur n'est pas appliqué. De plus, la migration sera marquée comme faite. C'est un casse-tête à réparer.

Mais si la base que vous utilisez supporte les transactions avec **DDL rollbacks**, il devient possible de les utiliser pour annuler tous les changements appliqués avent l'erreur. Malheureusement, tous les moteurs de base de données ne comportent pas cette fonction. MySQL, par exemple, n'en dispose pas. 

Mais PostgreSQL, SQL Server et d'autres en disposent.

Rails permet maintenant l'utilisation des transactions dans les migrations pour les bases de données qui les supportent. Bien que Rails le permette, l'adaptateur de base de données doit être modifié (sa méthode `supports_ddl_transactions?` doit simplement renvoyer `true`) pour pouvoir les utiliser. À ce jour, seul l'adaptateur PostgreSQL semble avoir été mis à jour.
