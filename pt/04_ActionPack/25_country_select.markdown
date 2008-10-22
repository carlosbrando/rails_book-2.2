## country\_select removido do Rails

O helper `country_select` foi removido do Rails. Para quem não se lembra, este método retorna uma lista com todos os países do mundo.

O motivo deste método ter sido removido do Rails é que ele foi atualizado para utilizar a norma ISO 3166 para os nomes dos países. O problema todo é que Taiwan, segundo a norma ISO 3166, se chama na verdade "Taiwan, Province of China". E foi exatamente assim que Michael Koziarski deixou no método.

Então, Jamis Buck questionou se não seria possível deixar apenas "Taiwan", já que o "Province of China" parece ser politicamente agressivo. No GitHub iniciou-se então uma série de comentários que foram entrando cada vez mais em questões politicas e deixando o técnico totalmente de lado.

Mas, Michael Koziarski foi categórico em afirmar que essas questões politicas estão muito além do que poderíamos resolver com uma simples alteração no código. E se aceitasse esta alteração, logo outras seriam solicitadas para países como Kosovo, Ossétia do Sul, Abecásia, Transnístria e uma longa lista.

A melhor solução, ou pelo menos a que geraria menos controvérsias, foi remover o helper do Rails e disponibiliza-lo na forma de um plugin. Desta forma qualquer um poderia facilmente criar um fork e montar sua própria lista da forma como mais lhe agradar.

Para instalar o plugin oficial:

`./script/plugin install git://github.com/rails/country_select.git`
