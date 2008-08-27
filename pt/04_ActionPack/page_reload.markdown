## RJS#page.reload

O método **reload** foi incluído ao **ActionView::Helpers::PrototypeHelper** para ser usado em templates **.rjs** ou blocos **render(:update)**. Este método força a recarga da página atual no browser usando javascript. Em outras palavras é um atalho para o já muito usado **window.location.reload();**.

Veja como usar:

	respond_to do |format|
	  format.js do
	    render(:update) { |page| page.reload }
	  end
	end
