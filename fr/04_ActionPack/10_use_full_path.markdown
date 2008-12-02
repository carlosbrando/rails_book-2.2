## :use\_full\_path in the render method is no longer available

	render :file => "some/template", :use_full_path => true

The `:use_full_path` option on the `render` method is no longer available in Rails 2.2. This is not anything serious, since it was not necessary.