## Correction to the db:migrate:down and :up tasks

In previous versions of Rails, when you ran `rake db:migrate:down VERSION=some_version_number`, the records in the **schema\_migrations** table were not updated.

This meant that after you ran `rake db:migrate:down` or `up`, if you ran `rake db:migrate`, some **migrations** might not be executed. Allow me to demonstrate the problem:

	$ ./script/generate migration test_migration
	      create  db/migrate
	      create  db/migrate/20080608082216_test_migration.rb

	$ rake db:migrate
	(in /Users/erik/projects/railstest)
	== 20080608082216 TestMigration: migrating ====================================
	-- create_table("foo")
	   -> 0.0137s
	== 20080608082216 TestMigration: migrated (0.0140s) ===========================

	$ rake db:migrate:down VERSION=20080608082216
	(in /Users/erik/projects/railstest)
	== 20080608082216 TestMigration: reverting ====================================
	-- drop_table("foo")
	   -> 0.0139s
	== 20080608082216 TestMigration: reverted (0.0144s) ===========================

	$ rake db:migrate
	(in /Users/erik/projects/railstest)

	$

This problem has been corrected by making sure that the **schema\_migrations** table gets updated after running these tasks.