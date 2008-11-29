## Testing only uncommitted files when using Git

There is a very useful **rake** task in Rails that few people know about:

	rake test:uncommitted

As is probably obvious from the name, it runs only those tests whose files haven't yet been committed to the subversion repository, instead of running all project tests.

I used this feature all the time, but when I switched to Git it wasn't available, as it was only supported for subversion. A recent patch, however, guarantees that from here on out we'll also have it when using Git.