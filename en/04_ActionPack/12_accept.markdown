## Disabling the Accept header in HTTP requests

Let's start with some example code:

	def index
	  @people = Person.find(:all)

	  respond_to do |format|
	    format.html
	    format.xml { render :xml => @people.to_xml }
	  end
	end

In the example above, Rails has two ways of identifying which format should be used for the `respond_to` block. The first and most common is through the format indicated in the URL (/index.xml, for example), and the second is when the format is not specified, in which case it consults the HTTP request's **Accept** header.

For those who may not know, the **Accept** header is used to indicate what types of documents (often called MIME Types: http://en.wikipedia.org/wiki/MIME) the browser prefers using strings like:

	Accept: text/plain, text/html
	Accept: text/x-dvi; q=.8; mxb=100000; mxt=5.0, text/x-c

	# recuperando esta informação via código
	# FIXME: retrieve this information via code
	@request.env["HTTP_ACCEPT"] = "text/javascript"

Consult this URL to see a list of some of the most common MIME types:
http://www.developershome.com/wap/detection/detection.asp?page=httpHeaders

This header is implemented inefficiently on many browsers, and when it is used on public web sites, sometimes strange errors occur when indexing robots perform their HTTP requests.

Thus, the decision was made to disable this header by default. It's always better to indicate the desired format in your URLs, but if you need to enable this header, just include the following line in your **environment.rb**:

	config.action_controller.use_accept_header = false
	# FIXME shouldn't be "true"?

When disabled, if the format is not indicated by the URL, Rails will assume that it should use **.html** format.

There is a special case when you make ajax requests using the **X-Requested-With** header. In this case, the **.js** format will be used even if the format was not specified (/people/1, for example).