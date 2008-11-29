## Bug fix in submit\_tag

When you used the `submit_tag` method with the `:disable_with` option enabled, it suppressed the `:commit` parameter when the form was sent to the server. This happened because, after submitting a form, the javascript in the **onclick** event first disabled the button and only afterwards sent the form to the server, and disabled fields aren't sent in an HTML form submit.

This represents a problem for the cases where the form has more than one `submit_tag` and its update/creation logic depends on the value in the `:commit` parameter.

This problem has been corrected by including some code in the beginning of the javascript that copies the value of this parameter to a **hidden** form field and sends it to the server, even if the button is disabled.