## Evitando feeds duplicados

Algumas vezes você assina o feed de um blog e de repente se depara com uma série de posts que já foram lidos aparecendo como se fossem novos no seu Google Reader. Já aconteceu com você?

Isto pode acontecer por vários motivos, mas não seria legal deixar isto acontecer com os assinantes do seu feed, correto?

Para ajudar-nos a evitar este tipo de constrangimento, cada entrada e o próprio feed criado pelo builder `atom_feed` receberam uma nova opção chamada `:id`.

	atom_feed({ :id => 'tag:nomedojogo.com,2008:test/' }) do |feed|
	  feed.title("My great blog!")
	  feed.updated((@posts.first.created_at))

	  for post in @posts
	    feed.entry(post, :id => "tag:nomedojogo.com,2008:" + post.id.to_s) do |entry|
	      entry.title(post.title)
	      entry.content(post.body, :type => 'html')

	      entry.author do |author|
	        author.name("Carlos Brando")
	      end
	    end
	  end
	end

Fazendo desta forma, mesmo que você tenha de reescrever algum trecho do código que gera os feeds, ou fazer alguma grande alteração no conteúdo do seu site, o **id** criado para aquela entrada será sempre o mesmo fazendo com que o leitor de feeds não duplique as entradas antigas.

Seus leitores agradecem.

## Adicionando instruções de processamento em documentos XML

Uma nova opção foi incluida ao método `atom_feed`, agora podemos incluir instruções de processamento ao xml. Veja um exemplo:

	atom_feed(:schema_date => '2008', :instruct => {
	  'xml-stylesheet' => {
	    :href=> 't.css', :type => 'text/css'
	  }
	}) do |feed|

	  # ...

	end

Instruções de processamento em arquivos XML são informações contidas no documento XML que serão repassadas para o aplicativo que o requisitou. Essas instruções são na maioria das vezes usadas para informar ao aplicativo como ele deve manipular os dados que estão no documento XML.

No exemplo acima estou dizendo ao aplicativo que recebe o XML que ele deve exibi-lo com uma folha de estilo (CSS) especifico. Veja como fica no XML:

	<?xml-stylesheet type="text/css" href="t.css"?>
