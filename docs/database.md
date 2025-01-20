# Documentation base de données

## Notes

Les utilisateurs sont stockés dans une base de données MySql (MariaDB).

## MCD

```mermaid
---
title: CLD2-DDK-MCD
---
classDiagram
    note "Project: CLD2 \n
    Title: DDK_CLD2-MCD \n
    Authors: DIEPERINK David \n
    Version: 1.0 \n"

    class Utilisateur {
        numéro de l'utilisateur$
        nom
        email
        mot de passe
        date de création
        date de modification
    }
```

## MLD

## Logical Data Model

```mermaid
---
title: CLD2-DDK-MLD
---
classDiagram
	note "Project: CLD2 \n
    Title: DDK_CLD2-MLD \n
    Authors: DIEPERINK David \n
    Version: 1.0 \n"

    class users {
        PK(id)
        bigint id$
        varchar name
        varchar email
        varchar password
        datetime created_at
        datetime updated_at
    }
```

## Rake

> Documentation de rake : https://ruby.github.io/rake/

### Création

```bash
bundle exec rake db:create
```

### Run les migrations

```bash
bundle exec rake db:migrate
```
