class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_one_attached :image

  validates :title, presence: true, length: { maximum: 20 } # タイトルは必須かつ20文字以内
  validates :content, presence: true # コンテンツは必須
end
