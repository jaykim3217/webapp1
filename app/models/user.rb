class User < ApplicationRecord
  has_secure_password validations: true

  validates :name, presence: true
  validates :password_digest, presence: true
  validates :password_confirmation, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }}

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります'}
  has_many :items
  has_many :orders
  has_many :comments

  
end
