## Using layouts in emails

With this new Rails release we will have a new feature that is sure to delight the spammers!

Joking aside, just as we have layouts for controllers, we now have them for mailers too. The only thing you need to do is add **'_mailer'** to the end of your filenames, which will cause the layout to be applied automatically.

Let's take a look at the examples. First, the views:

	<!-- layouts/auto_layout_mailer.html.erb -->
	Hello from layout <%= yield %>

	<!-- auto_layout_mailer/hello.html.erb  -->
	Inside

Now let's look at `ActionMailer`:

	# auto_layout_mailer.rb
	class AutoLayoutMailer < ActionMailer::Base
	  def hello(recipient)
	    recipients recipient
	    subject "You have a mail"
	    from "tester@example.com"
	  end
	end

Doing it this way causes any new mailer to use this layout.

To avoid having the mailer use the default layout, all you have to do is include the `:layout => false` clause in the email body.

	def nolayout(recipient)
	  recipients recipient
	  subject "You have a mail"
	  from "tester@example.com"
	  body render(:inline => "Hello, <%= @world %>", :layout => false, :body => { :world => "Earth" })
	end

You can also specify a different layout for the mailer by changing the `:layout` option. In this case, the layout you use does not need to have the '_mailer' suffix.

	def spam(recipient)
	  recipients recipient
	  subject "You have a mail"
	  from "tester@example.com"
	  body render(:inline => "Hello, <%= @world %>", :layout => 'spam', :body => { :world => "Earth" })
	end

You can also tell `ActionMailer` which layout it should use like this:

	class ExplicitLayoutMailer < ActionMailer::Base
	  layout 'spam', :except => [:logout]