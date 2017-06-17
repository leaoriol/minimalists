class Item < ApplicationRecord
  belongs_to :list
  has_many :item_to_categories
  validates :name, presence: true
end
