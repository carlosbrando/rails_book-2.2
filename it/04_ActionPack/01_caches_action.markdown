## Nuova opzione :layout per il metodo caches\_action

L'opzione `:layout` è stata aggiunta al metodo `caches_action`.

	class ListsController < ApplicationController
	  ...

	  caches_action :index, :layout => false

	  ...
	end

Nel precedente esempio abbiamo specificato `:layout => false`, indicante che il solo contenuto dell'azione deve essere posto nella cache, escludendo quindi il layout. Ciò è molto utile quando avete del contenuto dinamico nel vostro layout (come spesso avviene).

Se non indicate nulla funziona come prima, ovvero viene posto in cache tutto (contenuto e layout).

## Template nella cache

Per migliorare le performance di Rails, i template delle pagine vengono automaticamente posti in cache per l'ambiente di produzione (production).

Ciò significa che se cambiate un template in produzione, è necessario riavviare il server (Rails, NdT) per vederne gli effetti.
