## Desabilitando o cabeçalho Accept em requisições HTTP

Quando usamos o método `respond_to` para fazer algo assim:

	def index
	  @people = Person.find(:all)

	  respond_to do |format|
	    format.html
	    format.xml { render :xml => @people.to_xml }
	  end
	end

O Rails tem duas formas de identificar qual é o formato que deve ser usado. A primeira e mais comum é através do formato informado na URL (/index.xml, por exemplo) e a segunda forma para o caso de o formato não ter sido especificado é examinando o cabeçalho **Accept** da requisição HTTP.

Para quem não sabe o cabeçalho **Accept** é aquele que informa o tipo do documento desejado em **strings** mais ou menos assim:

	Accept: text/plain, text/html
	Accept: text/x-dvi; q=.8; mxb=100000; mxt=5.0, text/x-c

	# recuperando esta informação via código
	@request.env["HTTP_ACCEPT"] = "text/javascript"

Para ver uma lista dos tipos mais comuns acesse a endereço: http://www.developershome.com/wap/detection/detection.asp?page=httpHeaders

Acontece que este cabeçalho é porcamente implementado na maioria dos browsers. E quando ele é usado em sites públicos algumas vezes estranhos erros acontecem quando robôs indexadores fazem seus requests.

Assim, tomou-se a decisão de desativar este cabeçalho por padrão, depois voltou-se atrás e resolveu-se que era melhor deixar apenas a opção de desligar se desejado. Para isto basta incluir a seguinte linha no arquivo **environment.rb**:

	config.action_controller.use_accept_header = false

Quando desligado, caso o formato não seja informado na URL o Rails assumirá que deve usar o format.html.

Existe um caso especial quando fazemos requisições usando ajax se o cabeçalho **X-Requested-With** estiver presente. Neste caso o formato **format.js** ainda será usado mesmo que o formato não tenha sido especificado (/people/1, por exemplo).
