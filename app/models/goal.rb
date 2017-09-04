# == Schema Information
#
# Table name: goals
#
#  id           :integer          not null, primary key
#  overall_goal :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Goal < ApplicationRecord
  belongs_to :user
  validates :overall_goal, presence: true

end
