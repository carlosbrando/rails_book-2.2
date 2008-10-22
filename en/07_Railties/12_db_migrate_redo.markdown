## db:migrate:redo now accepts a migration version

The `rake db:migrate:redo` task has been very useful for testing and re-executing the most recent migration. This task is now even more useful, allowing you to specify a `VERSION` option and tell it which migration you want to run again:

	rake db:migrate:redo VERSION=20080725004631