class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  has_one :order
  has_many :comments, dependent: :destroy

  has_many_attached :images

  validates :category_id, presence: true, numericality: { other_than: 1 , message: "を入力してください"}
  validates :images, presence: true
  validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }
  validates :item_name, presence: true
  validates :explain, presence: true
  validates :brand, presence: true
  validates :price , presence: true, numericality: { greater_than_or_equal_to: 500, less_than_or_equal_to: 9_999_999, only_integer: true }
end
