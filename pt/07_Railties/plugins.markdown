## Está chegando o fim dos plugins?

No Rails 2.1, gems passaram a poder ser usadas como plugins em nossos projetos. Para isto bastava criar uma pasta chamada **rails** dentro do projeto do gem e incluir um arquivo **init.rb**.

Isto acrescentou um leque de novidades como **config.gem** e **rake:gems**. Mas isto nos faz pensar, já que agora eu posso carregar gems dentro da minha aplicação Rails, seria apenas uma questão de tempo até que plugins deixassem de existir.

E parece que isto realmente pode acontecer. Para esta versão do Rails, por exemplo, foi incluída uma alteração que permite inicializar plugins tanto pelo arquivo **init.rb** na raiz do plugin, como em um arquivo em um diretório **rails/init.rb** (da mesma forma como fazemos com os gems), sendo esta segunda opção a prioritária.

Assim, eu poderia por exemplo criar um gem (que funcionaria como um plugin) e instalar de duas maneiras:

	./script/plugin install git://github.com/user/plugin.git

	sudo gem install user-plugin --source=http://gems.github.com

Isto sem precisar manter dois arquivos **init.rb** (um na raiz e outro no diretório rails).
