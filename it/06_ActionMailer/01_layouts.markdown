## Utilizzare i layout nelle email

Con la nuova versione di Rails, abbiamo una funzionalità che delizierà gli spammers!

Scherzi a parte, come abbiamo i layout per i controller, adesso li abbiamo anche per i mailer. E' sufficiente aggiungere `_mailer` ai nomi dei vostri file, è il layout verrà applicato automaticamente.

Vediamo qualche esempio. Anzitutto le view:

	<!-- layouts/auto_layout_mailer.html.erb -->
	Hello from layout <%= yield %>

	<!-- auto_layout_mailer/hello.html.erb  -->
	Inside

Quindi `ActionMailer`:

	# auto_layout_mailer.rb
	class AutoLayoutMailer < ActionMailer::Base
	  def hello(recipient)
	    recipients recipient
	    subject "You have a mail"
	    from "tester@example.com"
	  end
	end

In tal modo, ogni nuovo mailer utilizzerà questo layout.

Per impedire ad un mailer di utilizzare il layout di default, è sufficiente includere `:layout => false` nel corpo del messaggio della mail.

	def nolayout(recipient)
	  recipients recipient
	  subject "You have a mail"
	  from "tester@example.com"
	  body render(:inline => "Hello, <%= @world %>", :layout => false, 
			:body => { :world => "Earth" })
	end

Potete anche indicare un layout differente cambiando il valore dell'opzione `:layout`. In tal caso, il layout utilizzato non deve necessariamente avere il suffisso `_mailer`.

	def spam(recipient)
	  recipients recipient
	  subject "You have a mail"
	  from "tester@example.com"
	  body render(:inline => "Hello, <%= @world %>", :layout => 'spam', 
			:body => { :world => "Earth" })
	end

Infine, potete anche indicare ad un `ActionMailer` quale layout utilizzare:

	class ExplicitLayoutMailer < ActionMailer::Base
	  layout 'spam', :except => [:logout]
