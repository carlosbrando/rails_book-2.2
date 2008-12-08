## Creare test per le prestazioni

Rails 2.2 ha un nuovo **generatore** che vi permette di creare dei test di prestazioni (performance test).

Eseguendo il seguente comando in un terminale:

	[carlosbrando:edge]$ ./script/generate performance_test Login
	      exists  test/performance/
	      create  test/performance/login_test.rb

viene generato il file **test/performance/login\_test.rb**. Vediamo il codice prodotto:

	require 'performance/test_helper'

	class LoginTest < ActionController::PerformanceTest
	  # Replace this with your real tests.
	  def test_homepage
	    get '/'
	  end
	end

In questo file potete inserire tutti i test legati alle prestazioni che volete misurare, quando questi verranno eseguiti verrà prodotto un report con tutte le informazioni ad essi relativi, con i tempi di esecuzione, l'uso della memoria, etc. Per fare ciò eseguite il seguente comando nel vostro terminale:

	[carlosbrando:edge]$ ruby test/performance/login_test.rb
	Loaded suite test/performance/login_test
	Started
	LoginTest#test_homepage (32 ms warmup)
	        process_time: 11 ms
	              memory: unsupported
	             objects: unsupported
	.
	Finished in 0.870842 seconds.
