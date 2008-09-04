## MigrationProxy

Imagine que ao rodar uma série de migrations um determinado modelo seja renomeado. Agora imagine que antes disto acontecer uma outra migration faça referencia a este modelo. Isto causará um erro feio e parará a execução de suas migrations.

Para evitar este tipo de problema foi criado uma nova classe chamada `MigrationProxy` que armazena o nome, a versão e o nome do arquivo de cada migration e usa estas informações para carregar a migration somente quando ela for necessária, evitando carregar todas elas de uma vez.
