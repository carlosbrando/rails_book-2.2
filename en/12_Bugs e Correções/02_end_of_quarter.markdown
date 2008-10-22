## Corrections in the Time#end\_of\_quarter and Date#end\_of\_quarter

Rails 2.1 had hardly been released when a serious error was found. If you still have a project that was created by this version, go into **irb** and try running this:

	Date.new(2008, 5, 31).end_of_quarter

**ERROR!**

Why? The implementation of `end_of_quarter` was faulty. It advances to the end of the last month of the trimester and then grabs the last day. The problem is that it only advances the month, and since this example starts with the 31st of May, it tries to create an instance of `Date` for June 31st, which doesn't exist. In the case of the `Time` object, an exception is not raised, but it returns the wrong date: July 31st.

This error has been corrected in this version, but if you are still using Rails 2.1 on some project, be careful, because this error only shows up when you use the `end_of_quarter` method on the last day of May, July or August.