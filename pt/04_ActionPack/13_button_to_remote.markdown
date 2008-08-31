## button\_to\_remote

Se você já usa Rails há um tempo, com certeza conhece o método `submit_to_remote`, certo? Este método retorna um botão HTML preparado para enviar o formulário via **XMLHttpRequest**.

No Rails 2.2 este método foi renomeado para `button_to_remote`, para manter uma certa consistência com o nome do seu método irmão o `link_to_remote`.

Aqueles que irão migrar seus projetos não precisam se preocupar já que o nome antigo (`submit_to_remote`) será um alias para novo.
