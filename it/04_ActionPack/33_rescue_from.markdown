## Migliorie per catturare gli errori

La peggiore cosa che possa capitare alla vostra applicazione è quell'orribile pagina di errore (di Rails, NdT). E' sempre meglio essere pronti per tale evenienza. Adesso è possibile presentare una opportuna pagina di errore quando la vostra applicazione solleva un'eccezione. Si usa il metodo `rescue_from`, esempio:

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

L'aggiunta di `ActiveSupport:Rescuable` permette ad ogni classe di includere la funzionalità `rescue_from`.