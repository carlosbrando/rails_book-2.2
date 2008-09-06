## Improved Thin support

`script/server` now checks to see if **Thin** is available and, if so, attempts to use it. This is very convenient if you are using **Thin** in your production environment (and wish to use the same thing for development). You will need to add the following line in your **environment.rb** file for this to work:

	config.gem 'thin'