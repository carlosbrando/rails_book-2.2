## Evitare che config.gem carichi determinate gem

Una delle novità introdotte con Rails 2.1 era `config.gem`, che vi permetteva di indicare a quali gem il vostro progetto dipendeva.

Con questa nuova funzionalità sono stati aggiunti alcuni task (rake, NdT) per semplificarci la vita, come `rake gem:install` che istalla automaticamente tutte le dipendenze.

Ma occorre fare attenzione nel configurare le dipendenze, dal momento che in alcuni casi il nome della gem non coincide con il nome del file da passare a `require`. Ad esempio, la gem **aws-s3** dovrebbe essere caricata con il nome **aws/s3**, sostituendo il trattino con uno slash. Per prevenire questa situazione è stata aggiunta l'opzione `:lib` a `config.gem`. Ecco come si comporterebbe per l'esempio appena fatto:

	config.gem 'aws-s3', :lib => 'aws/s3'

Dopo un po' è emerso un altro problema: "Il mio progetto dipende da tale gem, ma non voglio caricarla adesso. Come posso fare?".

Nella nuova versione di Rails è possibile impostare a `false` l'opzione `:lib`, che impedisce di caricare la gem.

	config.gem 'aws-s3', :lib => false

Pur senza caricare la gem, Rails la istallerà comunque quando viene lanciato il task `rake gems:install`, e sarà inclusa in ogni altro task relativo alle gem.

