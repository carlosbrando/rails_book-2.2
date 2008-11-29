## Introduzione

Ruby on Rails 2.2 è strapieno di nuove funzionalità, miglioramenti e correzioni di bug. In questo libro troverete una breve descrizione accompagnata da esempi (nella maggior parte dei casi) per ciascuno dei cambiamenti più significativi introdotti nella nuova versione di Rails.

Il presente libro è stata una notevole impresa, ed è nostra speranza che possa aiutarvi a comprendere ogni nuova funzionalità introdotta in Rails.

Con la nuova versione Rails è divenuto poliglotta. Con il nuovo sistema di internazionalizzazione (i18n) potrete creare con facilità applicazioni per i vari utenti sparsi sul globo.

Sforzi notevoli sono stati fatti per rendere Rails thread-safe ed il più possibile pronto per l'imminente rilascio della versione 1.9 di Ruby. C'è stato anche un grande lavoro per renderlo maggiormente compatibile con JRuby. Benché la modalità thread-safe non è ancora disponibile per tutti gli ambienti, dal momento che funziona solo nelle virtual machine con supporto nativo per i thread (es: JRuby), è da considerare come un notevole punto di vantaggio per il framework.

Se nel passato ci sono state lamentele riguardo la mancanza di documentazione in Rails, queste spariscono con questa nuova versione. E' stato fatto un grande lavoro documentando il codice ed illustrando le funzionalità di Rails. Per un chiaro esempio, provate questo comando nel vostro terminale:

**rake doc:guides**

Questo task rake creerà la directory doc/guides, nella directory radice del vostro progetto, popolandola con varie guide che vi saranno utili per studiare Rails.


Traduzione e revisione dell'edizione italiana a cura di Carlo Pecchia (http://carlopecchia.eu).