# CLD2 Diet Tracker

## Description

Ce projet consiste à crée une application ruby avec sinatra pour faire du tracking alimentaire.

## Mise en route

### Prérequis

Listez toutes les dépendances et leur version nécessaires au projet en tant que :

- OS supportées :
  - [Debian 12 (bookworm)](https://www.debian.org/distrib/)
- Langage :
  - [Ruby (3.1.2)](https://www.ruby-lang.org/en/documentation/installation/)
- Extensions :
  - [RubyLSP (v0.8.16)](https://shopify.github.io/ruby-lsp/#with-vs-code)

### Configuration

1. Installer Ruby
   1. [macOS](https://www.ruby-lang.org/en/documentation/installation/#homebrew)
   2. [Windows](https://www.ruby-lang.org/en/documentation/installation/#winget)
   3. [Debian, Ubuntu, ...](https://www.ruby-lang.org/en/documentation/installation/#apt)
2. [Installer Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

Pour Git Flow, cela dépend du système d'exploitation que vous utilisez. Si vous utilisez Windows, tout va bien, il est déjà installé avec git. Pour les autres, [suivre ce tutoriel](https://skoch.github.io/Git-Workflow/).

Dans ce projet, j'ai utilisé Visual Studio Code comme IDE principal.

## Déploiement

### Environnement de développement

1. Cloner le dépôt git

```bash
git clone https://github.com/dieperid/diet-tracker-cld2.git
cd diet-tracker-cld2
```

2. Setup la branche `main` et initialiser Git Flow pour le projet

```bash
git switch main

git flow init
```

3. Mise en place de la base de données et des fichiers de configuration

> Créer le fichier de configuration pour MySQL et modifier le nom du fichier

```bash
cp config/database.example.yml config/database.yml

```

4. Installer les dépendances de MariaDB/MySQL

> MacOS :

```bash
brew install mariadb
```

> Linux :

```bash
sudo apt update
sudo apt install ruby-dev

sudo apt install libmariadb-dev
```

5. Installer les gems du projet

```bash
gem install bundler

bundle install
```

6. Base de données

   1. Créer et migrer la base de données SQL

   ```bash
   bundle exec rake db:create

   bundle exec rake db:migrate
   ```

   2. Seed la base de données

   ```bash
   bundle exec rake db:seed
   ```

7. Lancer le serveur Ruby

```bash
ruby app.rb
```

> http://127.0.0.1:4567/

## Structure des répertoires

```bash
./diet-tracker-cld2
├── app
│   ├── controllers                     # Controllers
│   ├── helpers                         # Controllers
│   ├── middlewares                     # Middlewares
│   ├── models                          # Models
│   ├── services                        # Services
│   └── views                           # Views
│       ├── consumptions
│       ├── food_entries
│       ├── login
│       ├── register
│       └── weights
├── app.rb                              # Point d'entrée de l'application
├── config                              # Configuration
│   ├── database.example.yml
│   └── irb.rb
├── db                                  # Database
│   ├── migrate                         # Migration
│   ├── schema.rb
│   └── seeds.rb
├── docs                                # Documentation
│   └── database.md
├── logs                                # Logs
│   └── 2025-xx-xx.log
├── Gemfile
├── Gemfile.lock
├── LICENSE
├── Rakefile
├── README.md
└── render-build.sh
```

## Collaborer

- Prenez le temps de lire le readme et de trouver la façon dont vous souhaitez aider les autres développeurs à collaborer avec vous.

- Ils ont besoin de savoir :
  - [Comment proposer une nouvelle fonctionnalité (issue, pull request)](https://github.com/dieperid/diet-tracker-cld2/issues)
  - [Comment écrire du code](https://github.com/rubocop/ruby-style-guide)
  - [Comment commit](https://www.conventionalcommits.org/en/v1.0.0/)
  - [Comment utiliser votre workflow - GitFlow](https://nvie.com/posts/a-successful-git-branching-model/)

## License

- [MIT License](LICENSE).

## Contact

- David : <david.dieperink@eduvaud.ch>, [GitHub](https://github.com/dieperid)
