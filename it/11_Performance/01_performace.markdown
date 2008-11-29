## Migliorare le prestazioni di Rails

Jeremy Kemper ha lavorato su diversi miglioramenti delle prestazioni di Rails. Ad esempio ha migliorato l'efficienza di **ERb**, come pure alcuni metodi come `concat` e `capture`, che vengono utilizzati da molti **helper** in Rails.

Jeremy ha anche rivisto il processo di inizializzazione dei **partial** ed ha ottimizzato diversi helper che generano codice **javascript**.

Anche la classe `RecordIdentifier` è stata migliorata attraverso l'uso del caching. `RecordIdentifier` ingloba una serie di convenzioni per maneggiare oggetti `ActiveRecord` e `ActiveResource`, o ogni tipo di modello che ha un `id`.

E' interessante osservare questo tipo di azioni. Rails sta diventando più grande e complesso, pertanto i processi di ottimizzazione dovranno diventare parte integrante del futuro sviluppo del framework.
