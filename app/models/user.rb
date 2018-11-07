class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create
end
