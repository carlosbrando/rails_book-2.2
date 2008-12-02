## Nuova sintassi per i test

In Rails è stato introdotto un nuovo modo per dichiarare i test: `test/do`. Vediamo il seguente esempio:

	test "verify something" do
	  # ...
	end

Questo è il nuovo standard per il test in Rails. Vediamo, nella nuova versione, come viene generato un nuovo file per uno "unit test":

	require 'test_helper'

	class PostTest < ActiveSupport::TestCase
	  # Replace this with your real tests.
	  test "the truth" do
	    assert true
	  end
	end

Ovviamente il vecchio modo continua ad essere supportato: i vostri vecchi test non vengono invalidati.
