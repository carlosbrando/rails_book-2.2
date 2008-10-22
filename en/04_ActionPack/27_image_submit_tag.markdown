## :confirm option on the image\_submit\_tag method

The `:confirm` option that is used in many helpers, like `link_to`, will now be available in the `image_submit_tag` method.

This option causes a confirmation box with a personalized message to be displayed when you click on the image. If the user responds in the affirmative, the form is submitted normally. If not, nothing happens.

	image_submit_tag("delete.gif", :confirm => "Are you sure?")
	# => <input type="image" src="/images/delete.gif" 
	#						onclick="return confirm('Are you sure?');"/>
