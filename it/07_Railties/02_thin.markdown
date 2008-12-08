## Migliorato il supporto per Thin

Ora `script/server` verifica che **Thin** sia presente e, in tal caso, cerca di usarlo. Ciò è molto utile se state utilizzando **Thin** nel vostro ambiente di produzione (e magari anche in sviluppo). Per fare in modo che ciò funzioni è necessario che aggiungiate la seguente linea di codice ad **environment.rb**:

	config.gem 'thin'