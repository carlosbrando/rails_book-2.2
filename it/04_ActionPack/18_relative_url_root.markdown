## Eseguire più istanze di un progetto in path differenti

Talvolta potreste avere l'esigenza di eseguire più copie dello stesso progetto. Magari avete un prodotto utilizzato da diversi clienti, oppure volete eseguire contemporaneamente una versione di test accanto ad una di produzione.

La via più semplice per ottenere ciò consiste nell'avere più (sotto)domini, ognuno con la propria istanza dell'applicazione. Qualora ciò non fosse possibile potreste spostare la vostra applicazione in una sottodirectory e utilizzare un prefisso nell'URL per distinguere ogni istanza della vostra applicazione. Ad esempio, potreste avere più blog per utenti diversi con URL del tipo:

* http://www.nomedojogo.com/johndoe/blog
* http://www.nomedojogo.com/jilldoe/blog
* http://www.nomedojogo.com/joedoe/blog

In questo caso i prefissi **johndoe**, **jilldoe** e **joedoe** identificano le istanze dell'applicazione che vengono eseguite nelle corrispondenti, omonime, sottodirectory. Il routing dell'applicazione avviene dopo. Possiamo dire a Rails di ignorare questa parte dell'URL quando viene effettuata una richiesta, ma continuare ad includerla nelle URL che vengono generate. Ciò può essere configurato attraverso la costante `RAILS_RELATIVE_URL_ROOT` oppure il metodo `AbstractRequest.relative_url_root`.

Se il vostro progetto Rails è in esecuzione su Apache, questa feature è già attivata automaticamente, in molti casi non è quindi necessario preoccuparsene. Ma ricordate: solo se state usando Apache.

In ogni caso, in Rails 2.2 `relative_url_root` non viene configurato automaticamente dall'header HTTP. E' necessario farlo automaticamente, inserendo una direttiva del genere in ogni file **environmente.rb**:

	config.action_controller.relative_url_root = "/johndoe"

Fatto ciò la vostra applicazione ignorerà il prefisso "johndoe" che compare dopo il dominio. Ma quando vengono generate le URL, tale prefisso verrà sempre inserito al fine di garantire l'accesso all'applicazione corretta.
