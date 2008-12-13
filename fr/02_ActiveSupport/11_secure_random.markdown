## Remplacement de la librairie de génération de clefs secrètes

La classe `Rails::SecretKeyGenerator` utilisée pour générer des clefs secrètes aléatoires pour crypter les cookies de session est marquée obsolète (*deprecated*).

Rails utilise à sa place la nouvelle classe `ActiveSupport::SecureRandom` qui est apparue en Ruby&nbsp;1.9. La librairie **SecureRandom**  fait la même chose que la précédente en un peu mieux. Elle supporte les générateurs aléatoires suivants :

* openssl
* /dev/urandom
* Win32

Voyons quelques clefs produites par cette nouvelle librairie : 

	# chaîne hexadecimale aléatoire
	ActiveSupport::SecureRandom.hex(10) #=> "52750b30ffbc7de3b362"
	ActiveSupport::SecureRandom.hex(10) #=> "92b15d6c8dc4beb5f559"
	ActiveSupport::SecureRandom.hex(11) #=> "6aca1b5c58e4863e6b81b8"
	ActiveSupport::SecureRandom.hex(12) #=> "94b2fff3e7fd9b9c391a2306"
	ActiveSupport::SecureRandom.hex(13) #=> "39b290146bea6ce975c37cfc23"

	# chaîne base64 aléatoire
	ActiveSupport::SecureRandom.base64(10) #=> "EcmTPZwWRAozdA=="
	ActiveSupport::SecureRandom.base64(10) #=> "9b0nsevdwNuM/w=="
	ActiveSupport::SecureRandom.base64(10) #=> "KO1nIU+p9DKxGg=="
	ActiveSupport::SecureRandom.base64(11) #=> "l7XEiFja+8EKEtY="
	ActiveSupport::SecureRandom.base64(12) #=> "7kJSM/MzBJI+75j8"
	ActiveSupport::SecureRandom.base64(13) #=> "vKLJ0tXBHqQOuIcSIg=="

	# chaîne binary aléatoire
	ActiveSupport::SecureRandom.random_bytes(10) #=> "\\016\\t{\\370g\\310pbr\\301"
	ActiveSupport::SecureRandom.random_bytes(10) #=> "\\323U\\030TO\\234\\357\\020\\a\\337"
