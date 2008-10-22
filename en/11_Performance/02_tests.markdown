## Creating performance tests

Rails 2.2 has a new **generator** that allows you to create performance tests.

Executing the following command in the terminal:

	[carlosbrando:edge]$ ./script/generate performance_test Login
	      exists  test/performance/
	      create  test/performance/login_test.rb

causes a file called **test/performance/login\_test.rb** to be created. Check out the code that gets generated:

	require 'performance/test_helper'

	class LoginTest < ActionController::PerformanceTest
	  # Replace this with your real tests.
	  def test_homepage
	    get '/'
	  end
	end

In this file, you can put all the performance-related tests you want to execute, and when they get executed, you will get a report with important information about each test, including execution time, memory usage and other info. To do this, execute the following command in your terminal:

	[carlosbrando:edge]$ ruby test/performance/login_test.rb
	Loaded suite test/performance/login_test
	Started
	LoginTest#test_homepage (32 ms warmup)
	        process_time: 11 ms
	              memory: unsupported
	             objects: unsupported
	.
	Finished in 0.870842 seconds.
