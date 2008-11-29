## Ora i cookie di sessione sono solo Http

Rails ha un opzione per impostare i cookie che viene spesso trascurata. L'opzione `:http_only` fa in modo che un cookie possa essere acceduto solo tramite HTTP, impedendone quindi l'accesso tramite codice javascript. Il valore di default è `false`.

In Rails 2.2, i cookie di session hanno l'opzione `:http_only` impostata per default. Lo scopo di questa funzionalità è di aumentare la sicurezza dei vostri progetti. Ovviamente può essere disabilitata se necessario. Se volete basta includere la seguente linea di codice in `ApplicationController` oppure in uno specifico controller:

	session :session_http_only => false
