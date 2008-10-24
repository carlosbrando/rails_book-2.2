## Introdução

O Ruby on Rails 2.2 está cheio de novidades, incluindo novas funcionalidades, melhorias e correções de bugs antigos. Neste livro você encontrará uma breve descrição, acompanhada de um exemplo (na maioria dos casos) de cada uma das principais novidades deste versão.

Escrever este livro foi um trabalho gigantesco, por isto espero que ele lhe seja muito útil, ajudando-o a usar mais plenamente cada novo recurso incluído no Ruby on Rails.

À partir desta versão o Rails passa a ser políglota. Fazendo uso do novo sistema de internacionalização (i18n) podemos construir aplicativos para usuários do mundo com pouquíssimo esforço.

Muito trabalho foi feito para deixar o Rails thread-safety e o mais preparado possível para o futuro Ruby 1.9. Também houve uma preocupação grande para deixá-lo mais compatível com o JRuby. Embora o recurso de thread-safe ainda não esteja disponível para todos nós, já que ele apenas funcionará em máquinas virtuais com suporte a threads nativas, como o JRuby por exemplo, ele é uma grande adição ao framework.

Se no passado houve muita reclamação quanto a documentação do Rails, agora nínguem poderá mais reclamar. Um grande trabalho foi feito para documentar o código e as funcionalidades do Rails. Quer um exemplo? Execute no terminal:

**rake doc:guides**

Esta tarefa criará uma pasta doc/guides na raiz do seu projeto com vários guias para auxiliá-lo durante o aprendizado do Rails.