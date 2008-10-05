## Nova opção para associações: :validate

Uma nova opção foi acrescentado às associações do Rails. A opção `:validate` pode ser usada para ligar ou desligar a validação de objetos associados ao modelo. Veja um exemplo:

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

Como você pode ver no exemplo acima, embora o objeto associado (`Developer`) não seja válido, ainda assim o objeto principal (`AuditLog`) foi salvo no banco de dados. Este não era o comportamento normal nas versões anteriores do Rails, onde um objeto pai só poderia ser gravado se todos os filhos fossem válidos.

Embora no exemplo acima estamos desligando a validação de associações, para demostrar o novo recurso, este é o novo valor padrão para este tipo de relacionamento de agora em diante. Ou seja, todas as validações em associações `belongs_to` estarão desligadas (como no exemplo) e para habilitarmos o comportamento antigo devemos usar a expressão `:validate => true`.
