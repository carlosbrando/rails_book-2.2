## Complete view path during exceptions

When an exception is thrown in development mode, your view shows a message like this:

	NoMethodError in Administration/groups#show
	Showing app/views//_list.erb where line ...

But it would be nice to get a messsage with the complete path of the file that threw the exception, like this:

	NoMethodError in Administration/groups#show
	Showing app/views/administration/reports/_list.erb where line ...

This problem has been corrected in this version of Rails, making your work easier.