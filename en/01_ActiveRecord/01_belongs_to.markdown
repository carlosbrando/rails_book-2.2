## New options for assocations: :validate

A new option for associations has been added to Rails. The `:validate` option can now be used to disable or enable validation of a model's associated objects.  For example:

	class AuditLog < ActiveRecord::Base
	  belongs_to :developer, :validate => false
	end

	log = AuditLog.create(:developer_id => 0 , :message => "")
	log.developer = Developer.new

	puts log.developer.valid?
	# => false

	puts log.valid?
	# => true

	puts log.save
	# => true

As you can see in this example, even though the associated object (`Developer`) is not valid, the main object (`AuditLog`) gets saved in the database. This wasn't the normal behavior in earlier versions of Rails, where a parent object could only be saved if all its children were valid.

Although, in this prior example, I disabled validation to demonstrate this new feature, in fact, the default setting for `:validate` has been set to `false` in Rails 2.2, so `:validate => false` would not actually be necessary in the code above. On the other hand, if you wished to keep the old behavior, it would be necessary to use `:validate => true`.