## PostgreSQL

In PostgreSQL la sintassi **typecast** è del tipo: `\<column>::\<type>`

`ActiveRecord` interpretava questa sintassi come un nome "bind", e si lamentava del fatto che il valore non venisse passata tramite un `Hash`. Adesso questo problema è stato corretto, permettendovi di fare cose del tipo:

	:conditions => [':foo::integer', { :foo => 1 }]