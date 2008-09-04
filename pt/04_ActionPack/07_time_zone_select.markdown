## Suporte a expressões regulares no time\_zone\_select

Na classe `TimeZone` do `ActiveSupport` existe o método `us_zones` que convenientemente retorna uma lista dinâmica com todos os fusos-horários americanos.

O problema é que em alguns casos vamos desenvolver software para pessoas em outros países, mas não existe um método tão conveniente assim que liste os fusos-horários destes países.

Houve uma longa discussão sobre criar ou não métodos como `african_zones`, `american_zones`, etc.. No fim prevaleceu o seguinte:

Foi implantado no objeto `TimeZone` o suporte para `=~` afim de ajudar a montar uma lista de fusos-horários a partir de uma expressão regular. Além disso o método `time_zone_select` foi alterado para trabalhar em conjunto com esta novidade.

Agora podemos fazer isto:

	<%= time_zone_select( "user", 'time_zone', /Brasilia/) %>

Para aprender mais sobre `TimeZones`, aconselho assistir ao episódio 106 do RailsCasts (http://railscasts.com/episodes/106) e dar uma olhada no livro antecessor a este.
