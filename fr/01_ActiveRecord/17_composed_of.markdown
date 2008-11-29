## Nouvelles options pour le méthode composed\_of

La méthode `composed_of` a deux nouvelles options : `:constructor` et `:converter`.

L'option `:constructor` reçoit un symbole avec le nom d'une méthode ou d'une `Proc`. Par défaut, la classe composite est créée par la méthode `new` avec tous les paramètres, exactement dans l'ordre où ils sont fournis. Si votre classe ne suit pas cette convention, utilisez l'option `:constructor`. Elle vous permet de changer la manière dont la classe est créée. Voyez cet exemple, tiré de la documentation de Rails :

	composed_of :ip_address,
	  :class_name => 'IPAddr',
	  :mapping => %w(ip to_i),
	  :constructor => Proc.new { |ip| IPAddr.new(ip, Socket::AF_INET) }

Comme vous pouvez le voir dans l'exemple, il est nécessaire de fournir un paramètre additionnel à l'instanciation de la classe `IPAddr` ; c'est simple avec l'option `:constructor`.

Quant à l'option `:converter`, elle accepte un symbole avec le nom d'une méthode de la classe `:class_name` ou de la `Proc`. Cette méthode est invoquée quand la valeur affectée n'est pas de la bonne classe et doit être convertie. Voici un exemple :

	composed_of :balance,
	  :class_name => "Money",
	  :mapping => %w(balance amount),
	  :converter => Proc.new { |balance| Money.parse(balance) }

Dans cet exemple, la méthode `balance=` s'attend à une instance de la classe `Money`, mais si un autre type d'objet est passé, il devra être converti en utilisant la méthode `parse` de l'objet `Money`.

Il faut maintenant utiliser l'option `converter` au lieu de l'ancienne méthode de conversion avec bloc.
