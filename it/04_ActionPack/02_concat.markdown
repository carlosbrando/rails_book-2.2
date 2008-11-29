## Modifiche nel metodo concat

Se avete l'abitudine di evitare le ripetizioni nelle vostre view facendo ricorso agli helper, senza dubbio avrete usato il metodo `concat`. Se non l'avete mai utilizzato, vi basta sapere che è l'equivalente del metodo `puts` nelle view.

L'implementazione corrente di tale metodo accetta due parametri, una `String` con il testo che verrà mostrato nella view, e un altro parametro chiamato `binding`. A causa di alcuni miglioramenti introdotti nel codice, il parametro `binding` - benché accettato - non viene più utilizzato.
L'uso di tale parametro è, quindi, deprecato a partire dalla versione 2.2 di Rails.

Viene generato un messaggio di warning del tipo: "The binding argument of #concat is no longer needed. Please remove it from your views and helpers."