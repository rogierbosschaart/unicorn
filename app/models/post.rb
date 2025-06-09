class Post < ApplicationRecord
  belongs_to :agency
  belongs_to :user

  validates :post_text, presence: true
end
