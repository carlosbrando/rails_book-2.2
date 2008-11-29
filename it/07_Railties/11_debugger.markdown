## Debugging nella console Rails

Come potete far partire Rails con il debugger, attraverso `script/server --debugger`, lo stesso potete fare con la console: `script/console --debugger`. Questa opzione carica la libreria **ruby-debug** quando la console viene inizializzata.

E' più semplice utilizzare tale opzione anziché dovere digitare `require 'ruby-debug'` nella console quando vi occorre.
