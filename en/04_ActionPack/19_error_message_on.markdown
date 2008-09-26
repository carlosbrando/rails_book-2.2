## Changes in error\_message\_on

The `error_message_on` message is very useful. You can use it to easily display error messages returned by certain methods in an object.

	<%= error_message_on "post", "title" %>

	<!-- or -->

	<%= error_message_on @post, "title" %>

This will cause an error message to be displayed within a DIV tag if an error is associated with the title field of the Post model.

But the most interesting thing about the `error_message_on` method is that we can personalize it to display friendlier messages. Here is where the changes in Rails 2.2 come in.

In the current version, the personalization parameters are passed directly to the method, but in Rails 2.2 they will be passed as an option Hash:

	<%= error_message_on "post", "title",
	      :prepend_text => "Title simply ",
	      :append_text => " (or it won't work).",
	      :css_class => "inputError" %>

Don't worry about having to port your current projects for these changes, because the code still works in the old way too (at least for a while), but with a warning that you need to update your code.

## More methods updated to accept option Hashes

### truncate

	truncate("Once upon a time in a world far far away")
	# => Once upon a time in a world f...

	truncate("Once upon a time in a world far far away", :length => 14)
	# => Once upon a...

	truncate("And they found that many people were sleeping better.", :omission => "... (continued)", :length => 15)
	# => And they found... (continued)

### highlight

	highlight('You searched for: rails', ['for', 'rails'], :highlighter => '<em>\\1</em>')
	# => You searched <em>for</em>: <em>rails</em>

	highlight('You searched for: rails', 'rails', :highlighter => '<a href="search?q=\\1">\\1</a>')
	# => You searched for: <a href="search?q=rails">rails</a>

### excerpt

	excerpt('This is an example', 'an', :radius => 5)
	# => ...s is an exam...

	excerpt('This is an example', 'is', :radius => 5)
	# => This is a...

	excerpt('This next thing is an example', 'ex', :radius => 2)
	# => ...next...

	excerpt('This is also an example', 'an', :radius => 8, :omission => '<chop> ')
	# => <chop> is also an example

### word\_wrap

	word_wrap('Once upon a time', :line_width => 8)
	# => Once upon\na time

	word_wrap('Once upon a time', :line_width => 1)
	# => Once\nupon\na\ntime

### auto\_link

	post_body = "Welcome to my new blog at http://www.myblog.com/. Please e-mail me at me@email.com."

	auto_link(post_body, :urls)
	# => "Welcome to my new blog at 
		<a href=\"http://www.myblog.com/\">http://www.myblog.com</a>. 
		Please e-mail me at me@email.com."

	auto_link(post_body, :all, :target => "_blank")
	# => "Welcome to my new blog at 
		<a href=\"http://www.myblog.com/\" target=\"_blank\">http://www.myblog.com</a>. 
		Please e-mail me at <a href=\"mailto:me@email.com\">me@email.com</a>."

All these methods continue working in the old way for now, but display warnings in the application log (and terminal, in development mode) to remind you to update your code as soon as possible.