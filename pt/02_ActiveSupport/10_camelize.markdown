## camelize(:lower)

Por padrão o método `camelize` do Rails é usado para converter string para o formato **UpperCamelCase**. Mas também podemos converter para o formato **lowerCamelCase** se usarmos o argumento `:lower`. Porém, tente executar o código abaixo no terminal de um projeto Rails (menor ou igual ao 2.1.1):

	'Capital'.camelize(:lower)
	# => "Capital"

Como você pode ver, a letra ‘C’ no ínicio da palavra não retornou minúscula como deveria. Isto foi corrigido. Veja o retorno do mesmo trecho de código, agora executado no Rails 2.2:

	'Capital'.camelize(:lower)
	# => "capital"
