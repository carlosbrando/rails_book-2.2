## Troca de biblioteca geradora de chaves secretas

A classe `Rails::SecretKeyGenerator`, usada para gerar chaves secretas aleatórias como as usadas para armazenar a sessão do usuário em cookies, foi marcada para ser removida do Rails (Deprecate).

Em seu lugar o Rails passou a usar a nova classe `ActiveSupport::SecureRandom` que foi feita para o Ruby 1.9. A biblioteca **SecureRandom** faz a mesma coisa que a anterior, mas um pouco melhor.

Esta nova biblioteca suporta os seguintes geradores de números aleatórios:

* openssl
* /dev/urandom
* Win32

Vejamos alguns exemplos de chaves geradas com esta nova biblioteca:

	# random hexadecimal string.
	ActiveSupport::SecureRandom.hex(10) #=> "52750b30ffbc7de3b362"
	ActiveSupport::SecureRandom.hex(10) #=> "92b15d6c8dc4beb5f559"
	ActiveSupport::SecureRandom.hex(11) #=> "6aca1b5c58e4863e6b81b8"
	ActiveSupport::SecureRandom.hex(12) #=> "94b2fff3e7fd9b9c391a2306"
	ActiveSupport::SecureRandom.hex(13) #=> "39b290146bea6ce975c37cfc23"

	# random base64 string.
	ActiveSupport::SecureRandom.base64(10) #=> "EcmTPZwWRAozdA=="
	ActiveSupport::SecureRandom.base64(10) #=> "9b0nsevdwNuM/w=="
	ActiveSupport::SecureRandom.base64(10) #=> "KO1nIU+p9DKxGg=="
	ActiveSupport::SecureRandom.base64(11) #=> "l7XEiFja+8EKEtY="
	ActiveSupport::SecureRandom.base64(12) #=> "7kJSM/MzBJI+75j8"
	ActiveSupport::SecureRandom.base64(13) #=> "vKLJ0tXBHqQOuIcSIg=="

	# random binary string.
	ActiveSupport::SecureRandom.random_bytes(10) #=> "\\016\\t{\\370g\\310pbr\\301"
	ActiveSupport::SecureRandom.random_bytes(10) #=> "\\323U\\030TO\\234\\357\\020\\a\\337"
