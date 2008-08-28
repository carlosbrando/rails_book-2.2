## Novo método Object#present?

Um novo método foi acrescentado à classe **Object**. O método **present?** é o equivalente a **!Object#blank?**.

Em outras palavras um objeto está presente se ele não for vazio. Mas o que é um objeto vazio?

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

Todos estes objetos são vazios ou não estão presentes.

Mas, muito cuidado, algumas pessoas tem confundido as coisas. Veja alguns exemplos de objetos que NÃO estão vazios, ou seja, estão presentes:

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

Qualquer objeto que contenha um valor, está presente, isto vale até mesmo para um **Array** preenchido com um **nil**, porque o **Array** não está vazio.
