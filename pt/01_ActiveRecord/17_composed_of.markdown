## Novas opções para o método composed\_of

O método `composed_of` recebeu duas novas opções: `:constructor` e `:converter`.

A opção `:constructor` pode receber um símbolo com o nome de um método ou um `Proc`. Por padrão, a classe de composição é criada através do método `new`, recebendo todos os atributos mapeadas como parâmetros, exatamente na ordem que em foram mapeados. Se por algum motivo a sua classe não aceitar esta convenção, você deve fazer uso da opção `:constructor`. Com ela você pode alterar a forma como sua classe deve ser criada. Veja um exemplo retirado da própria documentação do Rails:

	composed_of :ip_address,
	  :class_name => 'IPAddr',
	  :mapping => %w(ip to_i),
	  :constructor => Proc.new { |ip| IPAddr.new(ip, Socket::AF_INET) }

No exemplo, como você pode ver, ao criar uma nova instancia da classe `IPAddr` é necessário informar mais um parâmetro ao construtor. Fazendo uso da opção `:constructor` isto se torna bem simples.

Quanto a opção `:converter`, ela também aceita um símbolo que represente um método da classe informada na opção `:class_name` ou um `Proc`, e é disparado quando um valor diferente de uma instância da classe informada for passado para a propriedade criada, o que torna necessário uma conversão. Mais um exemplo:

	composed_of :balance,
	  :class_name => "Money",
	  :mapping => %w(balance amount),
	  :converter => Proc.new { |balance| Money.parse(balance) }

No exemplo acima o método `balance=` sempre estará esperando por uma instancia da classe `Money`, mas caso um outro tipo de objeto seja informado ele deverá ser convertido usando o método parse do objeto `Money`.

Com esta nova opção não devemos mais usar o bloco de conversão que o método permitia antes, a conversão deve ser feita através do uso da opção `:converter`.