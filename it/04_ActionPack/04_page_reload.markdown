## RJS#page.reload

Il metodo `relaod` è stato incluso in `ActionView::Helpers::PrototypeHelper` affinché possa essere utilizzato nei template **.rjs** o nei blocchi `render(:update)`. Tale metodo forza la pagina corrente ad essere ricaricate tramite l'uso del javascript. In altri termini, è una scorciatoia per il ben noto `window.location.reload();`.

Esempio:

	respond_to do |format|
	  format.js do
	    render(:update) { |page| page.reload }
	  end
	end