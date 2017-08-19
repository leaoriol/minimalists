class Item < ApplicationRecord
  belongs_to :list
  has_many   :item_to_categories
  default_scope -> { order(created_at: :desc)}

  ACTIONS = ['keep', 'sell', 'donate', 'discard', 'unsure']

  validates :name, presence: true
  validates :list_id, presence: true, numericality: true
  validates :quantity, presence: true
  validates :action, presence: true

  def self.actions()
    return ACTIONS
  end

end 