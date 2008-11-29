## FIXTURES\_PATH

I task `rake db:fixtures:load` e `rake db:fixtures:identify` prendono un nuovo parametro opzionale: `FIXTURES_PATH`.

	rake db:fixtures:load FIXTURES_PATH=spec/fixtures

In questo modo potete indicare un path alternativo per le vostre fixtures (es: spec/fixtures).