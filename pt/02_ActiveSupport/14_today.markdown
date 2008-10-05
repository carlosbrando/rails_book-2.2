## Três novos métodos para classes que trabalham com datas e horas

As classes `Time`, `Date`, `DateTime` e `TimeWithZone` receberam três novos métodos muito convenientes. Os métodos `today?`, `past?` e `future?` foram introduzidos em todas as classes que trabalham com datas e horas para facilitar nossa vida em algumas situações.

Acredito que não seja necessário explicar o funcionamento de cada um. Então vejamos os métodos em ação:

	date = Date.current
	# => Sat, 04 Oct 2008

	date.today?
	# => true

	date.past?
	# => false

	date.future?
	# => false

	time = Time.now
	# => Sat Oct 04 18:36:43 -0300 2008

	time.today?
	# => true
