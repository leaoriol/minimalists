class User < ApplicationRecord
  has_one :list
  validates :username, presence: true
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
