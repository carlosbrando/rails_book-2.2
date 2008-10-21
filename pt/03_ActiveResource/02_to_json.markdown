## ActiveResource::Base #to\_xml e #to\_json

Mais dois novos métodos foram acrescentados ao `ActiveResource::Base`: `to_xml` e `to_json`. O primeiro converte o recurso em uma string XML e o segundo retorna também uma string, mas no formato JSON representando o modelo.

O método `to_json` pode ser configurado através de um parâmetro opcional com as opções `:only` e `:except`, permitindo restringir ou remover determinados atributos. Por exemplo:

	person = Person.new(:first_name => "Carlos", :last_name => "Brando")
	person.to_json
	# => {"first_name": "Carlos", "last_name": "Brando"}

	person.to_json(:only => ["first_name"])
	# => {"first_name": "Carlos"}

	person.to_json(:except => ["first_name"])
	# => {"last_name": "Brando"}
