## Sostituzione della libreria per la generazione delle chiavi segrete

Ora la classe `Rails::SecretKeyGenerator`, utilizzata per generare chiavi segrete random (per la cifratura dei cookie di sessione), è deprecata.

Adesso al suo posto Rails usa la nuova classe `ActiveSupport::SecureRandom` introdotta con Ruby 1.9. La libreria **SecureRandom** esibisce il medesimo comportamento, ma produce risultati migliori. Sono supportati i seguenti generatori di numeri casuali:

* openssl
* /dev/urandom
* Win32

Vediamo alcune chiavi generate dalla nuova libreria:

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
