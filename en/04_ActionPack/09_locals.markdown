## render :template now accepts :locals

The `render :action` and `render :partial` methods allow you to pass a **hash** containing the data you want them to display using the `:locals` option, but `render :template` used to not allow this.

In this version of Rails it works now:

	render :template => "weblog/show", :locals => {:customer => Customer.new}