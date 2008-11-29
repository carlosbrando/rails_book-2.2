## Path delle viste completo nelle eccezioni

Quando un'eccezione viene sollevata nell'ambiente di sviluppo (development), le vostre viste mostrano un messaggio del genere:

	NoMethodError in Administration/groups#show
	Showing app/views//_list.erb where line ...

Ma sarebbe bello avere un messaggio con il path completo del file che ha generato l'eccezione:

	NoMethodError in Administration/groups#show
	Showing app/views/administration/reports/_list.erb where line ...

Per rendervi la vita più semplice, questo problema è stato risolto nella nuova versione di Rails.