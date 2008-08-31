## StringInquirer

Uma nova classe foi incluída ao Rails, a classe `StringInquirer`.

Para entender como funciona, vou ter de explicar usando alguns exemplos. Vamos criar uma classe chamada **Cliente** que contém um método que retorna o **status** do cliente:

	class Cliente
	  def status
	    "ativo"
	  end
	end

	c = Cliente.new
	c.status
	# => "ativo"

	c.status == "ativo"
	# => true

	c.status == "inativo"
	# => false

Ok, até aqui tudo normal. Agora vou modificar a implementação do método status usando a classe `StringInquirer`, sempre lembrando que o retorno do método **status** pode vir de uma coluna do banco de dados (claro), isto é apenas um exemplo.

	class Cliente
	  def status
	    ActiveSupport::StringInquirer.new("ativo")
	  end
	end

	c = Cliente.new
	c.status
	# => "ativo"

	# Agora vem a grande diferença:
	c.status.ativo?
	# => true

	c.status.inativo?
	# => false

Para verificar se o **status** do cliente é o esperado, ao invés de comparar `Strings`, eu uso um método com o valor do status e o sinal de interrogação.

Claro que isto já começou a ser usado no próprio Rails. Por exemplo, caso você precise verificar se o Rails foi carregado em ambiente de produção, você pode substituir o velho `Rails.env == "production"`, por:

	Rails.env.production?
