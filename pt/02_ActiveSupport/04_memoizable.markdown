## Introduzindo Memoizable para cache de atributos

Performance é coisa séria, e um dos métodos mais usados para aumentar a velocidade de execução em códigos é o uso de cache. Quem nunca fez algo assim?

	class Person < ActiveRecord::Base
	  def age
	    @age ||= um_calculo_muito_complexo
	  end
	end

Nesta versão do Rails temos uma forma mais elegante de fazer isto usando o método `memoize` (é `memoize` mesmo e não **memorize**). Vamos alterar o exemplo acima para funcionar com esta nova funcionalidade:

	class Person < ActiveRecord::Base
	  def age
	    um_calculo_muito_complexo
	  end
	  memoize :age
	end

O método **age** será executado apenas uma vez e o seu retorno será armazenado e retornado em futuras chamadas ao método.

Só existe uma diferença entre os dois códigos acima. No primeiro, como o método é executado todas as vezes, se o valor armazenado na variável **@age** for `nil` ou `false` o cálculo (muito complexo) será executado novamente até termos a idade da pessoa.

No segundo exemplo, o método **age** só será executado uma vez e o valor retornado será sempre devolvido nas próximas chamadas, mesmo que seja `nil` ou `false`.
