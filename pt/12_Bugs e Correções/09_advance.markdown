## Time#advance reconhece frações de dias e semanas

Após o lançamento do Rails 2.1 o método `Time#advance` parou de funcionar corretamente com frações de tempo como:

	>> Time.stubs(:now).returns Time.local(2000)
	
	>> 1.5.days.ago == 36.hours.ago
	# => false

Este erro foi corrigido no Rails 2.2, faça o teste.