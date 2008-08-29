## Fazendo uso da opção accessible em formulários

No capítulo sobre **ActiveRecord** comentei sobre a nova forma de atribuir valores à associações usando a opção **:accessible**.

Agora vou mostrar uma das grandes vantagens dessa novidade. Fazendo uso deste novo recurso podemos melhorar a forma como usamos o método **fields\_for**. Vamos pegar um exemplo, baseado nos códigos dados antes:

	<% form_for @post do |f| %>
	  <%= f.text_field :body %>
	  <% fields_for :author do |a_f| %>
	    <%= a_f.text_field :name %>
	  <% end %>
	  <%= submit_tag %>
	<% end %>

Estou usando o método **fields\_for** para acrescentar o nome do autor na página de criação de posts. Agora vem a melhor parte, veja como ficaria a criação do post e do autor usando este novo recurso:

	class PostController < ApplicationController

	  def new
	    @post = Post.create(params[:post])
	    respond_to do |wants|
	      ...
	    end
	  end
	end

Veja que estou usando apenas o método **create** do objeto **Post**. Como foi definido a opção **:accessible** do relacionamento deste objeto com o objeto **Author** como verdadeiro (**true**), a criação do autor é automática e transparente.
