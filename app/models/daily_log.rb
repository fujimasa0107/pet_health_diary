class DailyLog < ApplicationRecord
  belongs_to :pet
  belongs_to :user

  validates :date, presence: true
  validates :food_intake, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :water_intake, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :toilet_count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :exercise_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

end
