## Benchmarking reports em milisegundos

Todas as mensagens de log que continham uma indicação do tempo que determinado processo levou para ser executado, foram alteradas para exibir o tempo em milisegundos.

Por exemplo, a mensagem:

"Completed in 0.10000 (4 reqs/sec) | Rendering: 0.04000 (40%) | DB: 0.00400 (4%) | 200 OK [http://example.com]"

Agora será exibida da seguinte forma:

"Completed in 100ms (View: 40, DB: 4) | 200 OK [http://example.com]"
