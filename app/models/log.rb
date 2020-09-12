class Log < ApplicationRecord
  with_options presence: true do
    # validates :user_id
    validates :user_id
    validates :plan_id
    validates :date, uniqueness: { scope: [:plan_id, :user_id] }
    validates :result
  end

  belongs_to :user
  belongs_to :plan
end
