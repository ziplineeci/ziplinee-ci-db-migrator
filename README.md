# Ziplinee CI 

The `ziplinee-ci-db-migrator` component is part of the Estafette CI system and is responsible for updating the database schema if needed.


## Ziplinee CI DB Migrator 

This component runs as a Kubernetes job to update the database schema if needed.

## Development

To start development run

```bash
git clone git@github.com:ziplineeci/ziplinee-ci-db-migrator.git
cd ziplinee-ci-db-migrator
```

To add a new migration script

```bash
go get -u github.com/pressly/goose/cmd/goose
cd migrations
goose -s create create_some_table sql
```

And then edit the newly created script in the migrations folder.

Before committing your changes run

```bash
go test ./...
go mod tidy
```
