## Solução de bug no método rename\_column

Esta alteração trata-se na verdade de uma correção de um bug no método **rename\_column**. Para entender qual era o problema precisamos de um cenário como exemplo. Primeiro criamos um **migration**:

	create_table "users", :force => true do |t|
	  t.column :name, :string, :default => ''
	end

Ok, agora criamos um segundo **migration** onde vamos renomear a coluna **name** da tabela:

	rename_column :users, :name, :first_name

Se você fizer o teste em sua máquina, notará que ao usar o método **rename\_column** a "nova" coluna **first\_name** não terá mais o valor padrão definido no primeiro **migration**.

Este bug já está resolvido para esta versão do Rails.
