## Receiving warnings for improving performance

Rails has gotten a configuration parameter that makes it emit warnings if it renders a template outside of the specified views directory. This is great because files outside of the specified views directories are not stored in the cache, which results in more disk accesses.

To start receiving warnings about this, just include the following line in your project's **environment.rb** file:

	config.action_view.warn_cache_misses = true

Doing this will result in the following warning if a file outside the configured directories is rendered:

`[PERFORMANCE] Rendering a template that was
not found in view path. Templates outside the view path are
not cached and result in expensive disk operations. Move this
file into /Users/user/project/app/views or add the folder to your
view path list`

This option is disabled by default.