## Suporte à opção :limit no método update_all

O método `update_all` agora também funciona com a opção `:limit`. Isto é muito bom porque garante que ao usar o `update_all` em associações `has_many` que façam uso da opção `:limit` tudo funcionará adequadamente.
