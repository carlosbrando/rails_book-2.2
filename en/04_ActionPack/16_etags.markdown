## Improving performance with ETags

Before discussing this new feature, allow me to explain what ETags (Entity Tags) are. A crude explanation of ETags is that they are identifiers that get associated with each resource to determine if a file that is on the server is the same as one that is in a browser's cache. In many cases it is an HTML page, but it could also be XML or JSON.

The server has the responsibility to verify that the requested resource is the same on both sides. If the server can confirm this, instead of returning the resource's entire content, it only returns a **304** (Not Modified) status, which tells the browser to use the file in its cache.

Web servers like Apache and IIS already know how to do this for static pages, but when the content is dynamic, as is the case for most pages in a Ruby on Rails project, this is your responsibility.

Two new methods have been added to the `response` object: the `last_modified=` and the `etag=` (note the assignment operator). When a value is assigned to these attributes, they will be included in the **HTTP\_IF\_MODIFIED\_SINCE** and **HTTP\_IF\_NONE\_MATCH** headers, respectively. When a new request for the same resource comes in, it will come back with these headers, allowing you to compare it with the current value and see if the user's cached version is more recent or not. If the user's version is more recent, you can simply return a "304 Not Modified" status, which causes the browser to use its cached version instead of re-downloading the same content.

To do this, there are two methods that can be used, depending on the situation: `stale?` and `fresh_when`.

Look at this example:

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

In this example, if the `request` header's values differ from the attributes passed to `stale?`, it means that the user's cached version is not the most recent one, and the `respond_to` block is called and the values passed to `stale?` are assigned to the `last_modified` and `etag` attributes of the `response` object.

If the values are the same, this means that the cached version is the most recent. In this case, the `respond_to` block is not called and a simple "304 Not Modified" status is returned.

The `fresh_when` method is also available, which is a simpler version of `stale?`. Take a look:

	def show
	  @article = Article.find(params[:id])
	  fresh_when(:etag => @article, :last_modified => @article.created_at.utc)
	end

Basically, this method assigns the various values that are passed to it to their respective attributes in the `response` object, and makes sure that they are the same as those in the `request` object. If they are different, then it renders the appropriate template for the action. If they are equal, then it only returns a "304 Not Modified" header instead of rendering the template.

In some situations it may be necessary to pass an `Array` to the `:etag` option, as in the example below:

	fresh_when(:etag => [@article, current_user], :last_modified => @article.created_at.utc)
	
	# or
	
	if stale?(:last_modified => @article.published_at.utc, :etag => [@article, current_user])
		# ...
	end
