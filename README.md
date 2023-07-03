# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
    ruby 3.2.2

* Rails version
    Rails 7.0.5

* Datebase version
    psql (PostgreSQL) 10.22

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

# デプロイ

### XServerVPS
### OS再インストールの場合

# サーバーパネルで作業
サーバーをシャットダウンする

OS再インストール
- OS : Ubuntu 22.04(64bit)
- アプリケーション
  - 他のアプリケーションを表示する
    - プログラミングツール
      - Ruby on Rails を選択
- rootパスワード : 入力する
- SSH Key
   - キーを作成する
   - 自動生成
   - 名前 : 入力する

「確認画面へ進む」を押下

秘密鍵をダウンロードする

「再インストールする」を押下

サーバーを起動する

# ターミナルで作業
秘密鍵を移動する
```
mv /Users/ユーザー名/Downloads/秘密鍵名.pem /Users/ユーザー名/.ssh/
```
SSH接続する
```
ssh -i /Users/ユーザー名/.ssh/秘密鍵名.pem  root@IPアドレス
useradd ユーザー名
cat /etc/passwd
usermod -G sudo ユーザー名
cat /etc/group | grep ユーザー名
su ユーザー名 

```

# FTP転送する
リモートサイト : /home/rails


# rootではないユーザーで作業
```
cd /etc/nginx/conf.d/
cp /etc/nginx/conf.d/demo.conf /etc/nginx/conf.d/ファイル名.conf
```

```ファイル名.conf
server {
        listen 80;
        server_name IPアドレス;
        root /home/rails/JobMatchingApp/public;

        access_log /var/log/nginx/access.log;
        error_log /var/log/nginx/error.log;

        location / {
                try_files $uri $uri/index.html $uri.html @rails;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header Host $http_host;
        }

        location @rails {
                proxy_pass IPアドレス;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header Host $http_host;
        }
}
```

```ターミナル

```

エラー回避コマンド集
```
秘密鍵の削除
ssh-keygen -R IPアドレス
```
```
権限変更
chmod 777 対象ファイル
```
```
秘密鍵の権限変更
chmod 0600 秘密鍵名
```
```
Nginxアップデート
```
sudo apt info nginx
sudo apt update
cat /etc/lsb-release
※focalであることを確認する
```
```/etc/apt/sources.list.d/nginx.list
deb https://nginx.org/packages/ubuntu/ focal nginx 
deb-src https://nginx.org/packages/ubuntu/ focal nginx
```
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ABF5BD827BD9BF62
sudo apt update
sudo apt info nginx
sudo apt install nginx
sudo systemctl start nginx
sudo systemctl status nginx

worker_connections are not enoughエラー
worker_connectionsの値を変更する
```/etc/nginx/nginx.conf
worker_connections 2048;
gzip settingsを全て有効化
```
sudo systemctl restart nginx