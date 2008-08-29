## Nova sintaxe para testes

Uma nova forma de se declarar testes foi adicionada ao Rails, usando declarações **test/do**. Veja:

	test "verify something" do
	  # ...
	end

Este é o novo padrão para testes do Rails, veja como ficou um arquivo de teste unitário recém criado nesta versão:

	require 'test_helper'

	class PostTest < ActiveSupport::TestCase
	  # Replace this with your real tests.
	  test "the truth" do
	    assert true
	  end
	end

A forma convencional, usando métodos, também continuará funcionando, então nossos testes antigos não quebrarão.
