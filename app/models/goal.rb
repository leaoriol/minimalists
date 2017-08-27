class Goal < ApplicationRecord
  belongs_to :user
  validates :overall_goal, presence: true
end
