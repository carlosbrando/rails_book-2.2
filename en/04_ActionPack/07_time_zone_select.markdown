## Support for regular expressions in time\_zone\_select

In `ActiveSupport`'s `TimeZone` class there is a `us_zones` method that conveniently returns a dynamically-generated list of all US time zones.

The problem is that sometimes you want to develop software for people in other countries, but there is no such convenient method that lists these other countries' time zones.

There was a long debate over whether or not to create methods like `african_zones`, `american_zones`, etc. Eventually, the following solution prevailed.

Support for `=~` was added to `TimeZone` so that it would be possible to generate a list of time zones from a regular expression. The `time_zone_select` method has also been updated to work with these changes.

You can now do something like this:

	<%= time_zone_select( "user", 'time_zone', /Australia/) %>
	<!-- This returns:
		(GMT +08:00) Perth
		(GMT +09:30) Adelaide
		(GMT +09:30) Darwin
		(GMT +10:00) Brisbane
		(GMT +10:00) Canberra
		(GMT +10:00) Hobart
		(GMT +10:00) Melbourne
		(GMT +10:00) Sydney
	-->

This example narrows down a large list of all world time zones to display only those where an internal mapping index contains the word "Australia." Consult the `TimeZone` class documentation to see the mapping index and learn which place names can be matched against.

To learn more about `TimeZones`, I suggest that you watch Episode 106 of RailsCasts (http://railscasts.com/episodes/106) and also take a look at my last book.