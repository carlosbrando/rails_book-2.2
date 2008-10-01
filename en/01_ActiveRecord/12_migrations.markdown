## Transactional migrations in PostgreSQL

When a migration is executed and an error occurs, only the code before the error actually gets applied to the database. Besides this, the migration will be marked as finished. Fixing this can be a headache.

But if the database you're using supports **DDL rollbacks** in transactions, it becomes possible to use this feature to undo all the changes that were made before the error. The problem is that not all database engines support this feature. MySQL, for example, doesn't. But PostgreSQL, SQL Server and other database engines do.

Rails has been updated to allow the use of transationcs in migrations for databases that support it. Although Rails supports this feature, the database adapter must be updated (by simply causing the `supports_ddl_transactions?` method to return `true`) to be able to use it. As of this book's release, only the **PostgreSQL** adapter appears to have been updated.