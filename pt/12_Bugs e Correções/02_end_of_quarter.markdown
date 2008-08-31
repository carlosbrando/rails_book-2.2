## end\_of\_quarter

Nem bem havia saído o Rails 2.1 e já foi encontrado um erro sério. Se você ainda tiver um projeto criado nesta versão entre no **irb** e tente rodar isto:

	Date.new(2008, 5, 31).end_of_quarter

**ERRO!**

Por que? A implementação do método `end_of_quarter` foi feita da maneira errada, ele avança até o último mês do trimestre e depois pega último dia. O problema é que ele apenas avança o mês, e como estou partindo do dia 31 de maio, ele tentar criar uma nova instância do objeto `Date` para 31 de junho, que não existe. Com o objeto `Time` não é disparado uma exceção, mas ele retorna a data errada: 31 de julho.

Nesta versão este erro já foi corrigido, mas caso você ainda esteja usando a versão 2.1 em algum projeto, muito cuidado, porque este erro só ocorrerá se usarmos o método `end_of_quarter` nos dias 31 de maio, julho e agosto.
