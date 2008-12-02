## RJS#page.reload

The `reload` method has been included in `ActionView::Helpers::PrototypeHelper` so that it can be used in **.rjs** templates or `render(:update)` blocks. This method forces the current page to be reloaded in the browser using javascript. In other words, it is a shortcut for the widely-used `window.location.reload();` technique.

Here's how you use it:

	respond_to do |format|
	  format.js do
	    render(:update) { |page| page.reload }
	  end
	end