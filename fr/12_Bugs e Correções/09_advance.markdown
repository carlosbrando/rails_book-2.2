## Time#advance now recognizes partial days and weeks

After Rails 2.1 was released, the `Time#advance` method stopped working correctly with partial time periods. For example:

	>> Time.stubs(:now).returns Time.local(2000)
	
	>> 1.5.days.ago == 36.hours.ago
	# => false

This bug has been fixed in Rails 2.2.