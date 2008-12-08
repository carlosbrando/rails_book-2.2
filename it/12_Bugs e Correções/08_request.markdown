## Test dei named route con bug

Esiste un determinato bug nelle versioni precedenti la 2.2 che compare quando un functional test verifica un named route con parametri prima di eseguire la richiesta. Per capire di cosa stiamo parlando, osservate il seguente esempio:

	def test_something
	  post_url(:id => 1) # Prima della richiesta questo genera un errore
	  get :edit, :id => 1
	  post_url(:id => 1) # Qui funziona
	end

Questo problema è stato corretto in Rails 2.2.