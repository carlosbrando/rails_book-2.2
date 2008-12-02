## Supporto per le espressioni regolari in time\_zone\_select

Nella classe `TimeZone` di `ActiveSupport` c'è il metodo `us_zones` che restituisce una lista (generata dinamicamente) con tutti i fusi orari degli Stati Uniti.

Il problema è che talvolta vorreste sviluppare software per altri paesi, ma non esiste un metodo analogo per generare i fusi orari.

C'è stato un lungo dibattito sulla possibilità di create o meno metodi tipo `african_zones`, `american_zones`, etc. In ogni caso, è prevalsa la soluzione seguente.

`TimeZone` adesso supporta anche il metodo `=~` in modo tale da poter generare una lista di fusi orari a partire da una espressione regolare. Anche il metodo `time_zone_select` è stato aggiornato per funzionare con tali modifiche.

Adesso potete fare qualcosa del genere:

	<%= time_zone_select( "user", 'time_zone', /Australia/) %>

Il precedente codice restituisce tutti i fusi orari, ma pone i seguenti in cima alla lista:

	(GMT +08:00) Perth
	(GMT +09:30) Adelaide
	(GMT +09:30) Darwin
	(GMT +10:00) Brisbane
	(GMT +10:00) Canberra
	(GMT +10:00) Hobart
	(GMT +10:00) Melbourne
	(GMT +10:00) Sydney

Per approfondimenti su `TimeZone` suggeriamo di vedere l'episodio 106 di RailsCasts (http://railscasts.com/episodes/106).