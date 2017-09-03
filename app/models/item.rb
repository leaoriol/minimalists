class Item < ApplicationRecord
  belongs_to :list
  has_many   :item_to_categories
  default_scope -> { order(created_at: :desc)}
  scope :keep, -> { where(action: ['keep', 'unsure'])}
  scope :discard, -> { where(action: ['donate', 'discard', 'sell'])}

  ACTIONS = ['keep', 'sell', 'donate', 'discard', 'unsure']

  validates :name, presence: true
  validates :list_id, presence: true, numericality: true
  validates :quantity, presence: true
  validates :action, presence: true

  def self.actions()
    return ACTIONS
  end

  def item_count
    item.quantity
  end

  # create a scope
  # scope = easy wya to add query + customize query

end 