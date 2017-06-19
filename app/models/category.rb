class Category < ApplicationRecord
  has_many :item_to_category
  validates :name, presence: true
end
