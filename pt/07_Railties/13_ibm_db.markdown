## Suporte à banco de dados IBM DB no gerador do Rails

Foi adicionado ao generator do Rails a opção IBM DB para o banco de dados. Para usá-la basta executar no terminal o seguinte comando ao criar o projeto Rails:

`rails app_name -d ibm_db`

Isto criará seu projeto com o seguinte arquivo **database.yml**:

	# IBM Dataservers
	#
	# Home Page
	# http://rubyforge.org/projects/rubyibm/
	#
	# To install the ibm_db gem:
	# On Linux:
	# Source the db2profile file and set the necessary environment variables:
	#
	# . /home/db2inst1/sqllib/db2profile
	# export IBM_DB_DIR=/opt/ibm/db2/V9.1
	# export IBM_DB_LIB=/opt/ibm/db2/V9.1/lib32
	#
	# Then issue the command: gem install ibm_db
	#
	# On Windows:
	# Issue the command: gem install ibm_db
	# If prompted, select the mswin32 option
	#
	# For more details on the installation refer to http://rubyforge.org/docman/view.php/2361/7682/IBM_DB_GEM.pdf
	#
	# For more details on the connection parameters below refer to:
	# http://rubyibm.rubyforge.org/docs/adapter/0.9.0/rdoc/classes/ActiveRecord/ConnectionAdapters/IBM_DBAdapter.html

	development:
	  adapter: ibm_db
	  username: db2inst1
	  password:
	  database: app_name_dev
	  #schema: db2inst1
	  #host: localhost
	  #port: 50000
	  #account: my_account
	  #app_user: my_app_user
	  #application: my_application
	  #workstation: my_workstation

	test:
	  adapter: ibm_db
	  username: db2inst1
	  password:
	  database: app_name_tst
	  #schema: db2inst1
	  #host: localhost
	  #port: 50000
	  #account: my_account
	  #app_user: my_app_user
	  #application: my_application
	  #workstation: my_workstation

	production:
	  adapter: ibm_db
	  username: db2inst1
	  password:
	  database: app_name_prd
	  #schema: db2inst1
	  #host: localhost
	  #port: 50000
	  #account: my_account
	  #app_user: my_app_user
	  #application: my_application
	  #workstation: my_workstation
