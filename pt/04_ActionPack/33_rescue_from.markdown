## Uma maneira melhor de interceptar erros

A pior coisa que pode acontecer em nossa aplicação é uma horrível página com uma mensagem de erro. Por este motivo é sempre bom se preparar para estes casos. Agora podemos facilmente mostrar uma página de erro customizada para exceções lançadas quando estamos roteando uma requisição, usando o método `rescue_from`. Veja um exemplo:

	class ApplicationController < ActionController::Base
	  rescue_from User::NotAuthorized, :with => :deny_access
	  rescue_from ActiveRecord::RecordInvalid, :with => :show_errors

	  protected
	  def deny_access
	    …
	  end

	  def show_errors(exception)
	    exception.record.new_record? ? …
	  end
	end

A adição de `ActiveSupport:Rescuable` permite qualquer classe de fazer mixin da sintaxe `rescue_from`.