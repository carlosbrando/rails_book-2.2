## Automated belongs\_to associations in Rails scaffold generator

If you are using Rails 2.2, try to execute the following command to create a new model:

	./script/generate scaffold comment author:string body:text post:references

Note that this specifies that comments reference the `posts` table. Or, in other words, my comments belong (`belongs_to`) a post. Now take a look at the **app/models/comment.rb** that got generated:b** gerado pelo script:

	class Comment < ActiveRecord::Base
	  belongs_to :post
	end

The relationship between the two tables has automatically been added to the model. This is a new feature found in this version of Rails.