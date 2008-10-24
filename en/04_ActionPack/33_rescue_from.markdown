## A better way of catching errors

The worst thing that can happen in your application is that horrible error page. It's always good to be prepared for this situation. Now you can easily display a custom error page when your app raises an exception, using the `rescue_from` method. Check out this example:

	class ApplicationController < ActionController::Base
	  rescue_from User::NotAuthorized, :with => :deny_access
	  rescue_from ActiveRecord::RecordInvalid, :with => :show_errors

	  protected
	  def deny_access
	    …
	  end

	  def show_errors(exception)
	    exception.record.new_record? ? …
	  end
	end

The addition of `ActiveSupport:Rescuable` allows any class to mix in the `rescue_from` functionality.