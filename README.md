# Payfy
## Introduction
**Payfy** is a back-end to make create raffle and join then

## Technologies
What was used:
- **[Docker](https://docs.docker.com)** and **[Docker Compose](https://docs.docker.com/compose/)** to create our development and test environments.
- **[Postgres](https://www.postgresql.org/)** to store the data and **[Ecto](https://hexdocs.pm/ecto/Ecto.html)** as a """ORM""" (but is not a ORM is a DSL).
- **[Ex_unit](https://hexdocs.pm/ex_unit/main/ExUnit.html)** to run tests.
- **[ASDF](https://asdf-vm.com/)** to manage multiple versions

# Getting Started
To get started, you should install **Docker**, **Docker Compose**, and **ASDF**.
Then, clone the repository:
```sh
git clone https://github.com/romulogarofalo/payfy
```
enter in the folder
```sh
cd payfy
```

run asdf to install elixir and erlang
```sh
asdf install
```

if the commnad above not work maybe you could need to add the elixir and erlang to asdf work (in the erlang there is some dependencies that you will need to install to work) **[more info here](https://github.com/asdf-vm/asdf-elixir)**
```sh
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git

```

You should run to download dependencies
```
mix deps.get
```
to install all the dependencies
## Running Locally
To run locally, simply run the following command:
```sh
docker-compose up
```
## Running Migrations
To setup the database, run the following command:
```sh
mix ecto.migrate
```
## Running Tests
To run the tests, run the following command:
```sh
mix test
```
## Running The Server
To run the tests, run the following command:
```sh
mix phx.server
```