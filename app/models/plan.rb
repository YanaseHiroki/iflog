class Plan < ApplicationRecord
  with_options presence: true do
    validates :user_id
    validates :habit
    validates :trigger
    validates :target
  end

  belongs_to :user
  has_many :logs, foreign_key: :plan_id, dependent: :destroy
end
