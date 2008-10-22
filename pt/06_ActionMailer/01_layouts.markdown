## Aplicando layouts em emails

A partir deste release do Rails teremos uma nova funcionalidade que será a alegria dos spammers!

Bincadeiras à parte, assim como temos layouts para controllers, teremos layouts para mailers também. A única restrição é que devemos colocar o sufixo **'_mailer'** no nome do arquivo se quisermos que o layout seja aplicado automaticamente.

Vamos aos nossos exemplos. Primeiro as views:

	<!-- layouts/auto_layout_mailer.html.erb -->
	Hello from layout <%= yield %>

	<!-- auto_layout_mailer/hello.html.erb  -->
	Inside

Agora vamos dar uma olhada no `ActionMailer`:

	# auto_layout_mailer.rb
	class AutoLayoutMailer < ActionMailer::Base
	  def hello(recipient)
	    recipients recipient
	    subject "You have a mail"
	    from "tester@example.com"
	  end
	end

Da forma como fizemos qualquer novo mailer fará uso do layout criado.

Para evitar que o mailer use o layout padrão, basta incluir a cláusula `:layout => false` no corpo do email.

	def nolayout(recipient)
	  recipients recipient
	  subject "You have a mail"
	  from "tester@example.com"
	  body render(:inline => "Hello, <%= @world %>", :layout => false, 
			:body => { :world => "Earth" })
	end

Você também pode informar um outro layout para o mailer, alterando a opção `:layout`. Neste caso o layout criado não é obrigado a ter o sufixo ‘_mailer’.

	def spam(recipient)
	  recipients recipient
	  subject "You have a mail"
	  from "tester@example.com"
	  body render(:inline => "Hello, <%= @world %>", :layout => 'spam', 
			:body => { :world => "Earth" })
	end

Além disso você também pode informar ao `ActionMailer` qual layout ele deve usar da seguinte forma:

	class ExplicitLayoutMailer < ActionMailer::Base
	  layout 'spam', :except => [:logout]
