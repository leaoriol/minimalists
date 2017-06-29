class List < ApplicationRecord
  belongs_to :user
  has_many   :items, dependent: :destroy
  validates  :user_id, presence: true
end
