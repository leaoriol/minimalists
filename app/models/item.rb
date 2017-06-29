class Item < ApplicationRecord
  belongs_to :list
  has_many   :item_to_categories
  default_scope -> { order(created_at: :desc)}
  validates  :name, presence: true
  validates  :list_id, presence: true
end
