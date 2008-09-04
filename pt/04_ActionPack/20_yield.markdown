## Aumentando as possibilidades com partials

Vamos pegar o seguinte exemplo:

	<!-- Arquivo _layout.html.erb -->
	inicio
	<%= yield %>
	fim

	<!-- uma view qualquer -->
	<%= render :layout => 'layout' do %>
	meio
	<% end %>

O resultado deste código seria:

	inicio
	meio
	fim

No exemplo acima estou incluindo uma partial dentro da minha view e usando o método `yield` para personalizar o conteúdo, que é passado dentro de um bloco através do método `render`.

Porém, até agora você não podia passar nenhum argumento dentro do bloco. No Rails 2.2. isto será possível. Você poderá fazer coisas realmente legais. Veja um exemplo usando uma coleção de livros:

	<!-- app/views/books/_book.html.erb -->
	<div class="book">
	  Price: $<%= book.price %>
	  <%= yield book %>
	</div>

	<!-- app/views/books/index.html.erb -->
	<% render :layout => @books do |book| %>
	  Title: <%= book.title %>
	<% end %>

Isto devolveria algo como:

	<div class="book">
	  Price: $29.74
	  Title: Advanced Rails
	</div>

Veja que dentro do bloco estou informando o título do livro, mas em uma outra view eu poderia informar também a quantidade em estoque ou outras informações relevantes, sempre usando a mesma partial.

Você também poderia usar a mesma partial várias vezes na mesma view e usar blocos para diferenciar as seções dentro da página, por exemplo:

	<!-- app/views/books/_book.html.erb -->
	<div class="book">
	  <%= yield book, :header %>
	  Price: $<%= book.price %>
	  <%= yield book, :footer %>
	</div>

	<!-- app/views/books/index.html.erb -->
	<% render :layout => @books do |book, section| %>
	  <%- case section when :header -%>
	    Title: <%= book.title %>
	  <%- when :footer -%>
	    (<%= book.reviews.count %> customer reviews)
	  <%- end -%>
	<% end %>
