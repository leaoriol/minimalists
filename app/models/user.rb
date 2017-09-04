# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  name                   :string
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  has_many  :lists, dependent: :destroy
  has_one   :goal, dependent: :destroy

  def object_count
    List.object_count_for_user(self)
  end 

  def goal_count  
    goal&.overall_goal.to_i # nil.to_i returns 0
  end

  def percent_success 
    ((1 - (object_count - goal_count ) / object_count.to_f) * 100.00).to_i
  end


end
