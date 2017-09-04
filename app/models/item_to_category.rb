# == Schema Information
#
# Table name: item_to_categories
#
#  id          :integer          not null, primary key
#  item_id     :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ItemToCategory < ApplicationRecord
  belongs_to :item 
  belongs_to :category 
end
