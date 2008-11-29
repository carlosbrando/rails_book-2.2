## XHTML support in atom\_feed

The `atom_feed` helper now has an internal builder that allows you to create XHTML by simply adding `:type=>"xhtml"` to any `content`, `rights`, `title`, `subtitle` or `summary` element. For example:

	entry.summary(:type => 'xhtml') do |xhtml|
	  xhtml.p "A XHTML summary"
	  xhtml.p post.body
	end

Take a look at how this block fits inside the `atom_feed` call:

	atom_feed do |feed|
	  feed.title("My great blog!")
	  feed.updated((@posts.first.created_at))

	  for post in @posts
	    feed.entry(post) do |entry|
	      entry.title(post.title)

	      entry.summary(:type => 'xhtml') do |xhtml|
	        xhtml.p "A XHTML summary"
	        xhtml.p post.body
	      end

	      entry.author do |author|
	        author.name("DHH")
	      end
	    end
	  end
	end

This way, `atom_feed`'s internal builder will include the generated XHTML inside a **div** tag.

Of course, you can still use the old way of passing all the HTML inside a string, but this way your code is cleaner.