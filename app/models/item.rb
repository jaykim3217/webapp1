class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user

  has_one_attached :image

  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :image, presence: true
  validates :item_name, presence: true
  validates :explain, presence: true
  validates :brand, presence: true
end
