## Nuova opzione :recursize per javascript\_include\_tag e stylesheet\_link\_tag

Ora gli helper `javascript_include_tag` e `stylesheet_link_tag` hanno la nuova opzione `:recursive`, che può essere usata insieme ad `:all`. Questa permette di caricare l'intero albero dei file con una sola linea di codice. Ad esempio, supponiamo di avere i seguenti file:

	public/javascripts/super_calendar/calendar.js
	public/stylesheets/super_calendar/calendar.css

Quando eseguiamo il seguente codice, entrambi i file vengono inclusi (anche se si trovano in sottodirectory):

	javascript_include_tag :all, :recursive => true
	stylesheet_link_tag :all, :recursive => true
