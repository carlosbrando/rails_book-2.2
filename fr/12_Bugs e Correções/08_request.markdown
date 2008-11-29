## Bug when testing named routes

There is a specific bug in versions before 2.2 that happens when a functional test tests a named route with parameters before executing a request. To understand what I'm talking about, check out this example:

	def test_something
	  post_url(:id => 1) # Antes do request isto retornará um erro
	  get :edit, :id => 1
	  post_url(:id => 1) # Aqui funciona
	end

This problem has been corrected in Rails 2.2.