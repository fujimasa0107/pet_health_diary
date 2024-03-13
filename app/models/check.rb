class Check < ApplicationRecord
  belongs_to :article
  belongs_to :user
  belongs_to :category
end
