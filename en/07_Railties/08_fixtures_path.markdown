## FIXTURES\_PATH

The `rake db:fixtures:load` and `rake db:fixtures:identify` tasks got a new optional parameter: `FIXTURES_PATH`.

`rake db:fixtures:load FIXTURES_PATH=spec/fixtures`

This way you can specify an alternate path for your fixtures (for example: spec/fixtures).