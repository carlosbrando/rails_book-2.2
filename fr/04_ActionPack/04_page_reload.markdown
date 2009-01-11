## RJS#page.reload

La méthode `reload` a été ajoutée à `ActionView::Helpers::PrototypeHelper` pour qu'on puisse l'utiliser dans les templates **.rjs** ou les blocs `render(:update)`. Cette méthode force le rechargement de la page par javascript. Autrement dit, c'est un raccourci pour le couramment utilisé `window.location.reload();`.

Voici comment on l'emploie&nbsp;:

	respond_to do |format|
	  format.js do
	    render(:update) { |page| page.reload }
	  end
	end