## Polymorphic Routes

The `*_polymorphic_url` and `*_polymorphic_path` methods, which are highly used to generate URLs from database records, now have an optional parameter. In addition to the usual parameters, they new also accept an option hash, making it possible to generate new routes with additional parameters in the URL.

Let's check out the examples. Under each example is a commented-out equivalent method

	edit_polymorphic_url(@article, :param1 => '10')
	# => edit_article_url(@article, :param1 => '10')

	polymorphic_url(@article, :param1 => '10')
	# => article_url(@article, :param1 => '10')

	polymorphic_url(@article, :format => :pdf, :param1 => '10')
	# => formatted_article_url(@article, :pdf, :param1 => '10')
