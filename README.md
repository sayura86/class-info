# Name（TOPIC SCHOOL）
 
TOPIC SCHOOLとは学校のおたより掲示板という意味で名前をつけました。
 
# 概要
 
毎日の学校のおたよりや連絡を投稿して確認できるアプリです。
 
# 制作背景(意図)
 
毎日の学校のおたよりの大変を解消するアプリを作成したいと思いました。<br>

大変なこと<br>
1.毎日複数枚のおたより管理<br>
2.こどもが紛失したのか持って帰ってこない<br>
3.紛失した場合、おたよりの存在をそもそも知らないため家庭で準備するものや役割があった場合対応できない<br>
4.紙資源がもったいない<br>

# DEMO
[![Image from Gyazo](https://i.gyazo.com/3368ff32aade1f75a51ec02a2bbe62be.gif)](https://gyazo.com/3368ff32aade1f75a51ec02a2bbe62be)
 
# 実装予定の内容

・投稿の編集・削除機能の追加<br>
・こどもの作品掲示機能の追加<br>

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :topics
- has_many :posts

## topic テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| title  | string     | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association

- has_many :users
- has_many :posts

## post テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| topic   | references | null: false, foreign_key: true |
| content | string     | null: false                    |

### Association

- belongs_to :topic
- belongs_to :user
- has_one_attached :image
