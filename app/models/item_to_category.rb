class ItemToCategory < ApplicationRecord
  belongs_to :item 
  has_one :category 
end
