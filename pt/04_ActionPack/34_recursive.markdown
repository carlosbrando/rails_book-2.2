## Nova opção :recursive para os helpers javascript\_include\_tag e stylesheet\_link\_tag

Os helpers `javascript_include_tag` e `stylesheet_link_tag` receberam uma nova opção `:recursive` que pode ser usada junto com `:all`, para que eles possam carregar toda a árvore de arquivos em uma única linha de código. Por exemplo, caso eu tenha os seguintes arquivos:

public/javascripts/super_calendar/calendar.js
public/stylesheets/super_calendar/calendar.css

Ambos estarão inclusos, mesmo estando em um subdiretório, quando eu executar os métodos da seguinte forma:

	javascript_include_tag :all, :recursive => true
	stylesheet_link_tag :all, :recursive => true
