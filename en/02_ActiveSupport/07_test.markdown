## New test syntax

A new way of declaring tests has been added to Rails, using **test/do**. Take a look:

	test "verify something" do
	  # ...
	end

This is the new standard for Rails tests. See how a unit test file was generated in this version:

	require 'test_helper'

	class PostTest < ActiveSupport::TestCase
	  # Replace this with your real tests.
	  test "the truth" do
	    assert true
	  end
	end

The old way of doing it using methods will still work, so your old tests will not break.