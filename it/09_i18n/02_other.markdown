## Supporto alla pluralizzazione nei metodi di internazionalizzazione

Talvolta alcune traduzioni dipendono da un numero o una quantità. E' uno scenario tanto comune che il package per l'internazionalizzazione ha dovuto necessariamente tenerne conto.

Ad esempio, nel metodo `distance_in_words` (riferita al tempo, NdT), la frase "1 secondo" funziona bene quando il tempo è minore o uguale ad uno, ma deve essere pluralizzata quando il tempo è più lungo.

Nei file di localizzazione potete internazionalizzare le frasi che nella vostra applicazione dipendono da una quantità, come in questo caso:

	datetime:
	  distance_in_words:
	    x_seconds:
	      one: "1 secondo"
	      other: "{{count}} secondi"

E' un'utile funzionalità utilizzata in diversi metodi nativi di Rails, e che potete utilizzare nei vostri metodi.
