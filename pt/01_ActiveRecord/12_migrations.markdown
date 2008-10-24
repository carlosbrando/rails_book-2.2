## Migrations transacionais no PostgreSQL

Quando uma migration está em execução e um erro ocorre, tudo que já foi executado será aplicado ao banco de dados, mas tudo que estiver após o erro, não será aplicado. Além disso a migration será marcada como concluída. Isto pode dar uma certa dor de cabeça para corrigir.

Mas, se o banco de dados que você estiver usando tiver suporte a **DDL rollbacks** em transações, então ele pode fazer uso deste recurso para desfazer tudo que foi feito antes do erro. O problema é que nem todos os bancos de dados possuem este recurso. O MySQL, por exemplo não possuí.

Mas o PostgreSQL, SQL Server e outros bancos possuem.

Neste caso o código do Rails foi atualizado para permitir o uso de transações em migrations quando você estiver usando estes bancos de dados. Embora o Rails permita este recurso, o adapter do banco deve ser atualizado (apenas fazendo com que o método `supports_ddl_transactions?` retorne `true`) para fazer uso de transações. Até o lançamento deste livro somente o do **PostgreSQL** parecia ter sido atualizado.
