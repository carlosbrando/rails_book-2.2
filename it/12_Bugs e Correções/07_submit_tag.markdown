## Bug corretto in submit\_tag

Quando utilizzavate il metodo `submit_tag` con l'opzione `:disable_with` abilitata, all'invio del form verso il server veniva soppresso il parametro `:commit`. Questo perché dopo aver sottomesso il form, l'evento javascript **onclick** prima disabilitava il pulsante e quindi inviava il form al server, ed in un form HTML gli elementi disabilitati non vengono sottomessi.

Ciò costituisce un problema in tutti i casi in cui il form ha più di un `submit_tag` e la sua logica di creazione/aggiornamento dipende dai valori del parametro `:commit`.

Questo problema è stato risolto inserendo del codice in testa al javascript che copia i valori di tale parametro in un campo **hidden** del form e quindi lo invia al server, anche se il pulsante è disabilitato.
