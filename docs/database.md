# Documentation base de données

## Notes

Les utilisateurs sont stockés dans une base de données MySql (MariaDB).

## MCD

```mermaid
---
title: CLD2-MCD
---
classDiagram
    note "Project: CLD2 \n
    Title: CLD2-MCD \n
    Authors: DIEPERINK David \n
    Version: 1.1 \n"

    class Utilisateur {
        numéro de l'utilisateur$
        nom
        email
        mot de passe
    }

    class Consommation {
        numéro de consommation$
        date de consommation
        quantité
    }

    class Poids {
        numéro du poids$
        poids
        date d'entrée
    }

    class Aliment {
        numéro de l'aliment$
        nom
        calories
        glucides
        lipides
        protéines
        visibilité de l'aliment
        image
    }

    Utilisateur "1-N" -- "1-1" Poids : possède
    Utilisateur "0-N" -- "1-1" Consommation : effectue
    Utilisateur "0-N" -- "1-1" Aliment : crée
    Aliment "0-N" -- "1-1" Consommation : contenu

```

## MLD

## Logical Data Model

```mermaid
---
title: CLD2-MLD
---
classDiagram
	note "Project: CLD2 \n
    Title: CLD2-MLD \n
    Authors: DIEPERINK David \n
    Version: 1.1 \n"

    class users {
        PK(id)
        bigint id$
        varchar name
        varchar email
        varchar password

        datetime created_at
        datetime updated_at
    }

    class consumptions {
        PK(id)
        FK(user_id, food_entry_id)
        bigint id$
        bigint user_id
        bigint food_entry_id
        datetime consumption_date
        int quantity

        datetime created_at
        datetime updated_at
    }

    class food_entries {
        PK(id)
        FK(user_id)
        bigint id$
        bigint user_id
        varchar name
        float calories
        float carbs
        float proteins
        float fats
        bool public
        text image

        datetime created_at
        datetime updated_at
    }

    class weights {
        PK(id)
        FK(user_id)
        bigint id$
        bigint user_id
        float weight
        date date

        datetime created_at
        datetime updated_at
    }

    users --|> weights
    users --|> consumptions
    users --|> food_entries
    food_entries --|> consumptions
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
