## Associazioni belongs\_to automatiche nella generazione degli scaffold

Se state già utilizzando Rails 2.2 provate ad eseguire il seguente comando per creare un nuovo modello:

	./script/generate scaffold comment author:string body:text post:references

Notate come abbiamo indicato che comments ha un riferimento alla tabella `posts`, oppure &mdash; detto il altri termini &mdash; che un commento appartiene (`belongs_to`) ad un post. Ora osservate il file generato per il modello (**app/models/comment.rb**):

	class Comment < ActiveRecord::Base
	  belongs_to :post
	end

La relazione tra le due tabelle è stata automaticamente aggiunta al modello. Questa è una nuova funzionalità della versione 2.2.
