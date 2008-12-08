## Evitare attacchi del tipo "response splitting"

Fino ad ora le URL passate al metodo `redirect_to` non venivano "sterilizzate" (sanitized, NdT). Ciò era fonte di potenziali pericoli, poiché permetteva ad utenti malevoli di generare attacchi del tipo **response splitting** e **header injection** nelle vostra applicazione.

Un esempio di questo problema si può presentare quando la vostra applicazione riceve una URL attraverso una query string e reindirizza l'utente verso tale URL usando il metodo `redirect_to`. Questo varco permette ad utenti malevoli di salvare dei cookie nella macchina dell'utente, e quindi contraffare le risposte inviate ai vostri utenti se la vostra applicazione usa questi parametri per costruire gli header HTTP.

Per arginare questo tipo di problemi Rails è stato aggiornato affinché sterilizzi tutte le URL passate al metodo `redirect_to`. In ogni caso, questo non significa che non dovrete prestare la dovuta attenzione a tali problemi, è sempre consigliabile fare un doppio check e stare all'erta.

