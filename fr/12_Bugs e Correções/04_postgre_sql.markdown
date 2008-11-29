## PostgreSQL

In PostgreSQL, the **typecast** syntax looks like this: `\<column>::\<type>`

`ActiveRecord` interpreted this syntax as a named bind, and complained that the value wasn't being passed in the `Hash`. This problem has now been corrected, allowing you to do something like this:

	:conditions => [':foo::integer', { :foo => 1 }]