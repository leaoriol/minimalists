class List < ApplicationRecord
  belongs_to :user
  has_many   :items, dependent: :destroy
  validates  :user_id, presence: true
  validates  :name, presence: true, length: { maximum: 255 }

  def item_quantity
    items.nil? ? 0 : items.count
  end

  def object_quantity
    items.nil? ? 0 : items.map(&:quantity).sum
  end

  def goal_quantity
    goal.nil? ? 0 : goal
  end

  def capitalize
    name.slice(0,1).capitalize + name.slice(1..-1)
  end

  def percent_success
    ((1 - (item_quantity - goal_quantity ) / item_quantity.to_f) * 100.00).to_i
  end
end
