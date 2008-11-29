## ActiveResource::Base #to\_xml and #to\_json

Two new methods have been added to `ActiveResource::Base`: `to_xml` and `to_json`. The first converts the resource into an XML string, and the second returns a string in JSON format.

The `to_json` method can be configured using the optional hash-based parameters `:only` and `:except`, which allow you to restrict or remove certain attributes. For example:

	person = Person.new(:first_name => "Carlos", :last_name => "Brando")
	person.to_json
	# => {"first_name": "Carlos", "last_name": "Brando"}

	person.to_json(:only => ["first_name"])
	# => {"first_name": "Carlos"}

	person.to_json(:except => ["first_name"])
	# => {"last_name": "Brando"}
