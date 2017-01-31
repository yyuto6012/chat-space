# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

#テーブル設計

###テーブル名
- カラム名 型 制約

###users
- id integer
- name string null: false
- email string unique: true
- password string null: false

###groups
- id integer
- name string null: false

###chat_users
- id integer
- user_id integer foreign_key: true
- group_id integer foreign_key: true

###msgs
- id string
- body text null: false
- image string
- group_id integer foreign_key: true
- user_id integer foreign_key: true


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
