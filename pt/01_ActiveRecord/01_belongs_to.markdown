## Nova opção para associações, :validate

Foi adicionado ao Rails uma nova opção para associações. Se incluirmos a opção **:validate => false** na associação o **ActiveRecord** salvará os dados do objeto pai, sem validar os objetos associados. Exemplo:

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

Note que mesmo com a associação não sendo valida, o objeto **log** foi salvo.

O valor padrão é **false**, ou seja, todas as validações em associações **belongs\_to** estarão desligadas como padrão e para ligarmos devemos usar a expressão **:validate => true**.
