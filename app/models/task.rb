class Task < ApplicationRecord
  belongs_to :user

  scope :will_do, -> { where(will_do: true) }
  scope :not_do, -> { where(will_do: false) }
  scope :continuous, -> { where(is_continuous: true) }

  def continuous_days
    (Date.today - created_at.to_date).to_i
  end
end