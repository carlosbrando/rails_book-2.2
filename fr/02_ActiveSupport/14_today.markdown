## Three new methods for classes that work with dates and times

The `Time`, `Date`, `DateTime` and `TimeWithZone` classes have been given three new methods that are quite convenient. They now have `today?`, `past?` and `future?`, to make our lives a little easier in some situations.

It will help to show how each one works. Here are the methods in action:

	date = Date.current
	# => Sat, 04 Oct 2008

	date.today?
	# => true

	date.past?
	# => false

	date.future?
	# => false

	time = Time.now
	# => Sat Oct 04 18:36:43 -0300 2008

	time.today?
	# => true
