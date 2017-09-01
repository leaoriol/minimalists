class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  has_many  :lists, dependent: :destroy
  has_one   :goal, dependent: :destroy

  def percent_success 
    (total_items - overall_goal ) / total_items.to_f * 100.00
  end

  def overall_goal
    goal.nil? ? 0 : goal.overall_goal
  end

  def total_items
    lists.nil? ? 0 : lists.map(&:items).sum.count
  end

  def total_lists
    lists.nil? ? 0 : lists.count
  end
end
