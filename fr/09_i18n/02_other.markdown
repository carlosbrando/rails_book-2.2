## Pluralization support in internationalization methods

Sometimes certain translations depend on a number or quantity. This is a pretty common scenario this the internationalization package has taken into account.

For example, in the method `distance_in_words`, the phrase "1 second" works fine when the time is less than or equal to one, but must be pluralized when the time something takes is longer than this.

In the localization file, you can internationalize phrases in your app that depend on a number or quantity like this:

	datetime:
	  distance_in_words:
	    x_seconds:
	      one: "1 segundo"
	      other: "{{count}} segundos"

This is a useful feature that is used by many of Rails native methods, and one that you can use in your own methods.