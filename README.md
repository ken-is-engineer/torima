# テーブル設計


## users テーブル
| Column                | Type           | Options                       |
| --------------------- | -------------- | ----------------------------- |
| email                 | string         | null: false, unique: true     |
| encrypted_password    | string         | null: false                   |
| name                  | string         | null: false                   |

### user Association
- has_many :flags
- has_one  :list


## flags テーブル
| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| status        | string        | null: false                    |
| date          | datetime      | null: false                    |
| user          | references    | null: false, foreign_key: true |

### flags Association
- belongs_to   :user
- has_many     :list_flags
- has_many     :lists, through: :list_flags


## lists テーブル
| Column      | Type          | Options                        |
| ----------- | ------------- | ------------------------------ |
| user        | references    | null: false, foreign_key: true |
| flag        | references    | null: false, foreign_key: true |

### lists Association
- belongs_to :user
- has_many   :list_flags
- has_many   :flags, through: :list_flags


## list_flags テーブル
| Column      | Type          | Options                        |
| ----------- | ------------- | ------------------------------ |
| list	      | references	  | null: false, foreign_key: true |
| flag	      | references    | null: false, foreign_key: true |

### list_flags Association
- belongs_to :list
- belongs_to :flag