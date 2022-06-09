# Project
- これまでプログラミング勉強をした知識を活かせたWEBアプリケーション。
- User管理機能と商品を出品して購入までできる機能でMVCとCRUDを確実に理解。
- 開発期間：5月27日 ~ 6月10日予想。
- 一人でFront-End,Back-Endを0からやってみる。

---------

# Technologies

## FrontEnd
- Html
- Css
- Javascript

## BackEnd
- Ruby on Rails
- MySQL

## Common
- AWS(S3)
- PAY.JP
- Git, Github

---------

# 実装内容

## User管理機能

- nameが必須であること。
- emailが必須であること。
- emailは、＠と.を含む必要があること。
- emailは一意性であること。
- passwordが必須であること。
- passwordは６文字以上で入力が必須であること。
- passwordは半角英数字混合での入力が必須であること。
- passwordとpassword confirmationは一致するのが必須であること。
- loginしたらhomepageに移動。
- logoutしたら"you have successfully logout"と一緒にログイン画面に移動。
- 

## 商品管理機能

### index

- 商品一覧表示ページは、ログイン状況に関係なく、誰でも見ることができること。
- 出品されている商品が一覧で表示されること。
- 左上から、出品された日時が新しい順に表示されること。
- 売却済みの商品は画面上に表示されないこと。
- 商品をクリックしたら詳細ページに移動すること。

### new

- 必要な情報を適切に入力して「出品する」ボタンを押すと、商品情報がデータベースに保存されること。
- ログインしている状態の上で、出品ページに移動できること。
- ログインしていない状態で出品ページに移動すると、"you have to login"と一緒にログインページに移動しようとすること。
- 商品画像を1枚つけることが必須であること。
- Javascriptを利用して写真のpreview機能実装。
- 商品名が必須であること。
- 商品の説明が必須であること。
- カテゴリーの情報が必須であること。
- カテゴリーは -- では出品できないこと。
- 価格の情報が必須であること。
- 価格は、¥300~¥9,999,999の間のみ保存可能であること。
- 価格は半角数値のみ保存可能であること。
- 入力に問題がある状態で「出品する」ボタンが押された場合、情報は保存されず、出品ページに戻りエラーメッセージが表示されること
- 出品が完了したら、トップページに遷移すること。

### show

- ログインしないと商品の詳細ページに移動できないこと。
- ログインした上で、自身が出品した商品の場合のみ、編集・削除ボタンが表示されること。
- ログインした上で、自身が出品しいない商品の場合にのみ、購入ボタンが表示されること。
- 商品の写真、ブランド名、商品名、カテゴリー、価格、出品者のname、説明が表示されること。
- コメント作成することができる。
- Javascriptを利用してページをリロードしなくてもコメントが表示される。

### edit

- 必要な情報を適切に入力して「変更する」ボタンを押すと、商品情報（商品画像・商品名・商品の状態など）を編集できること。
- 何も編集せずに「変更する」ボタンを押しても、画像無しの商品にならないこと。
- ページ下部の「もどる」ボタンを押すと、編集途中の情報は破棄され、商品詳細表示ページに遷移すること。
- ログイン状態の場合は、自身が出品した販売中商品の商品情報編集ページに遷移できること。
- ログイン状態の場合でも、自身が出品した売却済み商品の商品情報編集ページへ遷移しようとすると、トップページに遷移すること。
- ログイン状態の場合でも、自身が出品していない商品の商品情報編集ページへ遷移しようとすると、商品の販売状況に関わらずトップページに遷移すること。
- ログアウト状態の場合は、商品情報編集ページへ遷移しようとすると、商品の販売状況に関わらずログインページに遷移すること。
- 入力に問題がある状態で「変更する」ボタンが押された場合、情報は保存されず、編集ページに戻りエラーメッセージが表示されること。

### destroy

- ログイン状態の場合にのみ、自身が出品した商品情報を削除できること。
- 削除が完了したら、トップページに遷移すること。

## 購入機能

- 必要な情報を適切に入力して「購入」ボタンを押すと、商品の購入ができること。
- ログイン状態の場合は、自身が出品していない販売中商品の商品購入ページに遷移できること。
- ログイン状態の場合でも、自身が出品していない売却済み商品の商品購入ページへ遷移しようとすると、トップページに遷移すること。
- ログアウト状態の場合は、商品購入ページに遷移しようとすると、商品の販売状況に関わらずログインページに遷移すること。
- 購入が完了したら、トップページに遷移すること。
- 入力に問題がある状態で「購入」ボタンが押された場合、情報は受け入れられず、購入ページでエラーメッセージが表示されること。
- PAY.JPのAPIを導入して購入機能実装。

## header

- logoの文字をクリックするとホームページに移動すること。
- ログアウトしている時には、ログインボタンと会員登録ボタンが表示されること。
- ログインしている時には、ユーザーの名前とログアウトボタンが表示されること。

---------

# Database

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| password_digest    | string | null: false |

- has_many :items
- has_many :orders
- has_many :comments


## items テーブル

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


## orders テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :address, dependent :destroy

## addresses テーブル

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

## messages テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| text               | text       |             |
| user_id            | integer    |             |
| item_id            | integer    |             |

- belongs_to :user
- belongs_to :item
