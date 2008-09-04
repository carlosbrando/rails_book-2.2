## File.atomic\_write copia as permissões do arquivo original

Talvez alguns não conheçam o método `File.atomic_write`. Ele serve para escrever arquivos de forma atômica. Isto pode ser muito útil em situações onde você não quer que outros processos ou threads vejam um arquivo escrito pela metade.

	File.atomic_write("important.file") do |file|
	  file.write("hello")
	end

O que este método faz é criar um arquivo temporário enquanto você escreve nele, e quando terminar ele substitui o arquivo antigo pelo novo.

A novidade no Rails 2.2 é que agora este método copia todas as permissões do arquivo original antes de substitui-lo.
