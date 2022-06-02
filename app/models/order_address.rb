class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :city, :address_number, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'をハイフン(-)を含めて正しく入力してください' }
    validates :region_id, numericality: { other_than: 1, message: "を入力してください" }
    validates :city
    validates :address_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/}
  end
end