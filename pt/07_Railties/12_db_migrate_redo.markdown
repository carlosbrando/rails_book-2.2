## Tarefa db:migrate:redo agora aceita a versão da migration

A tarefa `rake db:migrate:redo` tem se mostrado muito útil quando precisamos voltar e executar novamente a última migration criada. Agora esta tarefa ficou ainda mais útil, porque podemos utilizar a opção `VERSION` e informar qual migration queremos que seja reexecutada

	rake db:migrate:redo VERSION=20080725004631
