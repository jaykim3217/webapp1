# users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| password_digest    | string | null: false |

- has_many :items
- has_many :orders
- has_many :comments


# items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| item_name          | string     | null: false |
| category_id        | integer    | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true |
| explain            | text       | null: false |
| brand              | string     | null: fals  |

- belongs_to :user
- belongs_to :category
- has_one :buy
- has_many :comments, dependent :destroy
- has_one_attached :image


# orders テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :address, dependent :destroy

# addresses テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| postal_code        | string     | null: false |
| region_id          | integer    | null: false |
| city               | string     | null: false |
| address_number     | string     | null: false |
| building           | string     |             |
| phone_number       | string     | null: false |
| order              | references | null: false, foreign_key: true |

- belongs_to :order
- belongs_to :region

# messages テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| text               | text       |             |
| user_id            | integer    |             |
| item_id            | integer    |             |

- belongs_to :user
- belongs_to :item

