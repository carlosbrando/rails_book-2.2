## I plugin appartengono al passato?

In Rails 2.1 era possibile utilizzare le gem come plugin per i nostri progetti. Per far ciò era sufficiente creare la directory **rails** all'interno della directory contenente le gem del progetto (`vendor/gems`, NdT), e includere un file **init.rb**.

Ciò giustificava l'esistenza di `config.gem` e `rake gems`. Ma dal momento che è possibile caricare le gem direttamente dentro la nostra applicazione Rails, prima o poi i plugin sarebbero spariti?

E sembra che stia proprio accadendo. Con la versione di Rails, ad esempio, è stata introdotta una modifica che ci permette di inizializzare i plugin indifferentemente attraverso **init.rb** nella directory root dei plugin oppure con **rails/init.rb** (analogamente a quello che avviene per le gem). Quest'ultima strada è quella consigliata.

Così potete creare una gem (che si comporta come un plugin) ed istallarla in due possibili modi:

`./script/plugin install git://github.com/user/plugin.git`

`sudo gem install user-plugin --source=http://gems.github.com`

Questo mi evita anche di dover mantenere due file **init.rb** (uno nella root dei plugin e l'altro nella directory rails).
