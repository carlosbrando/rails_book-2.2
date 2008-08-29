## Testando apenas arquivos uncommitteds no Git

Existe uma tarefa **rake** no Rails que pouca gente conhece mas que é muito útil:

	rake test:uncommitted

Como o nome já diz esta tarefa roda os testes apenas dos arquivos que ainda não foram enviados (commit) para o subversion, ao invés de rodar todos os testes do projeto.

Eu costumava usar isto muito, mas quando mudei para Git ela não funcionou mais, o suporte era apenas para o SVN. Mas um patch foi aplicado no Rails garantindo que daqui em diante teremos o mesmo suporte também para o Git.
