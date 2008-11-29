## Effettuare i test, con Git, dei soli file fuori commit

C'è un task **rake** veramente utile che in pochi conoscono:

	rake test:uncommitted

Come indica il nome, esegue i test per i soli file che non sono ancora stati inseriti nella commit al repository Subversion anziché eseguire tutti i test.

Abbiamo utilizzato molto questa funzionalità, ma passando Git ci siamo accorti che non era ancora supportata. Tuttavia una recente patch garantisce di avere il supporto anche per Git da oggi in poi.
