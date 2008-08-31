## Alteração no método concat

Se você tem o costume de evitar repetições em suas views criando helpers, com certeza já usou o método `concat`. Se você nunca usou este método, saiba que ele é como o `puts` para uma view.

A implementação atual do método recebe dois parâmetros, uma `String` com o texto que será exibido na view e um segundo chamado `binding`. Acontece que devido a melhorias no código, embora ele ainda espere estes dois parâmetros, o `binding` não é mais necessário, na verdade o método simplesmente não o usa mais.

Então este segundo parâmetro foi deprecado, ou seja, se você estiver informando ele à chamada do método e rodando o seu projeto sob o Rails 2.2, receberá a seguinte mensagem ao subir o seu servidor:

The binding argument of #concat is no longer needed. Please remove it from your views and helpers.

Em uma futura versão do Rails, este segundo parâmetro será removido.
