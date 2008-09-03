## New method: Object#present?

A new method was added to the Object base class. The `present?` method is equivalent to  `!Object#blank?`.

In other words, an object is present if its not empty.  But what exactly is an empty object?

	class EmptyTrue
	  def empty?() true; end
	end

	a = EmptyTrue.new
	b = nil
	c = false
	d = ''
	e = '   '
	g = "  \n\t  \r "
	g = []
	h = {}

	a.present? # => false
	b.present? # => false
	c.present? # => false
	d.present? # => false
	e.present? # => false
	f.present? # => false
	g.present? # => false
	h.present? # => false

All of these objects are empty, or in other words, are not present.

But be very careful; some folks have gotten confused with this. The following are examples of some objects that AREN'T empty, or rather, are present:

	class EmptyFalse
	  def empty?() false; end
	end

	a = EmptyFalse.new
	b = Object.new
	c = true
	d = 0
	e = 1
	f = 'a'
	g = [nil]
	h = { nil => 0 }

	a.present? # => true
	b.present? # => true
	c.present? # => true
	d.present? # => true
	e.present? # => true
	f.present? # => true
	g.present? # => true
	h.present? # => true

Any object that contains a value is present, and this is true even of an array containing a `nil`, because the array is not empty.