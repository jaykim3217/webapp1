class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  has_one :order
  has_many :comments

  has_one_attached :image

  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :image, presence: true
  validates :item_name, presence: true
  validates :explain, presence: true
  validates :brand, presence: true
  validates :price , presence: true, numericality: { greater_than_or_equal_to: 500, less_than_or_equal_to: 9_999_999, only_integer: true }
end
