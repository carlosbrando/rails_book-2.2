## Nuovo metodo: Object#present?

E' stato aggiunto un nuovo metodo alla class base Object. Il metodo `present?` è equivalente all'espressione `!Object#blank?`.

In altri termini, un oggetto è "presente" se non è vuoto. Ma cosa è esattamente un oggetto vuoto?

	class EmptyTrue
	  def empty?() true; end
	end

	a = EmptyTrue.new
	b = nil
	c = false
	d = ''
	e = '   '
	g = "  \n\t  \r "
	g = []
	h = {}

	a.present? # => false
	b.present? # => false
	c.present? # => false
	d.present? # => false
	e.present? # => false
	f.present? # => false
	g.present? # => false
	h.present? # => false

Tutti questi oggetti sono vuoti, ovvero non sono "presenti".

Ma occorre fare attenzione, ciò ha generato una certa confusione. Negli esempi seguenti vengono illustrati alcuni oggetti che NON sono vuoti, ovvero sono "presenti":

	class EmptyFalse
	  def empty?() false; end
	end

	a = EmptyFalse.new
	b = Object.new
	c = true
	d = 0
	e = 1
	f = 'a'
	g = [nil]
	h = { nil => 0 }

	a.present? # => true
	b.present? # => true
	c.present? # => true
	d.present? # => true
	e.present? # => true
	f.present? # => true
	g.present? # => true
	h.present? # => true

Ogni oggetto che contiene un valore è "presente", e ciò è vero anche per un array che contiene solo `nil` perché tale array è non vuoto.

