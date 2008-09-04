## Executando múltiplas instâncias de um projeto em subdiretórios

Às vezes você tem de rodar múltiplas cópias do mesmo projeto. Talvez você tenha um produto que será usado por vários clientes, ou talvez você apenas deseje rodar uma versão de teste e produção do seu software ao mesmo tempo.

A forma mais simples de se fazer isto é ter múltiplos (sub)domínios com uma instância do aplicativo em cada uma. Mas se isto não for possível você pode colocar seu aplicativo em um subdiretório e usar um prefixo na sua URL para distinguir as instâncias do seu software. Por exemplo, você poderia rodar vários blogs de usuários diferentes usando URLs como:

* http://www.nomedojogo.com/fulano/blog
* http://www.nomedojogo.com/sicrano/blog
* http://www.nomedojogo.com/beltrano/blog

Nestes casos, os prefixos **fulano**, **sicrano** e **beltrano** identificarão as instâncias do aplicativo rodando em subdiretórios com os mesmos nomes. O roteamento do aplicativo começa depois disto. Você pode dizer ao Rails para ignorar esta parte das URLs quando uma requisição for feita, mas colocá-la nas URLs geradas por ele, configurando isto através da constante **RAILS\_RELATIVE\_URL\_ROOT** ou do método `AbstractRequest.relative_url_root`.

Se seu projeto Rails estiver rodando sob o Apache, esse recurso já é ativado automaticamente. Por isso na maioria dos casos não temos de nos preocupar em configurar isto hoje. Isto se você estiver usando Apache.

Porém, no Rails 2.2 o `relative_url_root` não será mais configurado automaticamente pelo HTTP header. Teremos de fazer isto manualmente, colocando uma linha mais ou menos assim no arquivo **environment.rb** de cada um dos aplicativos:

	config.action_controller.relative_url_root = "/fulano"

Feito isto, seu aplicativo irá ignorar o prefixo "fulano" logo depois do domínio. Mas ao gerar URLs ele sempre colocará este prefixo para garantir que você estará acessando o projeto no subdiretório correto.
