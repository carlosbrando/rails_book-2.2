## Ora render :template acceta :locals

I metodi `render :action` e `render :partial` accettano un `Hash` contenente i dati che vogliamo mostrare utilizzando l'opzione `:locals`, ma `render :template` non lo permetteva.

Nella corrente versione di Rails è ora possibile:

	render :template => "weblog/show", :locals => {:customer => Customer.new}