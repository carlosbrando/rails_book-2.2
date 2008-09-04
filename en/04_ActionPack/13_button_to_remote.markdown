## button\_to\_remote

If you have been using Rails for a while, you probably are familiar with the `submit_to_remote` method. This method returns an HTML button that will send a form using **XMLHttpRequest**.

In Rails 2.2 this method has been renamed to `button_to_remote`, to maintain consistency with the name of its sibling method, `link_to_remote`.

Those who plan to update their projects don't need to worry, since the old name (`submit_to_remote`) will be an alias to the new one.