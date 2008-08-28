## Nova opção :layout no método caches\_action

Foi acrescentado a opção **:layout** no método **caches\_action**.

	class ListsController < ApplicationController
	  ...

	  caches_action :index, :layout => false

	  ...
	end

No exemplo acima eu especifiquei **:layout => false**, isto significa que o layout não será armazenado no cache, apenas o conteúdo da action será. Isto é muito útil quando temos conteúdo dinâmico no layout (o que acontece na maioria dos casos).

Se você não especificar nada ele assumirá o padrão atual que é **true**.
