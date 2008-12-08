## country\_select rimosso da Rails

L'helper `country_select` è stato rimosso da Rails. Per chi non lo ricordasse, questo metodo restituiva una lista con tutti i paesi del mondo.

La ragione di tale rimozione è dovuta al fatto che Rails è stato aggiornato per utilizzare lo standard ISO 3166 per i nomi dei paesi. Il principale problema è che, secondo lo standard ISO 3166, Taiwan (ad esempio) viene indicata come "Taiwan, Provincia della Cina". E ciò è esattamente quello che Michael Koziarski ha inserito nel metodo.

Quindi, Jamis Buck si chiese se non fosse possibile inserire semplicemente "Taiwan", dal momento che l'indicazione "Provincia della Cina" sembrava essere politicamente aggressiva. Una pletora di commenti esplosi su Github ha spostato l'attenzione sul lato politico piuttosto che su quello tecnico.

Ma Michael Koziarski è stato categorico nell'affermare che le questioni politiche erano ben lontane dal poter essere risolte con un semplice aggiornamento del codice. E che se avesse accettato tale cambiamento, presto altri sarebbero potuti arrivare (Kosovo, Ossezia del Sud, Abcazia, Transnistria, etc).

La migliore soluzione, o almeno quella meno controversa, consiste nel rimuovere l'helper in questione da Rails e renderlo disponibile come plugin. In tal modo chiunque può fare un fork del codice e modificarlo a proprio piacimento.

Per installare il plugin ufficiale:

`./script/plugin install git://github.com/rails/country_select.git`
