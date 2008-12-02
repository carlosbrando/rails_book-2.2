## Avoiding response splitting attacks

Until now, the URLs passed to the `redirect_to` method in Rails did not go through a sanitization process. This was dangerous, because it made it possible for malicious users to conduct **response splitting** and **header injection** attacks in your application.

An example of this vulnerability is when your app receives a URL through a query string and redirects the user to this URL using the `redirect_to` method. This breach allows malicious users to store cookies on your users' machines and create fake responses to your users if your project uses these parameters to construct HTTP headers.

To avoid these kinds of problems, Rails has been updated to sanitize all URLs passed to the `redirect_to` method. This doesn't mean, however, that you don't need to worry about these issues any more. It's always good to double-check things and stay alert.