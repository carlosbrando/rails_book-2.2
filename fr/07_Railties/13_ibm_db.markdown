## Support for IBM DB in the Rails generator

An option has been added to Rails that allows you to generate a project with IBM DB support. To create a Rails project with this option, just run the following command in your terminal:

`rails app_name -d ibm_db`

This will create your project with the following text in your **database.yml** file:

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