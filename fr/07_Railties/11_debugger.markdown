## Debugging in the Rails console

Just like you can run Rails with the debugger option using `script/server --debugger`, you can now do it in the console, using `script/console --debugger`. This option pretty much just loads the **ruby-debug** library when the console is initialized.

It's easier to use this option than to have to run `require 'ruby-debug'` in the console every time you need this feature.