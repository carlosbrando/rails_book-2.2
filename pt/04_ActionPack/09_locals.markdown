## render :template agora aceita :locals

Os métodos `render :action` e `render :partial` permitem que passemos um `Hash` através da opção `:locals` com dados para serem processados por eles, mas o `render :template` não permitia.

Nesta versão do Rails isto irá funcionar também:

	render :template => "weblog/show", :locals => {:customer => Customer.new}
