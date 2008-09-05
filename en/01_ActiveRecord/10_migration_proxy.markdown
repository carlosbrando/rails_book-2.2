## MigrationProxy

Imagine that, after running a number of migrations, a certain model gets renamed. Now imagine that, before this takes place, another migration tries to refer to this model. Because all migrations used to get loaded regardless of whether they would be executed or not, this situation would cause an ugly error and halt execution of migrations.

To avoid this problem, a new class called `MigrationProxy` has been created, which stores the name, version and filename of each migration, and uses this information to load migrations only when necessary, so they don't all get loaded at the same time.