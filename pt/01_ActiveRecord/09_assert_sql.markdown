## Novo helper para testes (assert\_sql)

Talvez você já conheça o método `assert_queries` que ajuda a validar nos testes a quantidade de queries executadas. Por exemplo:

	assert_queries(Firm.partial_updates? ? 0 : 1) { firm.save! }

No teste acima estou afirmando que se houver **partial\_updates** uma query deve ser executada no banco de dados, caso contrário nenhuma deve ser executada.

Agora ganhamos mais um helper para ajudar a testar o tipo de query executada, o método `assert_sql`. Um exemplo:

	def test_empty_with_counter_sql
	  company = Firm.find(:first)
	  assert_sql /COUNT/i do
	    assert_equal false, company.clients.empty?
	  end
	end

No exemplo acima estou confirmando que no bloco informado ao método pelo menos uma query deve conter a palavra **COUNT**. Obviamente você pode ser mais especifico na expressão regular que estiver usando. Vamos pegar um outro exemplo:

	assert_sql(/\(\"companies\".\"id\" IN \(1\)\)/) do
	  Account.find(1, :include => :firm)
	end
