## FIXTURES\_PATH

As tarefas `rake db:fixtures:load` e `rake db:fixtures:identify` receberam um novo parâmetro opcional: `FIXTURES_PATH`.

`rake db:fixtures:load FIXTURES_PATH=spec/fixtures`

Desta forma você pode especificar um caminho alternativo para suas fixtures (por exemplo: spec/fixtures).
