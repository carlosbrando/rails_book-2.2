## Più funzionalità per i partials

Osservate i seguenti esempi:

	<!-- _layout.html.erb -->
	beginning
	<%= yield %>
	ending

	<!-- some view -->
	<%= render :layout => 'layout' do %>
	middle
	<% end %>

L'output di questo codice è:

	beginning
	middle
	ending

Nel precedente esempio stiamo includendo un partial all'interno della nostra vista utilizzando il metodo `yield` per modificarne il contenuto, specificato all'interno del blocco passato al metodo `render`.

Fino ad ora, comunque, non potevate passare alcun argomento al blocco. In Rails 2.2 ciò è possibile. Potete realizzare cose carine. Osservate il seguente esempio di una collezione di libri:

	<!-- app/views/books/_book.html.erb -->
	<div class="book">
	  Price: $<%= book.price %>
	  <%= yield book %>
	</div>

	<!-- app/views/books/index.html.erb -->
	<% render :layout => @books do |book| %>
	  Title: <%= book.title %>
	<% end %>

Restituisce qualcosa del genere:

	<div class="book">
	  Price: $29.74
	  Title: Advanced Rails
	</div>

Notate come, all'interno del blocco, abbiamo indicato il title de libro, ma in un'altra vista possiamo anche aggiungere altre informazioni, sempre con la medesima tecnica. 

Potete anche utilizzare lo stesso partial più volte nella medesima view, e utilizzare i blocchi per distinguere tra le sezioni della pagina. Esempio:

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