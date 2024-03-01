class Pet < ApplicationRecord
  belongs_to :user

  has_many :daily_logs, dependent: :destroy#destroyは無くすかも
  has_many :health_checks, dependent: :destroy
end
