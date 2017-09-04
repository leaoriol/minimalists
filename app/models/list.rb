# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#  goal       :integer
#

class List < ApplicationRecord
  belongs_to :user
  has_many   :items, dependent: :destroy
  validates  :user_id, presence: true
  validates  :name, presence: true, length: { maximum: 255 }
  before_create :set_defaults

  # callback methods - before_create, after_create, before_save, etc.

  def set_defaults
    self.goal = 0
  end

  # class method (starts with self. )

  def self.object_count_for_user(user)
    user.lists.any? ? user.lists.map(&:object_count).sum : 0
  end

  # instance methods 

  def object_count
    items.empty? ? 0 : items.map(&:quantity).sum
  end

  def percent_success
    return 0 if object_count == 0
    ((1 - (object_count - goal ) / object_count.to_f) * 100.00).to_i
  end

  # should be in a helper

  def capitalize
    name.slice(0,1).capitalize + name.slice(1..-1)
  end
end


