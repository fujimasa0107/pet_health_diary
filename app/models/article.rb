class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :title, length: { maximum: 20 }
    validates :content
    validates :user_id
  end
end
