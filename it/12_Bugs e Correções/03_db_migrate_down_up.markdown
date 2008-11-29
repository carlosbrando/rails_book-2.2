## Correzione ai task db:migrate:down e db:migrate:up

Nelle precedenti versioni di Rails, quando lanciavate `rake db:migrate:down VERSION=some_version_number` i record nella tabella **schema\_migrations** non venivano aggiornati.

Questo comportava che dopo aver eseguito `rake db:migrate:down` o `up`, se aveste provato ad eseguire `rake db:migrate` alcune migrazioni non sarebbero state eseguite. Lasciateci mostrare il problema:

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

Questo problema è stato corretto facendo in modo che la tabella **schema\_migrations** venga aggiornata con certezza dopo avere eseguito i questi task.
