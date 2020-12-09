# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| username           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |


  ## Association
  - has_many :dictionaries, dependent: :destroy
  - has_many :bookmarks, dependent: :destroy
  - has_many :bookmark_dictionaries, through: :bookmarks, source: :dictionary
  - has_many :comments, dependent: :destroy



## dictionaries テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| word               | string     | null: false                    |
| meaning            | string     | null: false                    |
| pronunciation      | string     | null: false                    |
| speech_id          | integer    | null: false                    |
| level_id           | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |
| definition         | text       | null: false,                   |

   ## Association
  - belongs_to :user
  - belongs_to_active_hash :speech
  - belongs_to_active_hash :level
  - has_one_attached :image
  - has_many :bookmarks, dependent: :destroy
  - has_many :comments, dependent: :destroy


## comments テーブル
| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user_id            | references | null: false, foreign_key: true|
| dictionary_id      | references | null: false, foreign_key: true|
| content            | text       | null: false                   |


 ## Association
 - belongs_to :user
 - belongs_to :dictionaries

## bookmark テーブル
| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user_id            | references | null: false, foreign_key: true|
| dictionary_id      | references | null: false, foreign_key: true|

 ## Association
 - belongs_to :user
 - belongs_to :dictionaries


