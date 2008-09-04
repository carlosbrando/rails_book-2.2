## Alteração no método concat

Se você tem o costume de evitar repetições em suas views criando helpers, com certeza já usou o método `concat`. Se você nunca usou este método, saiba que ele é como o `puts` para uma view.

A implementação atual do método recebe dois parâmetros, uma `String` com o texto que será exibido na view e um segundo chamado `binding`. Acontece que devido a melhorias no código, embora ele ainda espere estes dois parâmetros, o `binding` não é mais necessário. Este parâmetro foi deprecado, ou seja, se você estiver rodando o seu projeto sob o Rails 2.2, receberá uma mensagem de alerta quando este método for executado. Em uma futura versão do Rails, este parâmetro será removido.

A mensagem de alerta exibida é a seguinte: "The binding argument of #concat is no longer needed. Please remove it from your views and helpers".
