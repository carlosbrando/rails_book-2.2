## New :layout option for the caches\_action method

An option called :layout has been added to the `caches_action` method.

	class ListsController < ApplicationController
	  ...

	  caches_action :index, :layout => false

	  ...
	end

In the example above I specified `:layout => false`, which means that only the content of the action and not the layout will be stored in the cache. This is very useful for when you have dynamic content in your layout (which is usually the case).

If you don't specify anything, it will continue to function the way it did in the past, which is to cache everything.

## Templates in the cache

To improve Rails performance, template pages will be automatically stored in the cache for the production environment.

This means that if you alter a template in production, you will need to restart the server for it to take effect.