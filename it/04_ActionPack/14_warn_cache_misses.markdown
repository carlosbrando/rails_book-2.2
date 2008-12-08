## Ricevere warnings per migliorare le performance

Rails ha un nuovo parametro di configurazione che gli permette di segnalare dei warning se effettua il rendering di un template fuori dalla directory delle view. Il che è un bene, poiché i file che si trovano fuori da tale directory non vengono salvati nella cache, con conseguente maggiore accesso al disco.

Per ricevere tali warning è sufficiente aggiungere la seguente linea al vostro file **environment.rb**:

	config.action_view.warn_cache_misses = true

Se viene effettuato il rendering di un file fuori della directory delle views, viene generato il seguente messaggio di warning:

`[PERFORMANCE] Rendering a template that was
not found in view path. Templates outside the view path are
not cached and result in expensive disk operations. Move this
file into /Users/user/project/app/views or add the folder to your
view path list`

Questa opzione è disabilitata per default.
