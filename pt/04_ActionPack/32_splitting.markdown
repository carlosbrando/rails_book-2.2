## Evitando ataques Response Splitting

Até agora no Rails as URLs passadas para o método `redirect_to` não passavam por um processo de santization. Isto era perigoso, pois abria brechas para que pessoas mal intencionadas pudessem realizar ataques do tipo **response splitting** e **header injection** em sua aplicação.

Um exemplo desta vulnerabilidade é quando seu aplicativo recebe uma URL via query string e redireciona seu usuário através do método `redirect_to` para esta URL. Através desta brecha de segurança pessoas mal intencionadas podem gravar cookies na máquina e forjar falsos responses para seus usuários se o seu projeto usar estes parâmetros para construir cabeçalhos HTTP.

Para evitar este tipo de problema o Rails foi atualizado para limpar (sanitize) todas as URLs passadas para o método `redirect_to`. Mas isto não significa que não precisamos nos preocupar mais com este problema, é sempre bom ficar atento.
