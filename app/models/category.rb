class Category < ApplicationRecord
  belongs_to :item_to_category
  validates :name, presence: true
end
