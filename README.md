# Roda API

Example of simple API with Roda.

## Project stack

- CI: `circleci`
- Loader: `dotenv`, `zeitwerk`, `listen`
- Database: `rom`, `rom-sql`, `pg`
- Service objects: `dry-rb`
- Router: `roda`

## App loading features

- Autoloading
- Hot reload for app in development environment

## Rake tasks for DB manipulations

```bash
rake db:create_migration[create_users]
rake db:migrate
rake db:clean
rake db:reset
rake db:create RACK_ENV=test
rake db:drop RACK_ENV=test
```

## Console for development environment

```bash
bin/console
```

## Endpoints

`POST /users/create`
