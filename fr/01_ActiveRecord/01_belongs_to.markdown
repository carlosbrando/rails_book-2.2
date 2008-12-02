## Nouvelles options pour assocations: :validate

Rails a une nouvelle option pour les associations. L'option `:validate` active ou désactive la validation des objets associés au modèle.
Par exemple :

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

Comme vous pouvez le voir dans cet exemple, même si l'objet associé (`Developer`) est invalide, l'objet principal (`AuditLog`) est enregistré dans la base de données. Ce n'est pas le comportement par défaut dans les version précédentes: un objet parent ne pouvait être enregistré que si tous ses enfants étaient valides.

Bien que, dans cet exemple, j'aie désactivé la validation pour démontrer la fonctionnalité, la valeur par défaut est `false` dans Rails&nbsp;2.2, et `:validate => false` n'est en fait pas nécessaire dans le code ci-dessus. Au contraire, si vous souhaitez conserver le comportement précédent, il est nécessaire d'indiquer `:validate => true`.
