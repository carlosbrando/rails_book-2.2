## New options for assocations: :validate

A new option for associations has been added to Rails. If you include the **:validate => false** option on an association, **ActiveRecord** will save the data of the parent object without validating the associated objects.  For example:

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

Note that even though the association is not valid, the object **log** gets saved.

The default value is **false**, that is, all validations in **belongs\_to** associations will be disconnected by default and if you want to connect them you need to use **:validate => true**.