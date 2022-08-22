 [![Coverage](https://luankjs.github.io/lawyer-agenda/badge.svg)](https://github.com/luankjs/lawyer-agenda)

# README

## Description

Project developed with the aim of fulfilling the requirements of the configuration management and software testing discipline of the TST-IMD IT residency.

The application proposes to consume the TST's schedules and trials data API.

### Ruby version
`2.7.0`

### System dependencies

#### Rails
```sh
gem install rails
```

#### Postgresql
```sh
sudo apt -y install postgresql postgresql-contrib

sudo passwd postgres

sudo service postgresql start

sudo -sudo -u postgres psql
# postgres=# CREATE ROLE your_username;
# postgres=# ALTER ROLE your_username WITH LOGIN SUPERUSER INHERIT CREATEDB CREATEROLE REPLICATION;
# postgres=# SET ROLE your_username;
# postgres=# GRANT postgres TO your_username;
# postgres=# CREATE DATABASE your_username ENCODING 'UTF8' TEMPLATE template0 OWNER your_username;
# postgres=# \q
```
Tip: change `your_username` above to **your username** and substitute the line `username: postgres` on `config/database.yml` to same user. 

#### libpq-dev
```sh
sudo apt install libpq-dev
```

### Configuration
```sh
gem install bundler:2.2.14

bundle install
```

### Database creation & initialization
```sh

rails db:setup

rails db:migrate
```

### How to run the test suite
```sh
rspec
```

### How to run the extractor
Open rails console:
```sh
rails console
```
Run the extractor:
```sh
SchedulesExtractor.new.call()
```


### Staff
### Autores:
* Hugo Oliveira - [hugotho](https://github.com/hugotho)
* Luan Santos - [luankjs](https://github.com/luankjs)
* José Victor - [ZeVit0r](https://github.com/ZeVit0r)
* Paulo Henrique - [ppaulohh](https://github.com/ppaulohh)
