## Bug ao testar rotas nomeadas

Existe um bug bem especifico até a versão 2.1 quando em um teste funcional testamos uma rota nomeada com parâmetros antes de executar um request. Para entender do que estou falando, veja um exemplo:

	def test_something
	  post_url(:id => 1) # Antes do request isto retornará um erro
	  get :edit, :id => 1
	  post_url(:id => 1) # Aqui funciona
	end

Este problema já foi corrigido no Rails 2.2.
