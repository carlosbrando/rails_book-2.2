## Correção nas tarefas db:migrate:down e :up

Quando se usava o comando **rake db:migrate:down VERSION=alguma\_versão**, os registros na tabela **schema\_migrations** não eram atualizados.

Isto significa que após usar o comando **rake db:migrate:down** ou **up** se você rodar o comando **rake db:migrate** algumas **migrations** podem não ser executadas. Vamos simular isto para ficar fácil de entender o problema:

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

Este problema foi corrigido ao se certificar de atualizar a tabela **schema\_migrations** após a execução destas tarefas.
