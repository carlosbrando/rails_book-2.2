## Melhorando a performace do Rails

Jeremy Kemper andou trabalhando em melhorias de performace no Rails.Uma das coisas que ele andou melhorando foi o **Erb**, tornando-o mais rápido. Além disso ele tem atacado alguns métodos especiais como o **concat** e **capture** que são usados por muitos **helpers** do Rails.

Jeremy também atacou o processo de inicialização de **partials** e otimizou diversos helpers que geravam código em **Javascript**.

A classe **RecordIdentifier** também foi melhorada através do uso de caches. O **RecordIdentifier** incorpora uma série de convenções para lidar com registros **ActiveRecords** e **ActiveResources** ou praticamente qualquer outro tipo de modelo que tenha um id.

É interessante ver este tipo de ação, o Rails já está ficando grande e pesado demais, e processos de otimização devem se tornar uma contante daqui para frente.
