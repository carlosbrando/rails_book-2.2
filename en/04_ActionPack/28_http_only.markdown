## Session cookies are now HttpOnly

Rails has an option for setting cookies that is often overlooked. The `:http_only` option causes a cookie to be accessible only through HTTP, preventing it from being accessed by javascript code. The default value for this is `false`.

In Rails 2.2, session cookies will have the `http_only` option set by default. The purpose of this feature is to increase the security of your projects. Of course, this option can be disabled if necessary. If you wish to do this, just include the following line in your `ApplicationController` or in a specific controller:

	session :session_http_only => false
