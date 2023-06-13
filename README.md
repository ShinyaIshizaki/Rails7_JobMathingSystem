# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

---

# 環境構築

### ubunt22.04の場合

```

git clone https://github.com/ShinyaIshizaki/JobMatchingSystem.git

cd JobMatchingSystem

sudo apt install sqlite3 libsqlite3-dev

sudo apt install npm

sudo apt install git curl libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev

curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc

echo 'eval "$(rbenv init -)"' >> ~/.bashrc

source ~/.bashrc

type rbenv

rbenv install 3.2.2

ruby -v

cd

. .bashrc

rbenv global 3.2.2

echo "gem: --no-document" > ~/.gemrc

gem install bundler

gem update --system 3.4.13

gem install rails

rbenv rehash

sudo apt install libpq-dev

bundle install --gemfile /root/JobMatchingSystem/Gemfile

rails server --binding="XXX.XXX.XXX.XXX"

```

これでサーバーは起動するが、DBができてないためアクセスするとエラーになる。
対応は以下。

```
sudo -i -u postgres

psql

create role root with createdb login Superuser password 'password';

alter role root set SUPERUSER;

alter role root with CREATEROLE;

alter role root with INHERIT;

create database scaffold_development

rails db:migrate

rails server --binding="XXX.XXX.XXX.XXX"

http://XXX.XXX.XXX.XXX/jobs

```
