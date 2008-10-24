## Criando testes de performance

No Rails 2.2 ganhamos um novo **generator** para testes de performance.

Ao executar no terminal o seguinte comando:

	[carlosbrando:edge]$ ./script/generate performance_test Login
	      exists  test/performance/
	      create  test/performance/login_test.rb

Será criado um arquivo chamado **test/performance/login\_test.rb**. Veja o código gerado:

	require 'performance/test_helper'

	class LoginTest < ActionController::PerformanceTest
	  # Replace this with your real tests.
	  def test_homepage
	    get '/'
	  end
	end

Neste arquivo podemos colocar todos os testes que desejarmos e ao executá-lo teremos informações sobre cada um dos testes, como tempo de processamento, uso de memória e outros. Para realizar o teste executamos no terminal:

	[carlosbrando:edge]$ ruby test/performance/login_test.rb
	Loaded suite test/performance/login_test
	Started
	LoginTest#test_homepage (32 ms warmup)
	        process_time: 11 ms
	              memory: unsupported
	             objects: unsupported
	.
	Finished in 0.870842 seconds.
