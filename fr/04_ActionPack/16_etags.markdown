## Improving performance with ETags

Before discussing this, allow me to explain what ETags (Entity Tags) are. A crude explanation of ETags is that they are identifiers that get associated with each resource to determine if a file that is on the server is the same as one that is in a browser's cache. In many cases it is an HTML page, but it could also be XML or JSON.

The server is in charge of verifying that the requested resource is the same on both sides. If the server can verify this, instead of returning the resource's entire content, it only needs to return a **304** (Not Modified) status, which tells the browser to use the file in its cache.

Web servers like Apache and IIS already know how to do this for static pages, but when the content is dynamic, as is the case for most pages in a Ruby on Rails project, this is your responsibility.

The `response` object has two new attributes: `last_modified` and `etag`. When values are assigned to these attributes, they are automatically passed to the `HTTP_IF_MODIFIED_SINCE` and `HTTP_IF_NONE_MATCH` headers, respectively. When a new request for a resource is made, the `request` object will return with these headers set, allowing you to compare them with the current value and determine if the user's cache is as recent as the resource's content. If the user's cached version is the most recent one, instead of rendering the resource again, you can simply return a "304 Not Modified" status, which causes the browser to display the cached version.

To do this, two methods are available, depending on the situation: `stale?` and `fresh_when`.

Let's look at an example:

	class ArticlesController < ApplicationController
	  def show
	    @article = Article.find(params[:id])

	    if stale?(:last_modified => @article.published_at.utc, :etag => @article)
	      respond_to do |wants|
	        wants.html
	        wants.xml { render :xml => @article }
	      end
	    end    
	  end
	end

In the example above, if the `request` headers' values are different from the ones referred to in the call to `stale?`, this means that the user's cache is not up-to-date, so the `respond_to` block is called and the values that were passed to `stale?` are assigned to the `response` object's `last_modified` and `etag` attributes.

If the values are equal, this means that the user's cache is up-to-date. The `respond_to` block is not called, and just a "304 Not Modified" status is returned.

We also have the `fresh_when` method, which is a simpler version of the `stale?` method. Check out this example:

	def show
	  @article = Article.find(params[:id])
	  fresh_when(:etag => @article, :last_modified => @article.created_at.utc)
	end

Basically, this method assigns the values it receives to their respective attributes in the `response` object and verifies that they are equal to those in the `request` object. If they are different (stale), it renders the appropriate template. If they are equal (fresh), then it returns a "304 Not Modified" status instead of rendering the template.

In some situations it may be necessary to pass an `Array` to the `:etag` option, such as in the following example:

	fresh_when(:etag => [@article, current_user], :last_modified => @article.created_at.utc)
	
	# or
	
	if stale?(:last_modified => @article.published_at.utc, :etag => [@article, current_user])
		# ...
	end