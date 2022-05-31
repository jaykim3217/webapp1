class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---'},
    { id: 2, name: 'ベッド'},
    { id: 3, name: 'ソファ'},
    { id: 4, name: 'テーブル・食卓・机'},
    { id: 5, name: 'テレビ台・リビング収納'},
    { id: 6, name: '棚・ラック'},
    { id: 7, name: 'ハンガー・クロゼット'},
    { id: 8, name: '椅子'},
    { id: 9, name: 'キッズ家具'},
    { id: 10, name: 'アウトドア家具'},
    { id: 11, name: 'その他'}
  ]

  include ActiveHash::Associations
  has_many :items

end