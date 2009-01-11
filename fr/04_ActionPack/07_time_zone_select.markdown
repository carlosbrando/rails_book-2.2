## Support des expressions régulières dans time\_zone\_select

Dans la classe `TimeZone` d'`ActiveSupport`, il y a une méthode `us_zones` qui renvoie une liste de tous les fuseaux horaires des USA.

Le problème est que vous voulez parfois développer du logiciel pour d'autres pays, mais qu'il n'y a pas de méthode équivalente qui liste les fuseaux horaires de ces pays.

Il y a eu un long débat sur la création ou non de méthodes comme `african_zones`, `american_zones`, etc. Finalement, la solution suivante a été adoptée.

`TimeZone` supporte maintenant `=~` qui permet de produire une liste de fuseaux horaires à partir d'une expression régulière. La méthode `time_zone_select` a aussi été mise à niveau.

Vous pouvez maintenant faire comme ceci&nbsp;:

	<%= time_zone_select( "user", 'time_zone', /Australia/) %>

Le code ci-dessus renvoie tous les fuseaux horaires, mais place les suivants en tête de liste&nbsp;:

	(GMT +08:00) Perth
	(GMT +09:30) Adelaide
	(GMT +09:30) Darwin
	(GMT +10:00) Brisbane
	(GMT +10:00) Canberra
	(GMT +10:00) Hobart
	(GMT +10:00) Melbourne
	(GMT +10:00) Sydney

Pour en savoir plus sur `TimeZones`, Je vous suggère de regarder l'épisode&nbsp;106 de RailsCasts (http://railscasts.com/episodes/106) et de lire le livre précédent celui-ci.