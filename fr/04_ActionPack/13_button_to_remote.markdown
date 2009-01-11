## button\_to\_remote

Si vous utilisez Rails depuis un moment, vous connaissez certainement la méthode `submit_to_remote`. Elle renvoie un bouton HTML qui soumet le formulaire avec **XMLHttpRequest**.

En Rails&nbsp;2.2, cette méthode a été renommée `button_to_remote`, pour une meilleure cohérence avec le nom de la méthode soeur `link_to_remote`.

Ceux qui veulent migrer leurs projets n'ont pas à s'inquiéter, puisque l'ancien nom (`submit_to_remote`) sera un alias du nouveau.