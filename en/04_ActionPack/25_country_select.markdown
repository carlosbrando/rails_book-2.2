## country\_select removed from Rails

The `country_select` helper has been removed from Rails. For those who don't remember, this method returns a list with all the countries in the world.

The reason for this removal is that Rails has been updated to use the ISO 3166 standard for country names. The whole problem is that, according to the ISO 3166 standard, its actual name is "Taiwan, Province of China." And that was exactly how Michael Koziarski put it in the method.

Then, Jamis Buck asked if it might not be possible to render it simply as "Taiwan," since the "Province of China" part seemed politically aggressive. A series of comments ensued on Github that got more and more political and set the technical issues aside.

But Michael Koziarski has been categoric in affirming that these political issues are way beyond what we could hope to resolve with a simple code change. And if he accepted this alteration, soon others might be requested for countries like Kosovo, South Ossetia, Abecassia, Transnistria and a long list of others.

The better solution, or at least the one that would be less controversial, would be to remove the helper from Rails and make it available in the form of a plugin. This way, people can easily fork the code and create their own lists in whatever way they prefer.

To install the official plugin:

`./script/plugin install git://github.com/rails/country_select.git`
