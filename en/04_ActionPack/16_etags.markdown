## Improving performance with ETags

Before discussing this, allow me to explain what ETags (Entity Tags) are. A crude explanation of ETags is that they are identifiers that get associated with each resource to determine if a file that is on the server is the same as one that is in a browser's cache. In many cases it is an HTML page, but it could also be XML or JSON.

The server has the responsibility to verify that the requested resource is the same on both sides. If the server can confirm this, instead of returning the resource's entire content, it only returns a **304** (Not Modified) status, which tells the browser to use the file in its cache.

Web servers like Apache and IIS already know how to do this for static pages, but when the content is dynamic, as is the case for most pages in a Ruby on Rails project, this is your responsibility.

The `response` object has acquired two new methods, the `last_modified=` and the `etag=` (note the assignment operator). When you assign values to these methods, they will be included in the **HTTP\_IF\_MODIFIED\_SINCE** and **HTTP\_IF\_NONE\_MATCH** headers, respectively. When a new request for the same resource comes in, it will come back with these headers, allowing you to compare the new value in the `response` and decide if you want to send all of the resource's content again or just a 304 status.

Let's see some code (stealing an example from Ryan Daigle's blog)

	class ArticlesController < ApplicationController
	  def show
	    @article = Article.find(params[:id])

	    # set the identifier
	    response.last_modified = @article.published_at.utc
	    response.etag = @article

	    # see if changes occurred
	    if request.fresh?(response)
	      head :not_modified
	    else
	      respond_to do |wants|
	        # return content normally
	      end
	    end
	end

Note that we're assigning values to `response.last_modified` and `response.etag`, and after that we use the `request.fresh?(response)` method to determine if there was any change. If the two headers are still the same then I just return a 304 status and the user's browser will use the content stored in its cache.

We can also pass an `Array` to the `etag` method:

	response.etag = [@article, current_user]

## An easier way of using ETags

We also got two new methods that should simplify how we implement ETags. The `etag!` and `last_modified!` methods.

Check out the implementation of these methods directly from the Rails source code:

	# Sets the Last-Modified response header. Returns 304 Not Modified if the
	# If-Modified-Since request header is <= last modified.
	def last_modified!(utc_time)
	  head(:not_modified) if response.last_modified!(utc_time)
	end

	# Sets the ETag response header. Returns 304 Not Modified if the
	# If-None-Match request header matches.
	def etag!(etag)
	  head(:not_modified) if response.etag!(etag)
	end

This makes things a lot easier. Look at how the example in the previous topic looks when you use these new methods:

	class ArticlesController < ApplicationController
	  def show
	    @article = Article.find(params[:id])

	    etag! @article
	    last_modified! @article.published_at.utc
	  end
	end

Way easier!