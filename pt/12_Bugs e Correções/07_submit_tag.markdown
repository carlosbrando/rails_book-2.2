## Bug no submit\_tag corrigido

Quando usávamos o método `submit_tag` com a opção `:disable_with` ligada, ele suprimia o parâmetro `:commit` quando o formulário era enviado para o servidor. Isto acontecia porque após submeter o formulário, o javascript do evento **onclick** primeiro desabilita o botão e só depois envia o formulário ao servidor, e como sabemos campos desabilitados não são enviados no submit.

Isto representava um problema para os casos onde o formulário possuía mais de um `submit_tag` e a sua lógica de atualização/criação dependia do valor do parâmetro `:commit` para fazer alguma coisa.

Este problema foi corrigido incluindo um código no inicio do javascript que copia o valor deste parâmetro para um campo **hidden** no formulário e o envia para o servidor mesmo com o botão desabilitado.
