## Making ActiveRecord attributes private

Rails 2.2 allows you to mark `ActiveRecord` objects as `private`. Until now, this was difficult, because these records are created through metaprogramming.

To see how this works, let's make the `name` attribute of the `User` model private:

	class User < ActiveRecord::Base

	  private
	  def name
	    "I'm private"
	  end

	end

Then let's try to retrieve it:

	user = User.first
	# => #<User id: 1, name: "teste">

	user.name
	# => NoMethodError: undefined method `NoMethodError' for #<User:0x234df08>

You can see that the `NoMethodError` exception was raised when we tried to call a private method. On the other hand, I can modify the user's name, since the `name=` method is still public:

	user.name = "Carlos"
	# => "Carlos"
