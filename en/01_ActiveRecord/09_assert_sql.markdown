## New test helper (assert\_sql)

Maybe you have already heard of `assert_queries`, which helps to validate tests and the number of queries executed on a database.  For example:

In the test below I am specifying that if there are `partial_updates`, a query should be executed on the database; otherwise, no query should be executed.

We have now got another helper to make it easier to test the SQL query that will be run from `ActiveRecord` abstractions. For example:

	def test_empty_with_counter_sql
	  company = Firm.find(:first)
	  assert_sql /COUNT/i do
	    assert_equal false, company.clients.empty?
	  end
	end

In the example above I am asserting that in the specified block, at least one query should contain the word **COUNT**. Obviously you can be more specific in the regular expression that you are using. Let's looks at another example:

	assert_sql(/\(\"companies\".\"id\" IN \(1\)\)/) do
	  Account.find(1, :include => :firm)
	end
