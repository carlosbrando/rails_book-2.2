## Introduction

Ruby on Rails 2.2 déborde de nouvelles fonctionnalités, d'améliorations et de corrections de bugs. Dans ce livre, vous en trouverez une brève description ainsi qu'un exemple (le plus souvent) de chaque changement significatif de cette nouvelle version de Rails.

Écrire ce livre a représenté un travail conséquent et nous espérons qu'il vous aidera à tirer le maximum de chaque nouvelle fonctionnalité de Rails.

Avec cette nouvelle version, Rails est devenu polyglotte. Grâce au nouveau mécanisme d'internationalisation (i18n), vous pourrez facilement créer des applications pour les utilisateurs du monde entier.

Un gros travail a été accompli pour rendre Rails réentrant (*thread safe*) et aussi compatible que possible avec le future version 1.9 de Ruby. Un gros effort a été consenti pour le rendre plus compatible avec JRuby. Bien que le mode réentrant (*thread safe mode*) ne soit pas disponible partout – il ne fonctionne que sur des machines virtuelles qui supportent en natif les fonctions de processus légers (JRuby) — c'est un formidable ajout à Rails.

S'il a eu dans le passé des plaintes sur le manque de documentation dans Rails, elles devraient disparaître avec cette version. Un gros travail de documentation du code et d'explication des fonctionnalités de Rails a été effectué. Par exemple, exécutez cette commande dans une fenêtre :

**rake doc:guides**

Cette tâche `rake` crée un répertoire doc/guides à la racine de votre projet avec plusieurs guides pour vous aider à apprendre Rails.
