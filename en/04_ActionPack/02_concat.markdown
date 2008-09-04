## Changes in the concat method

If you are in the habit of avoiding repetition in your views by making helpers, you have no doubt used the `concat` method. If you have never used this method, it is basically the equivalent of `puts` for views.

The current implementation of this method accepts two parameters, a `String` with the text that will be displayed in the view and another parameter called `binding`. Due to certain improvements that have been made in the code, while it still accepts these two parameters, the `binding` argument is no longer necessary. This parameter has been deprecated, which means that starting with version 2.2, you will be warned if you use it, and it will be altogether removed at some future date. Upon starting your server, if your code uses this parameter, you will see the following warning:

The binding argument of #concat is no longer needed. Please remove it from your views and helpers.