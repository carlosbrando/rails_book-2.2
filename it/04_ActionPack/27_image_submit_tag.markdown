## Opzione :confirm nel metodo image\_submit\_tag

L'opzione `:confirm`, utilizzata in molti helper (es: `link_to`), è ora disponibile anche nel metodo `image_submit_tag`.

Questa opzione fa in modo che venga aperto un messagebox (javascript, NdT) contenente un messaggio personalizzato quando l'immagine viene cliccata. Se l'utente conferma, il form viene inviato normalmente, altrimenti non accade nulla.

	image_submit_tag("delete.gif", :confirm => "Are you sure?")
	# => <input type="image" src="/images/delete.gif" 
	#						onclick="return confirm('Are you sure?');"/>
