class Post < ApplicationRecord
  belongs_to :agency
  belongs_to :user
  has_one_attached :photo

  validates :post_text, presence: true
end
