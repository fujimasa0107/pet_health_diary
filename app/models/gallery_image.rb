class GalleryImage < ApplicationRecord
  belongs_to :user
  belongs_to :daily_log, optional: true

  has_one_attached :image
  
end
